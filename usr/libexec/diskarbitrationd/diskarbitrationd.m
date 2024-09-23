uint64_t *sub_1000043B4()
{
  if (!qword_1000244C0 && !sub_1000043F4())
    return 0;
  if (sub_10000445C())
    return &qword_1000244C8;
  return 0;
}

uint64_t sub_1000043F4()
{
  int *v1;

  if (qword_1000244C0)
  {
    rewind((FILE *)qword_1000244C0);
LABEL_4:
    dword_1000244F8 = 0;
    return 1;
  }
  qword_1000244C0 = (uint64_t)fopen("/etc/fstab", "r");
  if (qword_1000244C0)
    goto LABEL_4;
  v1 = __error();
  sub_10000480C(*v1);
  return 0;
}

uint64_t sub_10000445C()
{
  uint64_t result;
  __objc2_meth_list *v1;
  char *v2;
  __objc2_meth_list *v3;
  __objc2_meth_list *v4;
  __objc2_meth_list *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __objc2_meth_list *v13;
  __objc2_meth_list *v14;
  __objc2_meth_list *v15;
  char *v16;
  char *v17;
  const char *v18;
  char *__stringp;
  _BYTE v20[1024];

  result = (uint64_t)fgets(byte_1000244FC, 1024, (FILE *)qword_1000244C0);
  __stringp = (char *)result;
  if (!result)
    return result;
  v1 = &OBJC_INSTANCE_METHODS_FSTaskMessageOperations;
  v2 = byte_1000244FC;
  v3 = &OBJC_INSTANCE_METHODS_FSTaskMessageOperations;
  v4 = &OBJC_INSTANCE_METHODS_FSTaskMessageOperations;
  v5 = &OBJC_INSTANCE_METHODS_FSTaskMessageOperations;
LABEL_3:
  ++dword_1000244F8;
  do
  {
    v6 = strsep(&__stringp, " \t\n");
    if (!v6)
    {
      v1[153] = 0;
LABEL_33:
      result = (uint64_t)fgets(v2, 1024, (FILE *)qword_1000244C0);
      __stringp = (char *)result;
      if (!result)
        return result;
      goto LABEL_3;
    }
  }
  while (!*v6);
  v1[153] = (__objc2_meth_list)v6;
  if (*v6 == 35)
    goto LABEL_33;
  do
    v7 = strsep(&__stringp, " \t\n");
  while (v7 && !*v7);
  v3[154] = (__objc2_meth_list)v7;
  do
    v8 = strsep(&__stringp, " \t\n");
  while (v8 && !*v8);
  v4[155] = (__objc2_meth_list)v8;
  do
  {
    v9 = strsep(&__stringp, " \t\n");
    if (!v9)
    {
      qword_1000244E0 = 0;
      sub_10000480C(79);
      goto LABEL_33;
    }
  }
  while (!*v9);
  qword_1000244E0 = (uint64_t)v9;
  sub_100004930((unsigned __int8 *)qword_1000244C8);
  sub_100004930((unsigned __int8 *)qword_1000244D0);
  qword_1000244F0 = 0;
  while (1)
  {
    v10 = strsep(&__stringp, " \t\n");
    if (!v10)
      break;
    if (*v10)
    {
      LODWORD(qword_1000244F0) = atoi(v10);
      while (1)
      {
        v11 = strsep(&__stringp, " \t\n");
        if (!v11)
          goto LABEL_22;
        if (*v11)
        {
          HIDWORD(qword_1000244F0) = atoi(v11);
          goto LABEL_22;
        }
      }
    }
  }
LABEL_22:
  v12 = v2;
  v13 = v4;
  v14 = v3;
  v15 = v5;
  qword_1000244E8 = (uint64_t)"??";
  __strlcpy_chk(v20, qword_1000244E0, 1024, 1024);
  __stringp = v20;
  v16 = strsep(&__stringp, ",");
  if (!v16)
    return 1;
  v17 = v16;
  while (1)
  {
    if (strlen(v17) != 2)
      goto LABEL_30;
    if (!strcmp(v17, "rw"))
    {
      v18 = "rw";
      goto LABEL_41;
    }
    if (!strcmp(v17, "rq"))
    {
      v18 = "rq";
      goto LABEL_41;
    }
    if (!strcmp(v17, "ro"))
    {
      v18 = "ro";
      goto LABEL_41;
    }
    if (!strcmp(v17, "sw"))
      break;
    if (!strcmp(v17, "xx"))
    {
      v5 = v15;
      v15[157] = (__objc2_meth_list)"xx";
      v3 = v14;
      v4 = v13;
      v2 = v12;
      v1 = &OBJC_INSTANCE_METHODS_FSTaskMessageOperations;
      goto LABEL_33;
    }
LABEL_30:
    v17 = strsep(&__stringp, ",");
    if (!v17)
      return 1;
  }
  v18 = "sw";
LABEL_41:
  v15[157] = (__objc2_meth_list)v18;
  return 1;
}

uint64_t *sub_10000476C(const char *a1)
{
  uint64_t *v2;

  if (sub_1000043F4())
  {
    v2 = &qword_1000244C8;
    while (sub_10000445C())
    {
      if (!strcmp((const char *)qword_1000244C8, a1))
        return v2;
    }
  }
  return 0;
}

uint64_t *sub_1000047BC(const char *a1)
{
  uint64_t *v2;

  if (sub_1000043F4())
  {
    v2 = &qword_1000244C8;
    while (sub_10000445C())
    {
      if (!strcmp((const char *)qword_1000244D0, a1))
        return v2;
    }
  }
  return 0;
}

ssize_t sub_10000480C(int a1)
{
  size_t v2;
  char *v3;
  size_t v4;
  char __str[30];

  write(2, "fstab: ", 7uLL);
  write(2, "/etc/fstab", 0xAuLL);
  write(2, ":", 1uLL);
  snprintf(__str, 0x1EuLL, "%d: ", dword_1000244F8);
  v2 = strlen(__str);
  write(2, __str, v2);
  v3 = strerror(a1);
  v4 = strlen(v3);
  write(2, v3, v4);
  return write(2, "\n", 1uLL);
}

uint64_t sub_100004904()
{
  uint64_t result;

  result = qword_1000244C0;
  if (qword_1000244C0)
  {
    result = fclose((FILE *)qword_1000244C0);
    qword_1000244C0 = 0;
  }
  return result;
}

unsigned __int8 *sub_100004930(unsigned __int8 *result)
{
  _BYTE *i;
  int v2;

  for (i = result; ; ++i)
  {
    v2 = *result;
    if (v2 != 92)
      break;
    v2 = result[1];
    if (v2 == 92)
    {
      ++result;
    }
    else if (v2 == 48 && result[2] == 52)
    {
      if (result[3] == 48)
      {
        result += 3;
        LOBYTE(v2) = 32;
      }
      else
      {
        LOBYTE(v2) = 92;
      }
    }
    else
    {
      LOBYTE(v2) = 92;
    }
LABEL_13:
    *i = v2;
    ++result;
  }
  if (*result)
    goto LABEL_13;
  *i = 0;
  return result;
}

uint64_t *sub_1000049AC()
{
  if (!qword_100024900 && !sub_1000049EC())
    return 0;
  if (sub_100004AB8())
    return &qword_100024908;
  return 0;
}

BOOL sub_1000049EC()
{
  if (qword_100024900)
  {
    rewind((FILE *)qword_100024900);
    return 1;
  }
  else
  {
    qword_100024900 = (uint64_t)fopen("/var/db/volinfo.database", "r");
    return qword_100024900 != 0;
  }
}

uint64_t *sub_100004A3C(const char *a1)
{
  uint64_t *v2;

  if (sub_1000049EC())
  {
    v2 = &qword_100024908;
    while (sub_100004AB8())
    {
      if (!strcmp((const char *)qword_100024908, a1))
        return v2;
    }
  }
  return 0;
}

uint64_t sub_100004A8C()
{
  uint64_t result;

  result = qword_100024900;
  if (qword_100024900)
  {
    result = fclose((FILE *)qword_100024900);
    qword_100024900 = 0;
  }
  return result;
}

char *sub_100004AB8()
{
  char *result;
  char *v1;
  char *v2;
  char *__stringp;

  result = fgets(byte_100024918, 1024, (FILE *)qword_100024900);
  __stringp = result;
  if (result)
  {
    while (1)
    {
      v1 = strsep(&__stringp, ":");
      if (v1)
      {
        if (*v1)
        {
          qword_100024908 = (uint64_t)v1;
          v2 = strsep(&__stringp, "\n");
          if (v2)
          {
            if (*v2)
            {
              dword_100024910 = strtol(v2, &__stringp, 16);
              if (!*__stringp)
                break;
            }
          }
        }
      }
      result = fgets(byte_100024918, 1024, (FILE *)qword_100024900);
      __stringp = result;
      if (!result)
        return result;
    }
    return (char *)1;
  }
  return result;
}

BOOL sub_100004B98(const char *a1)
{
  int v2;
  int v3;
  statfs *v4;
  statfs *v5;
  uint64_t v6;
  const char *f_fstypename;
  size_t v8;

  v2 = getfsstat(0, 0, 2);
  v3 = v2;
  if (v2 >= 1 && (v4 = (statfs *)malloc_type_malloc(2168 * v2, 0x100004087E0324AuLL)) != 0)
  {
    v5 = v4;
    v3 = getfsstat(v4, 2168 * v3, 2);
    if (v3 < 1)
    {
      LODWORD(v6) = 0;
    }
    else
    {
      v6 = 0;
      f_fstypename = v5->f_fstypename;
      while (1)
      {
        if (!strcmp(f_fstypename, "autofs"))
        {
          v8 = strlen(f_fstypename + 16);
          if (!strncmp(f_fstypename + 16, a1, v8))
            break;
        }
        ++v6;
        f_fstypename += 2168;
        if (v3 == v6)
        {
          LODWORD(v6) = v3;
          break;
        }
      }
    }
    free(v5);
  }
  else
  {
    LODWORD(v6) = 0;
  }
  return (int)v6 < v3;
}

uint64_t sub_100004CA0(const std::__fs::filesystem::path *a1, mode_t a2)
{
  std::error_code *v4;
  uint64_t v5;
  uint64_t v6;
  std::__fs::filesystem::path *__from;

  if (!a1)
    return 0xFFFFFFFFLL;
  __from = 0;
  asprintf((char **)&__from, "%s.XXXXXX", (const char *)a1);
  if (!__from)
    return 0xFFFFFFFFLL;
  if (mkdtemp((char *)__from))
  {
    v5 = chmod((const char *)__from, a2);
    if ((_DWORD)v5 || (rename(__from, a1, v4), v5 = v6, (_DWORD)v6))
      rmdir((const char *)__from);
  }
  else
  {
    v5 = 0xFFFFFFFFLL;
  }
  free(__from);
  return v5;
}

void sub_100004D3C()
{
  uint64_t v0;

  v0 = qword_100024D18;
  if (!qword_100024D18)
  {
    qword_100024D20 = os_transaction_create("com.apple.daemon.diskarbitrationd");
    v0 = qword_100024D18;
  }
  qword_100024D18 = v0 + 1;
}

void sub_100004D80()
{
  if (!--qword_100024D18)
  {
    os_release((void *)qword_100024D20);
    qword_100024D20 = 0;
  }
}

uint64_t sub_100004DBC()
{
  return qword_100024D20;
}

const void *sub_100004DC8(const __CFArray *a1, const void *a2)
{
  CFIndex FirstIndexOfValue;
  CFRange v6;

  v6.length = CFArrayGetCount(a1);
  v6.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(a1, v6, a2);
  if (FirstIndexOfValue == -1)
    return 0;
  else
    return CFArrayGetValueAtIndex(a1, FirstIndexOfValue);
}

void sub_100004E20(const __CFArray *a1, const __CFArray *a2)
{
  CFIndex Count;
  unint64_t v5;
  const void *ValueAtIndex;

  Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    v5 = Count + 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v5 - 2);
      if (!sub_100009924(a2, ValueAtIndex))
        CFArrayRemoveValueAtIndex(a1, v5 - 2);
      --v5;
    }
    while (v5 > 1);
  }
}

CFBundleRef sub_100004E90(CFURLRef bundleURL, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  CFBundleRef result;
  __CFBundle *v8;
  CFStringRef v9;

  result = CFBundleCreate(kCFAllocatorDefault, bundleURL);
  if (result)
  {
    v8 = result;
    _CFBundleSetStringsFilesShared(result, 0);
    v9 = CFBundleCopyLocalizedString(v8, a2, a3, a4);
    CFRelease(v8);
    return (CFBundleRef)v9;
  }
  return result;
}

CFURLRef sub_100004F04(const __CFURL *a1, const __CFString *a2)
{
  const __CFURL *v3;
  const __CFURL *v4;
  CFStringRef PathComponent;
  const __CFString *v6;
  const __CFURL *v7;
  const __CFURL *v8;
  const __CFString *v9;
  const __CFString *v10;
  CFURLRef v11;

  v3 = CFURLCreateWithFileSystemPathRelativeToBase(kCFAllocatorDefault, a2, kCFURLPOSIXPathStyle, 0, 0);
  if (!v3)
    return 0;
  v4 = v3;
  PathComponent = CFURLCopyLastPathComponent(v3);
  if (PathComponent)
  {
    v6 = PathComponent;
    v7 = CFURLCreateCopyDeletingLastPathComponent(kCFAllocatorDefault, v4);
    if (v7)
    {
      v8 = v7;
      v9 = CFURLCopyFileSystemPath(v7, kCFURLPOSIXPathStyle);
      if (v9)
      {
        v10 = v9;
        v11 = CFBundleCopyResourceURLInDirectory(a1, v6, 0, v9);
        CFRelease(v10);
      }
      else
      {
        v11 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v11 = 0;
  }
  CFRelease(v4);
  return v11;
}

__CFData *sub_100004FE4(const __CFAllocator *a1, const __CFString *a2)
{
  __CFData *Mutable;
  CFIndex Length;
  CFIndex v5;
  CFIndex v6;
  unsigned int CharacterAtIndex;
  unsigned int v8;
  __darwin_ct_rune_t v9;
  unsigned __int16 v10;
  __int16 v11;
  __int16 v12;
  char v13;
  unsigned int v14;
  UInt8 bytes;

  Mutable = CFDataCreateMutable(a1, 0);
  if (Mutable)
  {
    Length = CFStringGetLength(a2);
    if (Length < 2)
    {
      v6 = 0;
    }
    else
    {
      v5 = 1;
      while (1)
      {
        v6 = v5 - 1;
        bytes = 0;
        CharacterAtIndex = CFStringGetCharacterAtIndex(a2, v5 - 1);
        v8 = CFStringGetCharacterAtIndex(a2, v5);
        if (CharacterAtIndex > 0xFF)
          break;
        if ((_DefaultRuneLocale.__runetype[CharacterAtIndex] & 0x10000) == 0)
          break;
        v9 = v8;
        if (v8 > 0xFF || (_DefaultRuneLocale.__runetype[v8] & 0x10000) == 0)
          break;
        v10 = __tolower(CharacterAtIndex) - 48;
        v11 = __tolower(v9);
        v12 = v11 - 48;
        if (v10 <= 9u)
          v13 = 16 * v10;
        else
          v13 = 16 * v10 - 112;
        if ((v12 & 0xFFFEu) > 9)
          LOBYTE(v12) = v11 - 87;
        bytes = v13 | v12;
        CFDataAppendBytes(Mutable, &bytes, 1);
        v5 += 2;
        if (v5 >= Length)
        {
          v6 = v5 - 1;
          break;
        }
      }
    }
    if (v6 < Length)
    {
      do
      {
        v14 = CFStringGetCharacterAtIndex(a2, v6);
        if (v14 > 0x7F)
        {
          if (!__maskrune(v14, 0x4000uLL))
          {
LABEL_23:
            CFDataSetLength(Mutable, 0);
            break;
          }
        }
        else if ((_DefaultRuneLocale.__runetype[v14] & 0x4000) == 0)
        {
          goto LABEL_23;
        }
        ++v6;
      }
      while (Length != v6);
    }
    if (!CFDataGetLength(Mutable))
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

CFTypeRef sub_100005194(uint64_t a1, const __CFString *a2)
{
  const __CFData *ExternalRepresentation;
  const __CFData *v3;
  CFPropertyListRef v4;
  const void *v5;
  CFTypeID v6;
  CFTypeRef v7;

  ExternalRepresentation = CFStringCreateExternalRepresentation(kCFAllocatorDefault, a2, 0x8000100u, 0);
  if (!ExternalRepresentation)
    return 0;
  v3 = ExternalRepresentation;
  v4 = CFPropertyListCreateWithData(kCFAllocatorDefault, ExternalRepresentation, 0, 0, 0);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 == CFDictionaryGetTypeID())
      v7 = CFRetain(v5);
    else
      v7 = 0;
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

const void *sub_100005248(const __CFDictionary *a1)
{
  CFIndex Count;
  const void **v3;
  const void **v4;
  const void *v5;

  Count = CFDictionaryGetCount(a1);
  if (!Count)
    return 0;
  v3 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
  if (!v3)
    return 0;
  v4 = v3;
  CFDictionaryGetKeysAndValues(a1, 0, v3);
  v5 = *v4;
  free(v4);
  return v5;
}

UInt8 *sub_1000052B4(char *cStr, va_list a2)
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  UInt8 *v7;

  if (!cStr)
    return 0;
  v3 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, v3, a2);
  if (v5)
  {
    v6 = v5;
    v7 = sub_100009BF4(v5);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

BOOL sub_10000534C(const __CFString *a1, UInt8 *a2, uint64_t a3)
{
  CFIndex v5;
  CFIndex v6;
  CFIndex usedBufLen;
  CFRange v9;

  v5 = a3 - 1;
  usedBufLen = a3 - 1;
  v9.length = CFStringGetLength(a1);
  v9.location = 0;
  CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, a2, v5, &usedBufLen);
  v6 = usedBufLen;
  a2[usedBufLen] = 0;
  return v6 != 0;
}

void sub_1000053C8(__CFString *a1, CFIndex a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_1000053F0(a1, a2, a3, &a9);
}

void sub_1000053F0(__CFString *a1, CFIndex a2, const __CFString *a3, va_list a4)
{
  const __CFString *v6;
  const __CFString *v7;

  v6 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a3, a4);
  if (v6)
  {
    v7 = v6;
    CFStringInsert(a1, a2, v6);
    CFRelease(v7);
  }
}

void sub_100005458(__CFString *a1, const __CFString *a2, CFIndex a3, CFIndex a4)
{
  if (CFStringGetLength(a1) < a3)
    CFStringPad(a1, a2, a3, a4);
}

CFUUIDRef sub_1000054B4(const __CFAllocator *a1, CFUUIDRef uuid, const __CFData *a3)
{
  const UInt8 *BytePtr;
  CC_LONG Length;
  uint64_t v7;
  CFUUIDBytes data;
  CC_SHA256_CTX c;
  uint64_t byte7;
  uint64_t byte13;
  unsigned __int8 md[16];
  __int128 v14;

  memset(&c, 0, sizeof(c));
  *(_OWORD *)md = 0u;
  v14 = 0u;
  data = CFUUIDGetUUIDBytes(uuid);
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, &data, 0x10u);
  BytePtr = CFDataGetBytePtr(a3);
  Length = CFDataGetLength(a3);
  CC_SHA256_Update(&c, BytePtr, Length);
  CC_SHA256_Final(md, &c);
  v7 = 0;
  byte7 = 0;
  byte13 = 0;
  do
  {
    *((_BYTE *)&byte7 + (v7 & 0xF)) ^= md[v7];
    ++v7;
  }
  while (v7 != 32);
  return CFUUIDCreateWithBytes(a1, byte7, BYTE1(byte7), BYTE2(byte7), BYTE3(byte7), BYTE4(byte7), BYTE5(byte7), BYTE6(byte7) & 0xF | 0x40u, HIBYTE(byte7), byte13 & 0x3F | 0x80, BYTE1(byte13), BYTE2(byte13), BYTE3(byte13), BYTE4(byte13), BYTE5(byte13), BYTE6(byte13), HIBYTE(byte13));
}

CFUUIDRef sub_100005608(const __CFAllocator *a1, CFStringRef theString)
{
  uint64_t Length;
  unint64_t v5;
  unsigned int CharacterAtIndex;

  Length = CFStringGetLength(theString);
  if (!Length)
    return CFUUIDCreateFromString(a1, theString);
  v5 = 0;
  while (1)
  {
    CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v5);
    if (v5 <= 0x23)
      break;
    if (CharacterAtIndex > 0x7F)
    {
      if (!__maskrune(CharacterAtIndex, 0x4000uLL))
        return 0;
    }
    else if ((_DefaultRuneLocale.__runetype[CharacterAtIndex] & 0x4000) == 0)
    {
      return 0;
    }
LABEL_15:
    if (Length == ++v5)
      return CFUUIDCreateFromString(a1, theString);
  }
  if (v5 <= 0x17 && ((1 << v5) & 0x842100) != 0)
  {
    if (CharacterAtIndex != 45)
      return 0;
    goto LABEL_15;
  }
  if (CharacterAtIndex <= 0xFF && (_DefaultRuneLocale.__runetype[CharacterAtIndex] & 0x10000) != 0)
    goto LABEL_15;
  return 0;
}

const __CFString *sub_10000570C(const __CFURL *a1, CFURLPathStyle a2)
{
  const __CFString *v3;
  CFStringRef PathComponent;
  const __CFString *v5;
  const __CFAllocator *v6;
  CFMutableStringRef MutableCopy;
  __CFString *v8;
  CFIndex Length;
  CFIndex v10;

  v3 = CFURLCopyFileSystemPath(a1, a2);
  if (v3)
  {
    PathComponent = CFURLCopyLastPathComponent(a1);
    if (PathComponent)
    {
      v5 = PathComponent;
      v6 = CFGetAllocator(a1);
      MutableCopy = CFStringCreateMutableCopy(v6, 0, v3);
      if (MutableCopy)
      {
        v8 = MutableCopy;
        Length = CFStringGetLength(v3);
        v10 = CFStringGetLength(v5);
        CFStringInsert(v8, Length - v10, CFSTR("r"));
        CFRelease(v3);
        v3 = v8;
      }
      CFRelease(v5);
    }
  }
  return v3;
}

uint64_t sub_1000057A8(io_registry_entry_t a1, const char *a2, char *a3)
{
  uint64_t v6;
  uint64_t Path;
  kern_return_t LocationInPlane;
  size_t v9;
  char *v10;
  const char *v11;
  size_t v12;
  io_registry_entry_t parent;
  io_name_t location;
  char name[136];

  v6 = 3758097090;
  Path = IORegistryEntryGetPath(a1, a2, a3);
  if ((_DWORD)Path == -536870206)
  {
    parent = 0;
    Path = IORegistryEntryGetParentEntry(a1, a2, &parent);
    if (!(_DWORD)Path)
    {
      Path = sub_1000057A8(parent, a2, a3);
      if ((_DWORD)Path)
        goto LABEL_12;
      memset(name, 0, 128);
      Path = IORegistryEntryGetNameInPlane(a1, a2, name);
      if ((_DWORD)Path)
        goto LABEL_12;
      memset(location, 0, sizeof(location));
      LocationInPlane = IORegistryEntryGetLocationInPlane(a1, a2, location);
      v9 = strlen(a3);
      if (LocationInPlane)
      {
        v10 = name;
        if (v9 + strlen(name) + 1 <= 0x3FF)
        {
          v11 = "/";
LABEL_10:
          strlcat(a3, v11, 0x400uLL);
          strlcat(a3, v10, 0x400uLL);
          v6 = 0;
        }
      }
      else
      {
        v12 = strlen(name);
        if (v9 + v12 + strlen(location) + 2 <= 0x3FF)
        {
          strlcat(a3, "/", 0x400uLL);
          strlcat(a3, name, 0x400uLL);
          v10 = location;
          v11 = "@";
          goto LABEL_10;
        }
      }
      Path = v6;
LABEL_12:
      IOObjectRelease(parent);
    }
  }
  return Path;
}

__CFDictionary *sub_100005974(const __CFAllocator *a1, const void *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, const void *a7, const void *a8)
{
  __CFDictionary *Mutable;
  __CFDictionary *v16;

  Mutable = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v16 = Mutable;
  if (Mutable)
  {
    CFDictionarySetValue(Mutable, CFSTR("DACallbackSession"), a2);
    sub_100009B0C(v16, CFSTR("DACallbackAddress"), a3);
    sub_100009B0C(v16, CFSTR("DACallbackContext"), a4);
    sub_100009B0C(v16, CFSTR("DACallbackKind"), a5);
    sub_100009B0C(v16, CFSTR("DACallbackOrder"), a6);
    if (a7)
      CFDictionarySetValue(v16, CFSTR("DACallbackMatch"), a7);
    if (a8)
      CFDictionarySetValue(v16, CFSTR("DACallbackWatch"), a8);
  }
  return v16;
}

CFMutableDictionaryRef sub_100005A78(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  return CFDictionaryCreateMutableCopy(a1, 0, theDict);
}

const __CFNumber *sub_100005A84(const __CFDictionary *a1)
{
  return sub_100009AD8(a1, CFSTR("DACallbackAddress"));
}

const void *sub_100005A90(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DACallbackArgument0"));
}

const void *sub_100005A9C(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DACallbackArgument1"));
}

const __CFNumber *sub_100005AA8(const __CFDictionary *a1)
{
  return sub_100009AD8(a1, CFSTR("DACallbackContext"));
}

const void *sub_100005AB4(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DACallbackDisk"));
}

const __CFNumber *sub_100005AC0(const __CFDictionary *a1)
{
  return sub_100009AD8(a1, CFSTR("DACallbackKind"));
}

const void *sub_100005ADC(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DACallbackMatch"));
}

const __CFNumber *sub_100005AE8(const __CFDictionary *a1)
{
  return sub_100009AD8(a1, CFSTR("DACallbackOrder"));
}

const void *sub_100005B04(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DACallbackSession"));
}

double sub_100005B10(const __CFDictionary *a1)
{
  const __CFDate *Value;

  Value = (const __CFDate *)CFDictionaryGetValue(a1, CFSTR("DACallbackTime"));
  if (Value)
    return CFDateGetAbsoluteTime(Value);
  else
    return 0.0;
}

const void *sub_100005B3C(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DACallbackWatch"));
}

void sub_100005B48(__CFDictionary *a1, void *value)
{
  if (value)
    CFDictionarySetValue(a1, CFSTR("DACallbackArgument0"), value);
  else
    CFDictionaryRemoveValue(a1, CFSTR("DACallbackArgument0"));
}

void sub_100005B60(__CFDictionary *a1, void *value)
{
  if (value)
    CFDictionarySetValue(a1, CFSTR("DACallbackArgument1"), value);
  else
    CFDictionaryRemoveValue(a1, CFSTR("DACallbackArgument1"));
}

void sub_100005B78(__CFDictionary *a1, void *value)
{
  if (value)
    CFDictionarySetValue(a1, CFSTR("DACallbackDisk"), value);
  else
    CFDictionaryRemoveValue(a1, CFSTR("DACallbackDisk"));
}

void sub_100005B90(__CFDictionary *a1, void *value)
{
  if (value)
    CFDictionarySetValue(a1, CFSTR("DACallbackMatch"), value);
  else
    CFDictionaryRemoveValue(a1, CFSTR("DACallbackMatch"));
}

void sub_100005BA8(__CFDictionary *a1, void *value)
{
  if (value)
    CFDictionarySetValue(a1, CFSTR("DACallbackSession"), value);
  else
    CFDictionaryRemoveValue(a1, CFSTR("DACallbackSession"));
}

void sub_100005BC0(__CFDictionary *a1, CFAbsoluteTime a2)
{
  CFDateRef v3;
  CFDateRef v4;

  v3 = CFDateCreate(kCFAllocatorDefault, a2);
  if (v3)
  {
    v4 = v3;
    CFDictionarySetValue(a1, CFSTR("DACallbackTime"), v3);
    CFRelease(v4);
  }
}

uint64_t sub_100005C18()
{
  uint64_t v0;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  integer_t port_info;

  pthread_mutex_lock(&stru_1000243A0);
  if (dword_100024D28)
  {
LABEL_2:
    v0 = sub_100013AFC();
    qword_100024D30 = dispatch_mach_create_f("diskarbitrationd/command", v0, 0, sub_100005DD0);
    dispatch_mach_connect(qword_100024D30, dword_100024D28, dword_100024D28, 0);
    goto LABEL_3;
  }
  if (!mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_100024D28)
    && !mach_port_insert_right(mach_task_self_, dword_100024D28, dword_100024D28, 0x14u))
  {
    port_info = 1;
    mach_port_set_attributes(mach_task_self_, dword_100024D28, 1, &port_info, 1u);
  }
  if (dword_100024D28)
  {
    v2 = sub_100013AFC();
    v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x14uLL, 0, v2);
    if (!v3)
    {
      mach_port_mod_refs(mach_task_self_, dword_100024D28, 1u, -1);
      dword_100024D28 = 0;
      goto LABEL_3;
    }
    v4 = v3;
    dispatch_source_set_event_handler(v3, &stru_100020C38);
    dispatch_resume(v4);
    if (!dword_100024D28)
      goto LABEL_3;
    goto LABEL_2;
  }
LABEL_3:
  pthread_mutex_unlock(&stru_1000243A0);
  return qword_100024D30;
}

void sub_100005D60(id a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;

  v5 = 0;
  v3 = dword_100024D28;
  v4 = 0;
  v2 = 0x1800000013;
  v1 = dispatch_mach_msg_create(&v2, 24, 0, 0);
  dispatch_mach_send(qword_100024D30, v1, 0);
  dispatch_release(v1);
}

void sub_100005DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_msg_header_t *msg;
  pid_t v4;
  pid_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  __CFData *Mutable;
  UInt8 *v11;
  UInt8 *v12;
  int v13;
  int v14;
  int v15;

  if (a2 == 2)
  {
    v15 = 0;
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0);
    v4 = waitpid(-1, &v15, 1);
    if (v4 >= 1)
    {
      for (i = v4; i > 0; i = waitpid(-1, &v15, 1))
      {
        pthread_mutex_lock(&stru_1000243A0);
        v6 = qword_100024D38;
        if (qword_100024D38)
        {
          v7 = 0;
          while (1)
          {
            v8 = v6;
            if (*(_DWORD *)v6 != 1)
              sub_10001AE58();
            if (*(_DWORD *)(v6 + 16) == i)
              break;
            v6 = *(_QWORD *)(v6 + 8);
            v7 = v8;
            if (!v6)
              goto LABEL_27;
          }
          if (v7)
            v9 = (uint64_t *)(v7 + 8);
          else
            v9 = &qword_100024D38;
          *v9 = *(_QWORD *)(v6 + 8);
          pthread_mutex_unlock(&stru_1000243A0);
          if (*(_DWORD *)(v8 + 20) == -1)
          {
            Mutable = 0;
          }
          else
          {
            Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
            if (Mutable)
            {
              v11 = (UInt8 *)malloc_type_malloc(0x200uLL, 0xCB0F112EuLL);
              if (v11)
              {
                v12 = v11;
                v13 = read(*(_DWORD *)(v8 + 20), v11, 0x200uLL);
                if (v13 >= 1)
                {
                  do
                  {
                    CFDataAppendBytes(Mutable, v12, v13);
                    v13 = read(*(_DWORD *)(v8 + 20), v12, 0x200uLL);
                  }
                  while (v13 > 0);
                }
                free(v12);
              }
            }
            close(*(_DWORD *)(v8 + 20));
          }
          if ((v15 & 0x7F) != 0)
            v14 = v15;
          else
            v14 = (__int16)v15 >> 8;
          v15 = v14;
          (*(void (**)(void))(v8 + 24))();
          if (Mutable)
            CFRelease(Mutable);
          free((void *)v8);
          pthread_mutex_lock(&stru_1000243A0);
        }
LABEL_27:
        pthread_mutex_unlock(&stru_1000243A0);
      }
    }
    mach_msg_destroy(msg);
  }
}

void sub_100005FB8(const __CFURL *a1, char a2, uid_t a3, gid_t a4, int a5, void (*a6)(uint64_t, _QWORD, uint64_t), uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  size_t v17;
  uint64_t *v18;
  char **v19;
  char **v20;
  UInt8 *v21;
  uint64_t v22;
  UInt8 **v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  int v29;
  uint64_t v30;
  pid_t v31;
  pid_t v32;
  _QWORD *v33;
  uint64_t v34;
  int v35;
  char v36;
  char *v37;
  char **v38;
  char *v39;
  const char *v40;
  char ***v41;
  int v42;
  uint64_t *v43;
  uint64_t *v44;
  posix_spawn_file_actions_t v45;
  posix_spawnattr_t v46;
  int v47[2];

  v43 = &a9;
  v17 = 8;
  do
  {
    v18 = v43++;
    v17 += 8;
  }
  while (*v18);
  v19 = (char **)malloc_type_malloc(v17, 0x10040436913F5uLL);
  if (!v19)
  {
    v29 = 1;
    v30 = 70;
    if (!a6)
      return;
    goto LABEL_42;
  }
  v20 = v19;
  bzero(v19, v17);
  v21 = sub_100009CC0(a1);
  *v20 = (char *)v21;
  if (v21)
  {
    v42 = a5;
    v44 = &a10;
    v22 = a9;
    if (a9)
    {
      v23 = (UInt8 **)(v20 + 1);
      while (1)
      {
        v24 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@"), v22);
        if (v24)
        {
          v25 = v24;
          *v23 = sub_100009BF4(v24);
          CFRelease(v25);
        }
        if (!*v23)
          break;
        v26 = v44++;
        v22 = *v26;
        ++v23;
        if (!v22)
          goto LABEL_11;
      }
      v30 = 70;
      v29 = 1;
    }
    else
    {
LABEL_11:
      *(_QWORD *)v47 = -1;
      if (!dword_100024D28)
        sub_10001AE80();
      if ((a2 & 1) != 0 && pipe(v47))
      {
        v27 = 66;
        v28 = 1;
      }
      else
      {
        pthread_mutex_lock(&stru_1000243A0);
        v31 = fork();
        if (!v31)
        {
          v45 = 0;
          v46 = 0;
          if (setgid(a4) == -1 || setuid(a3) == -1)
            _exit(77);
          if (v47[1] != -1)
          {
            dup2(v47[1], 1);
            close(v47[1]);
          }
          if (!posix_spawnattr_init(&v46))
          {
            if (!posix_spawn_file_actions_init(&v45))
            {
              if (!posix_spawnattr_setflags(&v46, 16448)
                && !posix_spawn_file_actions_addinherit_np(&v45, 1)
                && !posix_spawn_file_actions_addinherit_np(&v45, 2)
                && !posix_spawn_file_actions_addinherit_np(&v45, 0)
                && (v42 < 0 || !posix_spawn_file_actions_addinherit_np(&v45, v42)))
              {
                v40 = *v20;
                v41 = _NSGetEnviron();
                posix_spawn(0, v40, &v45, &v46, v20, *v41);
              }
              posix_spawn_file_actions_destroy(&v45);
            }
            posix_spawnattr_destroy(&v46);
          }
          _exit(71);
        }
        v32 = v31;
        if (a6)
        {
          if (v31 != -1)
          {
            v33 = malloc_type_malloc(0x28uLL, 0x10A00404821B814uLL);
            if (v33)
            {
              v34 = (uint64_t)v33;
              *(_DWORD *)v33 = 1;
              v33[1] = qword_100024D38;
              *((_DWORD *)v33 + 4) = v32;
              v35 = v47[0];
              if (v47[0] != -1)
                v35 = dup(v47[0]);
              *(_DWORD *)(v34 + 20) = v35;
              *(_QWORD *)(v34 + 24) = a6;
              *(_QWORD *)(v34 + 32) = a7;
              qword_100024D38 = v34;
            }
          }
        }
        pthread_mutex_unlock(&stru_1000243A0);
        v28 = v32 == -1;
        if (v32 == -1)
          v27 = 71;
        else
          v27 = 0;
      }
      if (v47[0] != -1)
        close(v47[0]);
      if (v47[1] != -1)
        close(v47[1]);
      v36 = !v28;
      if (!a6)
        v36 = 1;
      if ((v36 & 1) == 0)
        a6(v27, 0, a7);
      v29 = 0;
      v30 = 0;
    }
    v37 = *v20;
    if (*v20)
    {
      v38 = v20 + 1;
      do
      {
        free(v37);
        v39 = *v38++;
        v37 = v39;
      }
      while (v39);
    }
  }
  else
  {
    v29 = 1;
    v30 = 65;
  }
  free(v20);
  if (a6)
  {
LABEL_42:
    if (v29)
      a6(v30, 0, a7);
  }
}

void sub_100006380(uint64_t a1)
{
  sub_10000A748("disk is not readable %@", a1);
}

void sub_1000063A8(uint64_t a1)
{
  sub_10000A748("disk is not repairable %@", a1);
}

uint64_t sub_1000063D0(uint64_t a1, const void *a2, const void *a3)
{
  const void *Value;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
  if (Value == a3)
    return 0;
  if (!Value)
    return -1;
  if (!a3)
    return 1;
  if (CFEqual(Value, a3))
    return 0;
  return -1;
}

uint64_t sub_10000642C(CFAllocatorRef allocator, io_registry_entry_t entry)
{
  io_object_t v4;
  io_object_t v5;
  uint64_t v6;
  const char *v7;
  const __CFString *Value;
  size_t v9;
  CFURLRef v10;
  const void *v11;
  const void *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  const __CFNumber *v17;
  const __CFNumber *v18;
  const void *v19;
  const void *v20;
  CFTypeRef v21;
  const void *v22;
  const void *v23;
  CFStringRef v25;
  CFStringRef v26;
  const void *v27;
  const void *v28;
  const __CFString *v29;
  CFUUIDRef v30;
  CFUUIDRef v31;
  const void *v32;
  const void *v33;
  const __CFDictionary *v34;
  const __CFDictionary *v35;
  const __CFString *v36;
  const __CFString *v37;
  const void *v38;
  const __CFDictionary *v39;
  const __CFDictionary *v40;
  const void *v41;
  const void *v42;
  const void *v43;
  CFStringRef v44;
  CFStringRef v45;
  CFTypeRef v46;
  const void *v47;
  const __CFNumber *v48;
  const __CFNumber *v49;
  CFDataRef v50;
  CFDataRef v51;
  CFTypeRef v52;
  const void *v53;
  CFNumberRef v54;
  CFNumberRef v55;
  CFBooleanRef v56;
  const __CFNumber *v57;
  const __CFNumber *v58;
  CFTypeID v59;
  uid_t v60;
  passwd *v61;
  const __CFNumber *v62;
  const __CFNumber *v63;
  CFTypeID v64;
  const __CFNumber *v65;
  const __CFNumber *v66;
  CFTypeID v67;
  const __CFString *v68;
  const __CFString *v69;
  CFTypeID v70;
  CFStringRef v71;
  CFStringRef v72;
  CFStringRef v73;
  CFStringRef v74;
  io_registry_entry_t entrya;
  io_object_t object;
  UInt8 bytes[8];
  CFAbsoluteTime Current;
  io_iterator_t iterator;
  CFMutableDictionaryRef properties;
  int v81;
  uint64_t valuePtr;
  char __s[16];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  char buffer[16];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;

  valuePtr = 0;
  v81 = 0;
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  *(_OWORD *)buffer = 0u;
  v116 = 0u;
  properties = 0;
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  *(_OWORD *)__s = 0u;
  v84 = 0u;
  iterator = 0;
  Current = 0.0;
  if (IORegistryEntryCreateCFProperties(entry, &properties, allocator, 0)
    || (Value = (const __CFString *)CFDictionaryGetValue(properties, CFSTR("BSD Name"))) == 0
    || !CFStringGetCString(Value, buffer, 128, 0x8000100u))
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
LABEL_3:
    if (!sub_1000057A8(entry, "IOService", __s))
    {
      if (v6)
        v7 = *(const char **)(v6 + 144);
      else
        v7 = 0;
      sub_10000A748("unable to create disk, id = %s.", v7);
    }
    if (v4)
      IOObjectRelease(v4);
    if (v5)
      IOObjectRelease(v5);
    if (v6)
      CFRelease((CFTypeRef)v6);
    if (properties)
      CFRelease(properties);
    return 0;
  }
  __strlcpy_chk(__s, "/dev/", 1024, 1024);
  __strlcat_chk(__s, buffer, 1024, 1024);
  v6 = sub_100007238(allocator, __s);
  if (!v6)
    goto LABEL_20;
  v9 = strlen(__s);
  v10 = CFURLCreateFromFileSystemRepresentation(allocator, (const UInt8 *)__s, v9, 0);
  *(_QWORD *)(v6 + 72) = v10;
  if (!v10)
    goto LABEL_20;
  *(_QWORD *)(v6 + 104) = strdup(__s);
  __strlcpy_chk(__s, "/dev/", 1024, 1024);
  __strlcat_chk(__s, "r", 1024, 1024);
  __strlcat_chk(__s, buffer, 1024, 1024);
  *(_QWORD *)(v6 + 112) = strdup(__s);
  IOObjectRetain(entry);
  *(_DWORD *)(v6 + 152) = entry;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAVolumeNetwork"), kCFBooleanFalse);
  v11 = CFDictionaryGetValue(properties, CFSTR("Preferred Block Size"));
  if (!v11)
    goto LABEL_20;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaBlockSize"), v11);
  v12 = CFDictionaryGetValue(properties, CFSTR("BSD Name"));
  if (!v12)
    goto LABEL_20;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaBSDName"), v12);
  v13 = (const __CFNumber *)CFDictionaryGetValue(properties, CFSTR("BSD Major"));
  if (!v13)
    goto LABEL_20;
  v14 = v13;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaBSDMajor"), v13);
  CFNumberGetValue(v14, kCFNumberSInt32Type, &valuePtr);
  v15 = (const __CFNumber *)CFDictionaryGetValue(properties, CFSTR("BSD Minor"));
  if (!v15)
    goto LABEL_20;
  v16 = v15;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaBSDMinor"), v15);
  CFNumberGetValue(v16, kCFNumberSInt32Type, &v81);
  *(_DWORD *)(v6 + 96) = v81 | ((_DWORD)valuePtr << 24);
  v17 = (const __CFNumber *)CFDictionaryGetValue(properties, CFSTR("BSD Unit"));
  if (!v17)
    goto LABEL_20;
  v18 = v17;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaBSDUnit"), v17);
  CFNumberGetValue(v18, kCFNumberSInt32Type, (void *)(v6 + 128));
  v19 = CFDictionaryGetValue(properties, CFSTR("Content"));
  if (!v19)
    goto LABEL_20;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaContent"), v19);
  v20 = CFDictionaryGetValue(properties, CFSTR("Ejectable"));
  if (!v20)
    goto LABEL_20;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaEjectable"), v20);
  v21 = IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("IOMediaIcon"), allocator, 3u);
  if (!v21)
    goto LABEL_20;
  v22 = v21;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaIcon"), v21);
  CFRelease(v22);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaKind"), CFSTR("IOMedia"));
  v23 = CFDictionaryGetValue(properties, CFSTR("Leaf"));
  if (!v23)
    goto LABEL_20;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaLeaf"), v23);
  if (IORegistryEntryGetName(entry, buffer))
    goto LABEL_20;
  v25 = CFStringCreateWithCString(allocator, buffer, 0x8000100u);
  if (!v25)
  {
    v25 = CFStringCreateWithCString(allocator, buffer, 0);
    if (!v25)
      goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaName"), v25);
  CFRelease(v25);
  if (sub_1000057A8(entry, "IODeviceTree", __s))
  {
    if (sub_1000057A8(entry, "IOService", __s))
      goto LABEL_20;
  }
  v26 = CFStringCreateWithCString(allocator, __s, 0x8000100u);
  if (!v26)
  {
    v26 = CFStringCreateWithCString(allocator, __s, 0);
    if (!v26)
      goto LABEL_20;
  }
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaPath"), v26);
  CFRelease(v26);
  v27 = CFDictionaryGetValue(properties, CFSTR("Removable"));
  if (!v27)
    goto LABEL_20;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaRemovable"), v27);
  v28 = CFDictionaryGetValue(properties, CFSTR("Size"));
  if (!v28)
    goto LABEL_20;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaSize"), v28);
  v29 = (const __CFString *)CFDictionaryGetValue(properties, CFSTR("UUID"));
  if (!v29)
    goto LABEL_44;
  v30 = sub_100005608(allocator, v29);
  if (!v30)
  {
LABEL_20:
    v4 = 0;
    v5 = 0;
    goto LABEL_3;
  }
  v31 = v30;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaUUID"), v30);
  CFRelease(v31);
LABEL_44:
  v32 = CFDictionaryGetValue(properties, CFSTR("Whole"));
  if (!v32)
    goto LABEL_20;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaWhole"), v32);
  v33 = CFDictionaryGetValue(properties, CFSTR("Writable"));
  if (!v33)
    goto LABEL_20;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAMediaWritable"), v33);
  CFRelease(properties);
  properties = 0;
  if (IORegistryEntryCreateIterator(entry, "IOService", 3u, &iterator))
    goto LABEL_20;
  object = IOIteratorNext(iterator);
  if (object)
  {
    while (!IOObjectConformsTo(object, "IOBlockStorageDevice"))
    {
      IOObjectRelease(object);
      object = IOIteratorNext(iterator);
      if (!object)
        goto LABEL_50;
    }
  }
  else
  {
LABEL_50:
    object = 0;
  }
  IOObjectRelease(iterator);
  iterator = 0;
  if (!object)
    goto LABEL_20;
  if (IORegistryEntryCreateCFProperties(object, &properties, allocator, 0))
  {
    v5 = object;
    v4 = 0;
    goto LABEL_3;
  }
  v34 = (const __CFDictionary *)CFDictionaryGetValue(properties, CFSTR("Protocol Characteristics"));
  if (v34)
  {
    v35 = v34;
    v36 = (const __CFString *)CFDictionaryGetValue(v34, CFSTR("Physical Interconnect Location"));
    if (v36)
    {
      v37 = v36;
      if (CFStringCompare(v36, CFSTR("Internal"), 0))
      {
        if (CFStringCompare(v37, CFSTR("External"), 0) == kCFCompareEqualTo)
        {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DADeviceInternal"), kCFBooleanFalse);
          *(_DWORD *)(v6 + 176) |= 0x10u;
        }
      }
      else
      {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DADeviceInternal"), kCFBooleanTrue);
      }
    }
    v38 = CFDictionaryGetValue(v35, CFSTR("Physical Interconnect"));
    if (v38)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DADeviceProtocol"), v38);
  }
  v39 = (const __CFDictionary *)CFDictionaryGetValue(properties, CFSTR("Device Characteristics"));
  if (v39)
  {
    v40 = v39;
    v41 = CFDictionaryGetValue(v39, CFSTR("Product Name"));
    if (v41)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DADeviceModel"), v41);
    v42 = CFDictionaryGetValue(v40, CFSTR("Product Revision Level"));
    if (v42)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DADeviceRevision"), v42);
    v43 = CFDictionaryGetValue(v40, CFSTR("Vendor Name"));
    if (v43)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DADeviceVendor"), v43);
  }
  if (sub_1000057A8(object, "IOService", __s))
    goto LABEL_70;
  v44 = CFStringCreateWithCString(allocator, __s, 0x8000100u);
  if (!v44)
    goto LABEL_70;
  v45 = v44;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DADevicePath"), v44);
  CFRelease(v45);
  v46 = IORegistryEntrySearchCFProperty(object, "IOService", CFSTR("IOUnit"), allocator, 3u);
  if (v46)
  {
    v47 = v46;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DADeviceUnit"), v46);
    CFRelease(v47);
  }
  v48 = (const __CFNumber *)IORegistryEntrySearchCFProperty(object, "IOService", CFSTR("GUID"), allocator, 3u);
  if (!v48)
    goto LABEL_77;
  v49 = v48;
  *(_QWORD *)bytes = 0;
  CFNumberGetValue(v48, kCFNumberSInt64Type, bytes);
  CFRelease(v49);
  *(_QWORD *)bytes = bswap64(*(unint64_t *)bytes);
  v50 = CFDataCreate(allocator, bytes, 8);
  if (!v50)
  {
LABEL_70:
    v4 = 0;
    v5 = object;
    goto LABEL_3;
  }
  v51 = v50;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DADeviceGUID"), v50);
  CFRelease(v51);
LABEL_77:
  v52 = IORegistryEntrySearchCFProperty(object, "IOService", CFSTR("AppleTDMLocked"), allocator, 3u);
  if (v52)
  {
    v53 = v52;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DADeviceTDMLocked"), v52);
    CFRelease(v53);
  }
  CFRelease(properties);
  properties = 0;
  if (!IORegistryEntryCreateIterator(object, "IOService", 3u, &iterator))
  {
    entrya = IOIteratorNext(iterator);
    if (entrya)
    {
      while (!IORegistryEntryInPlane(entrya, "IODeviceTree"))
      {
        IOObjectRelease(entrya);
        entrya = IOIteratorNext(iterator);
        if (!entrya)
          goto LABEL_89;
      }
    }
    else
    {
LABEL_89:
      entrya = 0;
    }
    IOObjectRelease(iterator);
    iterator = 0;
    if (entrya)
    {
      if (IORegistryEntryGetNameInPlane(entrya, "IODeviceTree", buffer)
        || (v71 = CFStringCreateWithCString(allocator, buffer, 0x8000100u)) == 0
        || (v72 = v71,
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DABusName"), v71),
            CFRelease(v72),
            sub_1000057A8(entrya, "IODeviceTree", __s))
        || (v73 = CFStringCreateWithCString(allocator, __s, 0x8000100u)) == 0)
      {
        v4 = entrya;
        v5 = object;
        goto LABEL_3;
      }
      v74 = v73;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DABusPath"), v73);
      CFRelease(v74);
      IOObjectRelease(entrya);
    }
  }
  Current = CFAbsoluteTimeGetCurrent();
  v54 = CFNumberCreate(allocator, kCFNumberDoubleType, &Current);
  if (!v54)
    goto LABEL_70;
  v55 = v54;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v6 + 64), CFSTR("DAAppearanceTime"), v54);
  CFRelease(v55);
  HIDWORD(valuePtr) = 0;
  IOServiceGetBusyState(entry, (uint32_t *)&valuePtr + 1);
  if (HIDWORD(valuePtr))
    *(CFAbsoluteTime *)(v6 + 16) = CFAbsoluteTimeGetCurrent();
  v56 = (CFBooleanRef)IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("quarantine"), allocator, 3u);
  if (v56 && v56 == kCFBooleanTrue)
  {
    *(_DWORD *)(v6 + 176) |= 0x40u;
LABEL_94:
    CFRelease(v56);
    goto LABEL_95;
  }
  if (v56)
    goto LABEL_94;
LABEL_95:
  v57 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("owner-uid"), allocator, 3u);
  if (v57)
  {
    v58 = v57;
    v59 = CFGetTypeID(v57);
    if (v59 == CFNumberGetTypeID())
    {
      *(_DWORD *)bytes = 0;
      CFNumberGetValue(v58, kCFNumberIntType, bytes);
      v60 = *(_DWORD *)bytes;
      *(_DWORD *)(v6 + 184) = *(_DWORD *)bytes;
      v61 = getpwuid(v60);
      if (v61)
        *(_DWORD *)(v6 + 180) = v61->pw_gid;
    }
    CFRelease(v58);
  }
  v62 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("owner-gid"), allocator, 3u);
  if (v62)
  {
    v63 = v62;
    v64 = CFGetTypeID(v62);
    if (v64 == CFNumberGetTypeID())
    {
      *(_DWORD *)bytes = 0;
      CFNumberGetValue(v63, kCFNumberIntType, bytes);
      *(_DWORD *)(v6 + 180) = *(_DWORD *)bytes;
    }
    CFRelease(v63);
  }
  v65 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("owner-mode"), allocator, 3u);
  if (v65)
  {
    v66 = v65;
    v67 = CFGetTypeID(v65);
    if (v67 == CFNumberGetTypeID())
    {
      *(_DWORD *)bytes = 0;
      CFNumberGetValue(v66, kCFNumberIntType, bytes);
      *(_WORD *)(v6 + 156) = *(_WORD *)bytes;
    }
    CFRelease(v66);
  }
  v68 = (const __CFString *)IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("dev-name"), allocator, 0);
  if (v68)
  {
    v69 = v68;
    v70 = CFGetTypeID(v68);
    if (v70 == CFStringGetTypeID() && CFStringGetCString(v69, buffer, 128, 0x8000100u))
    {
      __strlcpy_chk(__s, "/dev/", 1024, 1024);
      __strlcat_chk(__s, buffer, 1024, 1024);
      *(_QWORD *)(v6 + 80) = strdup(__s);
      __strlcpy_chk(__s, "/dev/", 1024, 1024);
      __strlcat_chk(__s, "r", 1024, 1024);
      __strlcat_chk(__s, buffer, 1024, 1024);
      *(_QWORD *)(v6 + 88) = strdup(__s);
    }
    CFRelease(v69);
  }
  IOObjectRelease(object);
  return v6;
}

uint64_t sub_100007238(const __CFAllocator *a1, const char *a2)
{
  uint64_t Instance;
  uint64_t v5;
  CFMutableDictionaryRef Mutable;
  char *v7;
  size_t v8;
  CFDataRef v9;
  CFDataRef v10;

  Instance = _CFRuntimeCreateInstance(a1, qword_100024D40, 184, 0);
  v5 = Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = 0;
    *(_DWORD *)(Instance + 24) = 0;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_OWORD *)(Instance + 48) = 0u;
    Mutable = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *(_QWORD *)(v5 + 64) = Mutable;
    *(_QWORD *)(v5 + 72) = 0;
    *(_QWORD *)(v5 + 80) = 0;
    *(_QWORD *)(v5 + 88) = 0;
    *(_DWORD *)(v5 + 96) = 0;
    *(_QWORD *)(v5 + 112) = 0;
    *(_QWORD *)(v5 + 120) = 0;
    *(_QWORD *)(v5 + 104) = 0;
    *(_DWORD *)(v5 + 128) = -1;
    *(_QWORD *)(v5 + 136) = 0;
    v7 = strdup(a2);
    *(_QWORD *)(v5 + 144) = v7;
    *(_DWORD *)(v5 + 152) = 0;
    *(_WORD *)(v5 + 156) = 488;
    *(_QWORD *)(v5 + 192) = 0;
    *(_QWORD *)(v5 + 168) = 0;
    *(_QWORD *)(v5 + 176) = 0;
    *(_QWORD *)(v5 + 160) = 0;
    *(_DWORD *)(v5 + 184) = 0;
    if (!Mutable)
      sub_10001AEA8();
    if (!v7)
      sub_10001AED0();
    v8 = strlen(a2);
    v9 = CFDataCreate(a1, (const UInt8 *)a2, v8 + 1);
    if (v9)
    {
      v10 = v9;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(v5 + 64), CFSTR("DADiskID"), v9);
      CFRelease(v10);
    }
  }
  return v5;
}

uint64_t sub_100007344(uint64_t a1)
{
  return *(_QWORD *)(a1 + 144);
}

uint64_t sub_10000734C(const __CFAllocator *a1, uint64_t a2)
{
  const UInt8 *v4;
  size_t v5;
  CFURLRef v6;
  const __CFURL *v7;
  CFStringRef v8;
  CFStringRef v9;
  char *v10;
  char *v11;
  uint64_t v12;
  unsigned int v13;
  CFIndex Count;
  CFIndex v15;
  CFIndex v16;
  const char **ValueAtIndex;
  const char **v18;
  const char *v19;
  CFStringRef v20;
  CFStringRef v21;
  const __CFArray *v22;
  const __CFArray *v23;
  const __CFString *v24;
  const __CFString *v25;
  CFNumberRef v26;
  CFNumberRef v27;
  CFNumberRef v28;
  CFNumberRef v29;
  CFBooleanRef v30;
  uid_t v31;
  passwd *v32;
  __CFDictionary *v34;
  const void *Value;
  int v36;
  unsigned int valuePtr;
  char __s1[1024];

  if (!a2)
    return 0;
  v4 = (const UInt8 *)(a2 + 88);
  v5 = strlen((const char *)(a2 + 88));
  v6 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, v4, v5, 1u);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)(a2 + 72), 0x8000100u);
  if (v8)
  {
    v9 = v8;
    v10 = sub_10000A08C(a2);
    if (v10)
    {
      v11 = v10;
      v12 = sub_100007238(a1, v10);
      if (v12)
      {
        v13 = *(_DWORD *)(a2 + 48);
        v36 = v13 & 0xFFFFFF;
        valuePtr = HIBYTE(v13);
        if (!strcmp((const char *)(a2 + 72), "lifs")
          && !strncmp((const char *)(a2 + 1112), "apfs", 4uLL)
          && !sub_10000A320(a2, __s1, 1024))
        {
          *(_QWORD *)(v12 + 104) = strdup(__s1);
          sub_10000A798("Setting device path %s for %s", __s1, v11);
          Count = CFArrayGetCount((CFArrayRef)qword_100025288);
          if (Count >= 1)
          {
            v15 = Count;
            v16 = 0;
            while (1)
            {
              ValueAtIndex = (const char **)CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, v16);
              if ((const char **)v12 != ValueAtIndex)
              {
                v18 = ValueAtIndex;
                v19 = ValueAtIndex[13];
                if (v19)
                {
                  if (!strcmp(v19, __s1) && *((_DWORD *)v18 + 38))
                    break;
                }
              }
              if (v15 == ++v16)
                goto LABEL_16;
            }
            v34 = *(__CFDictionary **)(v12 + 64);
            Value = CFDictionaryGetValue((CFDictionaryRef)v18[8], CFSTR("DAMediaWritable"));
            CFDictionarySetValue(v34, CFSTR("DAMediaWritable"), Value);
          }
LABEL_16:
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), CFSTR("DAVolumeKind"), CFSTR("apfs"));
          v20 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)(a2 + 1112), 0x8000100u);
          if (v20)
          {
            v21 = v20;
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), CFSTR("DAVolumeLifsURL"), v20);
            CFRelease(v21);
          }
          v22 = _FSCopyNameForVolumeFormatAtURL(v7);
          if (v22)
          {
            v23 = v22;
            CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), CFSTR("DAVolumeType"), v22);
            CFRelease(v23);
          }
        }
        *(_QWORD *)(v12 + 32) = CFRetain(v7);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), CFSTR("DAVolumePath"), v7);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), CFSTR("DAVolumeMountable"), kCFBooleanTrue);
        if (!CFDictionaryGetValue(*(CFDictionaryRef *)(v12 + 64), CFSTR("DAVolumeKind")))
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), CFSTR("DAVolumeKind"), v9);
        v24 = sub_100008108(0, v7, 0);
        if (v24)
        {
          v25 = v24;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), CFSTR("DAVolumeName"), v24);
          CFRelease(v25);
        }
        v26 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        if (v26)
        {
          v27 = v26;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), CFSTR("DAMediaBSDMajor"), v26);
          CFRelease(v27);
        }
        v28 = CFNumberCreate(0, kCFNumberSInt32Type, &v36);
        if (v28)
        {
          v29 = v28;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), CFSTR("DAMediaBSDMinor"), v28);
          CFRelease(v29);
        }
        if ((*(_DWORD *)(a2 + 64) & 0x1000) != 0)
          v30 = kCFBooleanFalse;
        else
          v30 = kCFBooleanTrue;
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 64), CFSTR("DAVolumeNetwork"), v30);
        *(_DWORD *)(v12 + 176) |= 0x70030u;
        v31 = *(_DWORD *)(a2 + 56);
        *(_DWORD *)(v12 + 184) = v31;
        v32 = getpwuid(v31);
        if (v32)
          *(_DWORD *)(v12 + 180) = v32->pw_gid;
      }
      free(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    v12 = 0;
  }
  CFRelease(v7);
  return v12;
}

uint64_t sub_100007774(uint64_t a1, int a2)
{
  return *(_QWORD *)(a1 + 8 * (a2 != 0) + 104);
}

uint64_t sub_100007788(uint64_t a1)
{
  return *(unsigned int *)(a1 + 152);
}

const void *sub_100007790(uint64_t a1, const void *a2)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
}

double sub_100007798(uint64_t a1)
{
  return *(double *)(a1 + 16);
}

uint64_t sub_1000077A0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_1000077A8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t sub_1000077B0(uint64_t a1, int a2)
{
  return *(_QWORD *)(a1 + 8 * (a2 != 0) + 80);
}

uint64_t sub_1000077C4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 96);
}

uint64_t sub_1000077CC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 128);
}

uint64_t sub_1000077D4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t sub_1000077DC(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t sub_1000077E4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t sub_1000077EC(uint64_t a1)
{
  return *(_QWORD *)(a1 + 72);
}

uint64_t sub_1000077F4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 136);
}

uint64_t sub_1000077FC(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int16 *)(a1 + 156);
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), CFSTR("DAMediaWritable")) == kCFBooleanFalse)
    return v1 & 0x16D;
  else
    return v1;
}

BOOL sub_100007848(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 160) & a2) != 0;
}

uint64_t sub_100007858(uint64_t a1)
{
  return *(unsigned int *)(a1 + 160);
}

uint64_t sub_100007860(uint64_t a1)
{
  return *(unsigned int *)(a1 + 164);
}

CFMutableDataRef sub_100007868(CFTypeRef cf)
{
  CFMutableDataRef result;
  const __CFAllocator *v3;

  result = (CFMutableDataRef)*((_QWORD *)cf + 21);
  if (!result)
  {
    v3 = CFGetAllocator(cf);
    result = sub_100009D78(v3, *((CFDictionaryRef *)cf + 8));
    *((_QWORD *)cf + 21) = result;
  }
  return result;
}

BOOL sub_1000078A0(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 176) & a2) != 0;
}

uint64_t sub_1000078B0()
{
  return qword_100024D40;
}

uint64_t sub_1000078BC(uint64_t a1)
{
  return *(unsigned int *)(a1 + 180);
}

uint64_t sub_1000078C4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 184);
}

uint64_t sub_1000078CC()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass(&unk_100020C58);
  qword_100024D40 = result;
  return result;
}

BOOL sub_1000078F0(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t context;

  context = a1;
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_100007930, &context);
  return context != 0;
}

unint64_t sub_100007930(unint64_t result, const __CFDictionary *a2, uint64_t *a3)
{
  uint64_t v3;
  const void *v6;
  BOOLean_t matches;

  v3 = *a3;
  if (*a3)
  {
    v6 = (const void *)result;
    if (CFEqual((CFTypeRef)result, CFSTR("DAMediaMatch")))
    {
      matches = 0;
      result = IOServiceMatchPropertyTable(*(_DWORD *)(v3 + 152), a2, &matches);
      if (matches)
        return result;
      goto LABEL_7;
    }
    result = (unint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(v3 + 64), v6);
    if (!result || (result = CFEqual(a2, (CFTypeRef)result), !(_DWORD)result))
LABEL_7:
      *a3 = 0;
  }
  return result;
}

uint64_t sub_1000079C4(uint64_t result, double a2)
{
  *(double *)(result + 16) = a2;
  return result;
}

uint64_t sub_1000079CC(uint64_t a1, io_object_t object)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 24);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 24) = 0;
  }
  if (object)
  {
    result = IOObjectRetain(object);
    *(_DWORD *)(a1 + 24) = object;
  }
  return result;
}

void sub_100007A0C(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 32) = 0;
  }
  if (cf)
  {
    CFRetain(cf);
    *(_QWORD *)(a1 + 32) = cf;
  }
}

void sub_100007A4C(uint64_t a1, int a2, char *__s1)
{
  uint64_t v4;
  void *v5;
  char **v6;
  void *v7;

  v4 = a1 + 8 * (a2 != 0);
  v7 = *(void **)(v4 + 80);
  v6 = (char **)(v4 + 80);
  v5 = v7;
  if (v7)
  {
    free(v5);
    *v6 = 0;
  }
  if (__s1)
    *v6 = strdup(__s1);
}

void sub_100007A94(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 40) = 0;
  }
  if (cf)
  {
    CFRetain(cf);
    *(_QWORD *)(a1 + 40) = cf;
  }
}

void sub_100007AD4(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 48) = 0;
  }
  if (cf)
  {
    CFRetain(cf);
    *(_QWORD *)(a1 + 48) = cf;
  }
}

void sub_100007B14(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 56);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 56) = 0;
  }
  if (cf)
  {
    CFRetain(cf);
    *(_QWORD *)(a1 + 56) = cf;
  }
}

void sub_100007B54(uint64_t a1, const void *a2, const void *a3)
{
  __CFDictionary *v4;
  const void *v5;

  v4 = *(__CFDictionary **)(a1 + 64);
  if (a3)
    CFDictionarySetValue(v4, a2, a3);
  else
    CFDictionaryRemoveValue(v4, a2);
  v5 = *(const void **)(a1 + 168);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 168) = 0;
  }
}

void sub_100007B94(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 136);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 136) = 0;
  }
  if (cf)
  {
    CFRetain(cf);
    *(_QWORD *)(a1 + 136) = cf;
  }
}

void sub_100007BD4(CFDictionaryRef *a1, const __CFDictionary *a2)
{
  CFMutableSetRef Mutable;
  const __CFDictionary *v5;
  CFIndex Count;
  CFIndex v7;
  const void **v8;
  CFArrayRef v9;

  Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
  v5 = a1[24];
  if (v5)
  {
    CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)sub_100007D20, Mutable);
    CFDictionaryApplyFunction(a1[24], (CFDictionaryApplierFunction)sub_100007D2C, a1);
    CFRelease(a1[24]);
    a1[24] = 0;
  }
  if (a2)
  {
    CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)sub_100007D20, Mutable);
    CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)sub_100007D3C, a1);
    CFRetain(a2);
  }
  a1[24] = a2;
  Count = CFSetGetCount(Mutable);
  if (Count)
  {
    v7 = Count;
    v8 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFSetGetValues(Mutable, v8);
    v9 = CFArrayCreate(kCFAllocatorDefault, v8, v7, &kCFTypeArrayCallBacks);
    free(v8);
    sub_10000E1D0(a1, v9);
    CFRelease(Mutable);
    CFRelease(v9);
  }
}

void sub_100007D20(void *value, int a2, CFMutableSetRef theSet)
{
  CFSetAddValue(theSet, value);
}

void sub_100007D2C(const void *a1, uint64_t a2, uint64_t a3)
{
  sub_100007B54(a3, a1, 0);
}

void sub_100007D3C(const void *a1, const void *a2, uint64_t a3)
{
  sub_100007B54(a3, a1, a2);
}

uint64_t sub_100007D50(uint64_t result, int a2, int a3)
{
  int v3;

  if (a3)
    v3 = a2;
  else
    v3 = 0;
  *(_DWORD *)(result + 160) = *(_DWORD *)(result + 160) & ~a2 | v3;
  return result;
}

uint64_t sub_100007D6C(uint64_t a1, io_object_t object)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 164);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 164) = 0;
  }
  if (object)
  {
    result = IOObjectRetain(object);
    *(_DWORD *)(a1 + 164) = object;
  }
  return result;
}

uint64_t sub_100007DAC(uint64_t result, int a2, int a3)
{
  int v3;

  if (a3)
    v3 = a2;
  else
    v3 = 0;
  *(_DWORD *)(result + 176) = *(_DWORD *)(result + 176) & ~a2 | v3;
  return result;
}

char *sub_100007DC8(uint64_t a1, char *__s1)
{
  char *result;

  result = strdup(__s1);
  *(_QWORD *)(a1 + 120) = result;
  return result;
}

uint64_t sub_100007DF0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 120);
}

const char **sub_100007DF8(uint64_t a1)
{
  CFIndex Count;
  BOOL v3;
  CFIndex v4;
  CFIndex v5;
  const char **ValueAtIndex;

  Count = CFArrayGetCount((CFArrayRef)qword_100025288);
  if (*(_QWORD *)(a1 + 120))
    v3 = Count < 1;
  else
    v3 = 1;
  if (v3)
    return 0;
  v4 = Count;
  v5 = 0;
  while (1)
  {
    ValueAtIndex = (const char **)CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, v5);
    if (!strcmp(ValueAtIndex[18], *(const char **)(a1 + 120)))
      break;
    if (v4 == ++v5)
      return 0;
  }
  return ValueAtIndex;
}

void sub_100007E80(uint64_t a1)
{
  io_object_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const void *v13;
  void *v14;
  io_object_t v15;
  io_object_t v16;
  const void *v17;
  void *v18;
  const void *v19;

  v2 = *(_DWORD *)(a1 + 24);
  if (v2)
    IOObjectRelease(v2);
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 48);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 56);
  if (v6)
    CFRelease(v6);
  v7 = *(const void **)(a1 + 64);
  if (v7)
    CFRelease(v7);
  v8 = *(const void **)(a1 + 72);
  if (v8)
    CFRelease(v8);
  v9 = *(void **)(a1 + 80);
  if (v9)
    free(v9);
  v10 = *(void **)(a1 + 88);
  if (v10)
    free(v10);
  v11 = *(void **)(a1 + 104);
  if (v11)
    free(v11);
  v12 = *(void **)(a1 + 112);
  if (v12)
    free(v12);
  v13 = *(const void **)(a1 + 136);
  if (v13)
    CFRelease(v13);
  v14 = *(void **)(a1 + 144);
  if (v14)
    free(v14);
  v15 = *(_DWORD *)(a1 + 152);
  if (v15)
    IOObjectRelease(v15);
  v16 = *(_DWORD *)(a1 + 164);
  if (v16)
    IOObjectRelease(v16);
  v17 = *(const void **)(a1 + 168);
  if (v17)
    CFRelease(v17);
  v18 = *(void **)(a1 + 120);
  if (v18)
    free(v18);
  v19 = *(const void **)(a1 + 192);
  if (v19)
    CFRelease(v19);
}

BOOL sub_100007F7C(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(a1 + 144), *(const char **)(a2 + 144)) == 0;
}

uint64_t sub_100007FA0(uint64_t a1)
{
  const char *v1;
  size_t v2;
  uint64_t v3;

  v1 = *(const char **)(a1 + 144);
  v2 = strlen(v1);
  if (v2 >= 0x10)
    v3 = 16;
  else
    v3 = v2;
  return CFHashBytes(v1, v3);
}

CFStringRef sub_100007FD4(_QWORD *a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("%s"), a1[18]);
}

CFStringRef sub_100008014(_QWORD *a1)
{
  const __CFAllocator *v2;
  CFAllocatorRef v3;

  v2 = CFGetAllocator(a1);
  v3 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<DADisk %p [%p]>{id = %s}"), a1, v3, a1[18]);
}

CFMutableDictionaryRef sub_100008068(const __CFAllocator *a1, int a2)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v4;

  Mutable = CFDictionaryCreateMutable(a1, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v4 = Mutable;
  if (Mutable)
    sub_100009B0C(Mutable, CFSTR("DAStatus"), a2);
  return v4;
}

const __CFNumber *sub_1000080BC(const __CFDictionary *a1)
{
  return sub_100009AD8(a1, CFSTR("DAProcessID"));
}

const __CFNumber *sub_1000080D8(const __CFDictionary *a1)
{
  return sub_100009AD8(a1, CFSTR("DAStatus"));
}

void sub_1000080F4(void *a1, int a2)
{
  sub_100009B0C(a1, CFSTR("DAProcessID"), a2);
}

const __CFString *sub_100008108(uint64_t a1, const __CFURL *a2, _OWORD *a3)
{
  UInt8 *v5;
  UInt8 *v6;
  const __CFString *v7;
  const __CFString *v8;
  _QWORD v10[3];
  _BYTE v11[4];
  _DWORD v12[2];
  __int128 v13;

  bzero(v11, 0x41CuLL);
  v10[2] = 0;
  v10[0] = 5;
  v10[1] = 2147753984;
  v5 = sub_100009CC0(a2);
  if (v5)
  {
    v6 = v5;
    if (getattrlist((const char *)v5, v10, v11, 0x41CuLL, 0) == -1)
    {
      v8 = 0;
LABEL_12:
      free(v6);
      return v8;
    }
    if (v12[1])
    {
      v7 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v12 + v12[0], 0x8000100u);
      v8 = v7;
      if (!v7 || CFStringGetLength(v7))
      {
LABEL_8:
        if (a3)
          *a3 = v13;
        goto LABEL_12;
      }
      CFRelease(v8);
    }
    v8 = 0;
    goto LABEL_8;
  }
  return 0;
}

CFUUIDRef sub_100008230(const __CFAllocator *a1, const __CFString *a2)
{
  CFUUIDRef v4;
  __CFData *v5;
  const __CFData *v6;
  const __CFUUID *v7;
  const __CFUUID *v8;
  CFUUIDRef v9;

  v4 = sub_100005608(a1, a2);
  if (!v4)
  {
    v5 = sub_100004FE4(a1, a2);
    if (v5)
    {
      v6 = v5;
      if (CFDataGetLength(v5) == 8)
      {
        if (*(_QWORD *)CFDataGetBytePtr(v6))
        {
          v7 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorDefault, 0xB3u, 0xE2u, 0xFu, 0x39u, 0xF2u, 0x92u, 0x11u, 0xD6u, 0x97u, 0xA4u, 0, 0x30u, 0x65u, 0x43u, 0xECu, 0xACu);
          v8 = sub_1000054B4(a1, v7, v6);
        }
        else
        {
          v9 = CFUUIDGetConstantUUIDWithBytes(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
          v8 = (const __CFUUID *)CFRetain(v9);
        }
        v4 = v8;
      }
      else
      {
        v4 = 0;
      }
      CFRelease(v6);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

uint64_t sub_100008348(uint64_t a1, CFURLRef bundleURL)
{
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  CFURLRef v6;
  CFURLRef v7;
  uint64_t v8;

  v4 = CFBundleCopyInfoDictionaryInDirectory(bundleURL);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFURLCopyAbsoluteURL(bundleURL);
  if (v6)
  {
    v7 = v6;
    v8 = sub_1000083C8(a1, v6, v5);
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

uint64_t sub_1000083C8(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t Instance;

  Instance = _CFRuntimeCreateInstance(a1, qword_100024D48, 16, 0);
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = CFRetain(a2);
    *(_QWORD *)(Instance + 24) = CFRetain(a3);
  }
  return Instance;
}

uint64_t sub_100008428(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  const __CFString *Value;
  CFURLRef v5;
  CFURLRef v6;
  uint64_t v7;

  Value = (const __CFString *)CFDictionaryGetValue(theDict, kCFBundleNameKey);
  if (!Value)
    return 0;
  v5 = CFURLCreateWithFileSystemPath(a1, Value, kCFURLPOSIXPathStyle, 0);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = sub_1000083C8((uint64_t)a1, v5, theDict);
  CFRelease(v6);
  return v7;
}

const void *sub_1000084B0(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey);
}

const void *sub_1000084C4(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), CFSTR("FSMediaTypes"));
}

const void *sub_1000084D4(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), CFSTR("FSIsFSModule"));
}

uint64_t sub_1000084E4()
{
  return qword_100024D48;
}

uint64_t sub_1000084F0()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass(&unk_100020D30);
  qword_100024D48 = result;
  return result;
}

void sub_100008514(uint64_t a1, const __CFURL *a2, const void *a3, const __CFURL *a4, uid_t a5, gid_t a6, void (*a7)(CFIndex, uint64_t), void (*a8)(CFIndex, uint64_t), CFStringRef theString2)
{
  uint64_t vars0;

  sub_100008540(a1, a2, a3, a4, a5, a6, theString2, a7, a8, 0, vars0);
}

void sub_100008540(uint64_t a1, const __CFURL *a2, const void *a3, const __CFURL *a4, uid_t a5, gid_t a6, CFStringRef theString2, void (*a8)(CFIndex, uint64_t), void (*a9)(CFIndex, uint64_t), CFStringRef appendedString, uint64_t a11)
{
  char has_factory_content;
  CFURLRef v19;
  CFURLRef v20;
  void (**v21)(CFIndex, uint64_t);
  void (**v22)(CFIndex, uint64_t);
  CFStringRef v23;
  const __CFString *v24;
  char v25;
  CFMutableStringRef Mutable;
  CFStringRef v27;
  CFIndex Length;
  const __CFString *v29;
  const __CFString **v30;
  const void *v31;
  uint64_t v32;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v34;
  CFIndex Count;
  const void *ValueAtIndex;
  const void *Value;
  void (*v38)(CFIndex, uint64_t);
  const __CFString *v39;
  CFStringRef cf;
  CFTypeRef v41;
  const __CFString **v42;

  if (theString2)
  {
    has_factory_content = 1;
    if (CFStringCompare(CFSTR("UserFS"), theString2, 1uLL) == kCFCompareEqualTo)
      has_factory_content = os_variant_has_factory_content("com.apple.diskarbitrationd");
  }
  else
  {
    has_factory_content = 1;
  }
  v19 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, CFSTR("/sbin/mount"), kCFURLPOSIXPathStyle, 0);
  if (!v19)
  {
    Length = 45;
    if (!a8)
      return;
    goto LABEL_43;
  }
  v20 = v19;
  v41 = a3;
  v21 = (void (**)(CFIndex, uint64_t))malloc_type_malloc(0x40uLL, 0xE0040E5DF33D6uLL);
  if (!v21)
  {
    CFRelease(v20);
    Length = 12;
    if (!a8)
      return;
LABEL_43:
    a8(Length, (uint64_t)a9);
    return;
  }
  v22 = v21;
  v23 = CFURLCopyFileSystemPath(a2, kCFURLPOSIXPathStyle);
  if (!v23)
  {
    CFRelease(v20);
    Length = 22;
    goto LABEL_42;
  }
  v24 = v23;
  if (a4)
  {
    cf = CFURLCopyFileSystemPath(a4, kCFURLPOSIXPathStyle);
    if (!cf)
    {
      v25 = 0;
      Mutable = 0;
      v27 = 0;
      Length = 22;
      goto LABEL_37;
    }
  }
  else
  {
    cf = 0;
  }
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (!Mutable)
  {
    v25 = 0;
    Length = 12;
    goto LABEL_29;
  }
  v42 = (const __CFString **)&a11;
  v29 = appendedString;
  if (appendedString)
  {
    do
    {
      CFStringAppend(Mutable, v29);
      CFStringAppend(Mutable, CFSTR(","));
      v30 = v42++;
      v29 = *v30;
    }
    while (*v30);
  }
  CFStringTrim(Mutable, CFSTR(","));
  *v22 = a8;
  v22[1] = a9;
  if ((has_factory_content & 1) == 0)
  {
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v24, CFSTR("/"));
    if (ArrayBySeparatingStrings)
    {
      v34 = ArrayBySeparatingStrings;
      Count = CFArrayGetCount(ArrayBySeparatingStrings);
      ValueAtIndex = CFArrayGetValueAtIndex(v34, Count - 1);
      v22[2] = (void (*)(CFIndex, uint64_t))CFRetain(ValueAtIndex);
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey);
      v22[4] = (void (*)(CFIndex, uint64_t))CFRetain(Value);
      v27 = cf;
      if (cf)
        v38 = (void (*)(CFIndex, uint64_t))CFRetain(cf);
      else
        v38 = 0;
      v22[5] = v38;
      if (v41)
        v39 = (const __CFString *)CFRetain(v41);
      else
        v39 = CFSTR("Untitled");
      v22[6] = (void (*)(CFIndex, uint64_t))v39;
      CFStringAppend(Mutable, CFSTR(","));
      CFStringAppend(Mutable, CFSTR("nofollow"));
      CFStringTrim(Mutable, CFSTR(","));
      v22[7] = (void (*)(CFIndex, uint64_t))CFRetain(Mutable);
      sub_100018150((uint64_t)sub_10000A910, (uint64_t)v22, (uint64_t (*)(uint64_t, uint64_t))sub_100008934, (uint64_t)v22);
      CFRelease(v34);
      goto LABEL_35;
    }
    v25 = 0;
    Length = 22;
LABEL_29:
    v27 = cf;
    goto LABEL_37;
  }
  Length = CFStringGetLength(Mutable);
  v31 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey);
  if (Length)
  {
    v27 = cf;
    sub_100005FB8(v20, 0, a5, a6, -1, (void (*)(uint64_t, _QWORD, uint64_t))sub_1000089A0, (uint64_t)v22, v32, (uint64_t)CFSTR("-t"), (uint64_t)v31);
LABEL_35:
    Length = 0;
    goto LABEL_36;
  }
  v27 = cf;
  sub_100005FB8(v20, 0, a5, a6, -1, (void (*)(uint64_t, _QWORD, uint64_t))sub_1000089A0, (uint64_t)v22, v32, (uint64_t)CFSTR("-t"), (uint64_t)v31);
LABEL_36:
  v25 = 1;
LABEL_37:
  CFRelease(v20);
  CFRelease(v24);
  if (v27)
    CFRelease(v27);
  if (Mutable)
    CFRelease(Mutable);
  if ((v25 & 1) == 0)
  {
LABEL_42:
    free(v22);
    if (!a8)
      return;
    goto LABEL_43;
  }
}

void sub_100008934(uint64_t a1, _QWORD *a2)
{
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  if (*a2)
    ((void (*)(uint64_t, _QWORD))*a2)(a1, a2[1]);
  v3 = (const void *)a2[6];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a2[2];
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a2[4];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a2[5];
  if (v6)
    CFRelease(v6);
  v7 = (const void *)a2[7];
  if (v7)
    CFRelease(v7);
  free(a2);
}

void sub_1000089A0(uint64_t a1, int a2, _QWORD *a3)
{
  if (*a3)
    ((void (*)(uint64_t, _QWORD))*a3)(a1, a3[1]);
  free(a3);
}

void sub_1000089D0(uint64_t a1, CFURLRef url, const char *a3, const char *a4, void (*a5)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t), uint64_t a6, int a7)
{
  CFStringRef PathComponent;
  CFStringRef v14;
  const void *Value;
  const __CFDictionary *v16;
  const __CFString *v17;
  CFStringRef v18;
  uint64_t v19;
  const __CFDictionary *v20;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  const __CFDictionary *v24;
  const __CFString *v25;
  CFURLRef v26;
  CFURLRef v27;
  const __CFString *v28;
  CFURLRef v29;
  const __CFString *v30;
  const __CFString *v31;
  _DWORD *v32;
  _DWORD *v33;
  uint64_t v34;
  const void *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  CFStringRef v41;
  uint64_t v42;

  PathComponent = CFURLCopyLastPathComponent(url);
  if (PathComponent)
  {
    v14 = PathComponent;
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), CFSTR("FSIsFSModule"));
    v16 = *(const __CFDictionary **)(a1 + 24);
    if (Value)
    {
      v17 = (const __CFString *)CFDictionaryGetValue(v16, kCFBundleNameKey);
      v18 = sub_100015680(v17);
      sub_100016020(v14, v18, a7, a5, a6);
      return;
    }
    v20 = (const __CFDictionary *)CFDictionaryGetValue(v16, CFSTR("FSPersonalities"));
    if (v20)
    {
      v21 = (const __CFDictionary *)sub_100005248(v20);
      if (v21)
      {
        v22 = v21;
        v23 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), CFSTR("FSMediaTypes"));
        if (v23)
        {
          v24 = (const __CFDictionary *)sub_100005248(v23);
          if (v24)
          {
            v25 = (const __CFString *)CFDictionaryGetValue(v24, CFSTR("FSProbeExecutable"));
            if (v25)
            {
              v26 = sub_100004F04(*(const __CFURL **)(a1 + 16), v25);
              if (v26)
              {
                v27 = v26;
                v28 = (const __CFString *)CFDictionaryGetValue(v22, CFSTR("FSRepairExecutable"));
                v29 = 0;
                if (a7 && v28 && (v29 = sub_100004F04(*(const __CFURL **)(a1 + 16), v28)) == 0)
                {
                  v33 = 0;
                  v19 = 45;
                }
                else
                {
                  v30 = sub_10000570C(url, kCFURLPOSIXPathStyle);
                  if (v30)
                  {
                    v31 = v30;
                    v32 = malloc_type_malloc(0x58uLL, 0x10E0040C95B46AEuLL);
                    v33 = v32;
                    if (!v32)
                    {
LABEL_30:
                      v19 = 12;
LABEL_31:
                      CFRelease(v14);
LABEL_34:
                      CFRelease(v31);
                      CFRelease(v27);
                      if (v29)
                        CFRelease(v29);
                      if (v33)
                        free(v33);
                      goto LABEL_27;
                    }
                    *(_QWORD *)v32 = a5;
                    *((_QWORD *)v32 + 1) = a6;
                    *((_QWORD *)v32 + 2) = v14;
                    *((_QWORD *)v32 + 3) = v31;
                    *((_QWORD *)v32 + 4) = v27;
                    *((_QWORD *)v32 + 5) = v29;
                    v32[12] = -1;
                    *((_QWORD *)v32 + 8) = 0;
                    *((_QWORD *)v32 + 9) = 0;
                    *((_QWORD *)v32 + 7) = 0;
                    *((_QWORD *)v32 + 10) = -1;
                    if ((os_variant_is_darwinos("com.apple.diskarbitrationd") & 1) != 0
                      || (v35 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey),
                          CFEqual(v35, CFSTR("apfs"))))
                    {
LABEL_23:
                      v40 = v33[20];
                      if (v40 < 0)
                      {
                        v41 = 0;
                        goto LABEL_39;
                      }
                      v41 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("/dev/fd/%d"), v33[20]);
                      if (v41)
                      {
                        v40 = v33[20];
LABEL_39:
                        if (v40 == -1)
                          v42 = (uint64_t)v14;
                        else
                          v42 = (uint64_t)v41;
                        sub_100005FB8(v27, 1, 0, 0, v40, (void (*)(uint64_t, _QWORD, uint64_t))sub_100008D4C, (uint64_t)v33, v34, (uint64_t)CFSTR("-p"), v42);
                        return;
                      }
                      goto LABEL_30;
                    }
                    if (a4)
                    {
                      v36 = sub_10000AA40(a4, 0);
                      if (v36 == -1)
                        goto LABEL_44;
                      v37 = v36;
                      v33[21] = dup(v36);
                      close(v37);
                    }
                    v38 = sub_10000AA40(a3, 0);
                    if (v38 != -1)
                    {
                      v39 = v38;
                      v33[20] = dup(v38);
                      close(v39);
                      goto LABEL_23;
                    }
LABEL_44:
                    v19 = *__error();
                    if (!(_DWORD)v19)
                      return;
                    goto LABEL_31;
                  }
                  v33 = 0;
                  v19 = 22;
                }
                v31 = v14;
                goto LABEL_34;
              }
            }
          }
        }
      }
    }
    CFRelease(v14);
    v19 = 45;
  }
  else
  {
    v19 = 22;
  }
LABEL_27:
  if (a5)
    a5(v19, 0, 0, 0, 0, a6);
}

void sub_100008D4C(uint64_t a1, const __CFData *a2, unsigned int *data, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v9;
  const __CFString *v10;
  __CFString *MutableCopy;
  int v12;
  CFStringRef v13;
  CFStringRef v14;
  uint64_t v15;

  if ((_DWORD)a1 != -1)
    goto LABEL_2;
  if (a2)
  {
    v9 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, a2, 0x8000100u);
    if (v9)
    {
      v10 = v9;
      if (CFStringGetLength(v9))
      {
        MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, v10);
        *((_QWORD *)data + 7) = MutableCopy;
        if (MutableCopy)
          CFStringTrim(MutableCopy, CFSTR("\n"));
      }
      CFRelease(v10);
    }
  }
  v12 = data[20];
  if (v12 < 0)
  {
    v14 = 0;
  }
  else
  {
    v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("/dev/fd/%d"), data[20]);
    if (!v13)
    {
      a1 = 12;
LABEL_2:
      sub_10000971C(a1, data);
      return;
    }
    v14 = v13;
    v12 = data[20];
  }
  v15 = (uint64_t)v14;
  if (v12 == -1)
    v15 = *((_QWORD *)data + 2);
  sub_100005FB8(*((const __CFURL **)data + 4), 1, 0, 0, v12, (void (*)(uint64_t, _QWORD, uint64_t))sub_1000095C8, (uint64_t)data, a8, (uint64_t)CFSTR("-k"), v15);
  if (v14)
    CFRelease(v14);
}

void sub_100008E8C(uint64_t a1, const __CFURL *a2, const __CFString *a3, void (*a4)(uint64_t, uint64_t), uint64_t a5)
{
  char *v9;
  char *v10;
  UInt8 *v11;
  char *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v15 = 0;
  v14 = xmmword_10001F3F0;
  LOWORD(v14) = 5;
  v9 = (char *)malloc_type_malloc(0x408uLL, 0x1000040F7F14A6DuLL);
  if (v9)
  {
    v10 = v9;
    v11 = sub_100009CC0(a2);
    if (v11)
    {
      v12 = (char *)v11;
      if (CFStringGetCString(a3, v10 + 8, 1024, 0x8000100u))
      {
        *(_DWORD *)v10 = 8;
        *((_DWORD *)v10 + 1) = strlen(v10 + 8) + 1;
        v13 = setattrlist(v12, &v14, v10, 0x408uLL, 0);
        if ((_DWORD)v13 == -1)
          v13 = *__error();
      }
      else
      {
        v13 = 22;
      }
      free(v10);
      free(v12);
    }
    else
    {
      free(v10);
      v13 = 22;
    }
  }
  else
  {
    v13 = 12;
  }
  if (a4)
    a4(v13, a5);
}

void sub_100008FB8(uint64_t a1, const __CFURL *a2, uint64_t a3, void (*a4)(uint64_t, uint64_t), uint64_t a5)
{
  CFStringRef PathComponent;
  const __CFString *Value;
  CFStringRef v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const __CFString *v16;
  CFURLRef v17;
  const __CFURL *v18;
  uint64_t v19;
  _QWORD *v20;
  CFStringRef v21;
  CFStringRef v22;
  char v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);

  if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), CFSTR("FSIsFSModule")))
  {
    PathComponent = CFURLCopyLastPathComponent(a2);
    Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), kCFBundleNameKey);
    v11 = sub_100015680(Value);
    sub_100016848(PathComponent, v11, a4, a5);
    return;
  }
  v12 = sub_10000570C(a2, kCFURLPOSIXPathStyle);
  if (!v12)
  {
    v24 = 22;
    goto LABEL_14;
  }
  v13 = v12;
  v14 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), CFSTR("FSPersonalities"));
  if (!v14
    || (v15 = (const __CFDictionary *)sub_100005248(v14)) == 0
    || (v16 = (const __CFString *)CFDictionaryGetValue(v15, CFSTR("FSRepairExecutable"))) == 0
    || (v17 = sub_100004F04(*(const __CFURL **)(a1 + 16), v16)) == 0)
  {
    CFRelease(v13);
    v24 = 45;
    goto LABEL_14;
  }
  v18 = v17;
  v20 = malloc_type_malloc(0x40uLL, 0xE0040E5DF33D6uLL);
  if (!v20)
  {
    v23 = 0;
    v22 = 0;
    goto LABEL_18;
  }
  *v20 = a4;
  v20[1] = a5;
  if ((_DWORD)a3 == -1)
  {
    v22 = 0;
    v21 = v13;
  }
  else
  {
    v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("/dev/fd/%d"), a3);
    v22 = v21;
    if (!v21)
    {
      v23 = 0;
LABEL_18:
      v24 = 12;
      goto LABEL_21;
    }
  }
  sub_100005FB8(v18, 0, 0, 0, a3, (void (*)(uint64_t, _QWORD, uint64_t))sub_1000089A0, (uint64_t)v20, v19, (uint64_t)CFSTR("-y"), (uint64_t)v21);
  v24 = 0;
  v23 = 1;
LABEL_21:
  CFRelease(v18);
  CFRelease(v13);
  if (v22)
    CFRelease(v22);
  v25 = a4;
  if ((v23 & 1) == 0)
  {
    if (!v20)
    {
LABEL_15:
      if (v25)
        v25(v24, a5);
      return;
    }
    free(v20);
LABEL_14:
    v25 = a4;
    goto LABEL_15;
  }
}

void sub_1000091E4(uint64_t a1, const __CFURL *a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t))
{
  CFURLRef v6;
  const __CFURL *v7;
  void (**v8)(uint64_t, uint64_t);
  void (**v9)(uint64_t, uint64_t);
  CFStringRef v10;
  uint64_t v11;
  CFStringRef v12;
  uint64_t v13;

  v6 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, CFSTR("/sbin/quotacheck"), kCFURLPOSIXPathStyle, 0);
  if (v6)
  {
    v7 = v6;
    v8 = (void (**)(uint64_t, uint64_t))malloc_type_malloc(0x40uLL, 0xE0040E5DF33D6uLL);
    if (v8)
    {
      v9 = v8;
      if (a2)
      {
        v10 = CFURLCopyFileSystemPath(a2, kCFURLPOSIXPathStyle);
        if (v10)
        {
          v12 = v10;
          *v9 = a3;
          v9[1] = a4;
          sub_100005FB8(v7, 0, 0, 0, -1, (void (*)(uint64_t, _QWORD, uint64_t))sub_1000089A0, (uint64_t)v9, v11, (uint64_t)CFSTR("-g"), (uint64_t)CFSTR("-u"));
          CFRelease(v7);
          CFRelease(v12);
          return;
        }
      }
      CFRelease(v7);
      free(v9);
      v13 = 22;
    }
    else
    {
      CFRelease(v7);
      v13 = 12;
    }
  }
  else
  {
    v13 = 45;
  }
  if (a3)
    a3(v13, (uint64_t)a4);
}

void sub_100009328(int a1, const __CFURL *a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t), int a5, int a6, int a7, int a8)
{
  uint64_t v8;

  sub_100009348(a1, a2, a3, a4, a5, a6, a7, a8, 0, v8);
}

void sub_100009348(int a1, const __CFURL *a2, void (*a3)(uint64_t, uint64_t), void (*a4)(uint64_t, uint64_t), int a5, int a6, int a7, int a8, CFTypeRef cf1, uint64_t a10)
{
  CFURLRef v12;
  const __CFURL *v13;
  void (**v14)(uint64_t, uint64_t);
  void (**v15)(uint64_t, uint64_t);
  CFStringRef v16;
  uint64_t v17;
  CFStringRef v18;
  CFTypeRef v19;
  int v20;
  CFTypeRef *v21;
  uint64_t v22;
  CFTypeRef *v24;

  v12 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, CFSTR("/sbin/umount"), kCFURLPOSIXPathStyle, 0);
  if (v12)
  {
    v13 = v12;
    v14 = (void (**)(uint64_t, uint64_t))malloc_type_malloc(0x40uLL, 0xE0040E5DF33D6uLL);
    if (v14)
    {
      v15 = v14;
      v16 = CFURLCopyFileSystemPath(a2, kCFURLPOSIXPathStyle);
      if (v16)
      {
        v18 = v16;
        v24 = (CFTypeRef *)&a10;
        v19 = cf1;
        if (cf1)
        {
          v20 = 0;
          do
          {
            if (CFEqual(v19, CFSTR("force")))
              v20 = 0x80000;
            v21 = v24++;
            v19 = *v21;
          }
          while (*v21);
          *v15 = a3;
          v15[1] = a4;
          if ((v20 & 0x80000) != 0)
          {
            sub_100005FB8(v13, 0, 0, 0, -1, (void (*)(uint64_t, _QWORD, uint64_t))sub_1000089A0, (uint64_t)v15, v17, (uint64_t)CFSTR("-f"), (uint64_t)v18);
LABEL_18:
            CFRelease(v13);
            CFRelease(v18);
            return;
          }
        }
        else
        {
          *v15 = a3;
          v15[1] = a4;
        }
        sub_100005FB8(v13, 0, 0, 0, -1, (void (*)(uint64_t, _QWORD, uint64_t))sub_1000089A0, (uint64_t)v15, v17, (uint64_t)v18, 0);
        goto LABEL_18;
      }
      CFRelease(v13);
      free(v15);
      v22 = 22;
    }
    else
    {
      CFRelease(v13);
      v22 = 12;
    }
  }
  else
  {
    v22 = 45;
  }
  if (a3)
    a3(v22, (uint64_t)a4);
}

void sub_1000094E4(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 16);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 24);
  if (v3)
    CFRelease(v3);
}

uint64_t sub_100009520(uint64_t a1, uint64_t a2)
{
  return CFEqual(*(CFTypeRef *)(a1 + 16), *(CFTypeRef *)(a2 + 16));
}

CFHashCode sub_10000952C(uint64_t a1)
{
  return CFHash(*(CFTypeRef *)(a1 + 16));
}

CFStringRef sub_100009534(uint64_t a1)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@"), *(_QWORD *)(a1 + 16));
}

CFStringRef sub_100009574(_QWORD *a1)
{
  CFAllocatorRef v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("<DAFileSystem %p [%p]>{id = %@}"), a1, v2, a1[2]);
}

void sub_1000095C8(int a1, const __CFData *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  CFStringRef v15;
  uint64_t v16;
  CFStringRef v17;

  if (a1 == -3)
  {
    if (a2)
    {
      v9 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, a2, 0x8000100u);
      if (v9)
      {
        v10 = v9;
        *(_QWORD *)(a3 + 72) = sub_100005608(kCFAllocatorDefault, v9);
        CFRelease(v10);
      }
    }
  }
  v11 = *(_QWORD *)(a3 + 40);
  if (v11)
  {
    v12 = *(_DWORD *)(a3 + 80);
    v13 = *(_DWORD *)(a3 + 84);
    if ((v12 & 0x80000000) != 0 && v13 < 0)
    {
      sub_100005FB8((const __CFURL *)v11, 0, 0, 0, -1, sub_1000097DC, a3, a8, (uint64_t)CFSTR("-q"), *(_QWORD *)(a3 + 24));
      return;
    }
    if (v13 >= 0)
      v14 = v13;
    else
      v14 = v12;
    v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("/dev/fd/%d"), v14);
    if (v15)
    {
      v17 = v15;
      sub_100005FB8(*(const __CFURL **)(a3 + 40), 0, 0, 0, v14, sub_1000097DC, a3, v16, (uint64_t)CFSTR("-q"), (uint64_t)v15);
      CFRelease(v17);
      return;
    }
    v11 = 12;
  }
  sub_1000097DC(v11, (uint64_t)a2, a3);
}

void sub_10000971C(uint64_t a1, void *a2)
{
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  int v7;
  int v8;

  if (*(_QWORD *)a2)
    (*(void (**)(void))a2)();
  CFRelease(*((CFTypeRef *)a2 + 2));
  CFRelease(*((CFTypeRef *)a2 + 3));
  CFRelease(*((CFTypeRef *)a2 + 4));
  v3 = (const void *)*((_QWORD *)a2 + 5);
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)a2 + 7);
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)a2 + 8);
  if (v5)
    CFRelease(v5);
  v6 = (const void *)*((_QWORD *)a2 + 9);
  if (v6)
    CFRelease(v6);
  v7 = *((_DWORD *)a2 + 20);
  if (v7 != -1)
    close(v7);
  v8 = *((_DWORD *)a2 + 21);
  if (v8 != -1)
    close(v8);
  free(a2);
}

void sub_1000097DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a3 + 48) = a1;
  sub_10000A798(" fsck status %d %@", a1, *(_QWORD *)(a3 + 24));
  *(_QWORD *)(a3 + 64) = _FSCopyNameForVolumeFormatAtNode(*(const __CFString **)(a3 + 24));
  sub_10000971C(0, (void *)a3);
}

uint64_t sub_10000982C(const char *a1, void *a2, int a3)
{
  int v6;
  int v7;
  statfs *v8;
  statfs *v9;
  int v10;
  uint64_t v11;
  const char *f_mntonname;
  uint64_t v13;
  int v14;

  v6 = getfsstat(0, 0, 2);
  if (v6 < 1)
    return 0xFFFFFFFFLL;
  v7 = 2168 * v6;
  v8 = (statfs *)malloc_type_malloc(2168 * v6, 0x100004087E0324AuLL);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = v8;
  v10 = getfsstat(v8, v7, a3);
  if (v10 < 1)
  {
    v13 = 0xFFFFFFFFLL;
  }
  else
  {
    v11 = v10;
    f_mntonname = v9->f_mntonname;
    v13 = 0xFFFFFFFFLL;
    do
    {
      if (!strcmp(f_mntonname, a1))
      {
        memcpy(a2, f_mntonname - 88, 0x878uLL);
        v14 = *((_DWORD *)f_mntonname - 8);
        v13 = 0;
        if (v14 == geteuid())
          break;
      }
      f_mntonname += 2168;
      --v11;
    }
    while (v11);
  }
  free(v9);
  return v13;
}

uint64_t sub_100009924(const __CFArray *a1, const void *a2)
{
  CFRange v5;

  v5.length = CFArrayGetCount(a1);
  v5.location = 0;
  return CFArrayContainsValue(a1, v5, a2);
}

BOOL sub_100009958(const __CFArray *a1, const __CFString *a2)
{
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  BOOL v7;
  const __CFString *ValueAtIndex;
  CFTypeID v9;

  Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    return 0;
  }
  else
  {
    v5 = Count;
    v6 = 0;
    v7 = 1;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v6);
      v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFStringGetTypeID() && CFStringCompare(ValueAtIndex, a2, 1uLL) == kCFCompareEqualTo)
        break;
      v7 = v5 > ++v6;
    }
    while (v5 != v6);
  }
  return v7;
}

void sub_1000099FC(const __CFArray *a1, const void *a2)
{
  CFIndex FirstIndexOfValue;
  CFRange v5;

  v5.length = CFArrayGetCount(a1);
  v5.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(a1, v5, a2);
  if (FirstIndexOfValue != -1)
    CFArrayRemoveValueAtIndex(a1, FirstIndexOfValue);
}

vm_address_t sub_100009A50(const __CFData *a1, unsigned int *a2)
{
  unsigned int Length;
  void *v5;
  const UInt8 *BytePtr;
  vm_address_t address;

  address = 0;
  Length = CFDataGetLength(a1);
  *a2 = Length;
  vm_allocate(mach_task_self_, &address, Length, 1);
  v5 = (void *)address;
  if (!address)
    return 0;
  BytePtr = CFDataGetBytePtr(a1);
  memmove(v5, BytePtr, *a2);
  return address;
}

const __CFNumber *sub_100009AD8(const __CFDictionary *a1, const void *a2)
{
  const __CFNumber *result;
  uint64_t valuePtr;

  valuePtr = 0;
  result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

void sub_100009B0C(void *a1, const void *a2, uint64_t a3)
{
  const __CFAllocator *v5;
  CFNumberRef v6;
  CFNumberRef v7;
  uint64_t valuePtr;

  valuePtr = a3;
  v5 = CFGetAllocator(a1);
  v6 = CFNumberCreate(v5, kCFNumberSInt64Type, &valuePtr);
  if (v6)
  {
    v7 = v6;
    CFDictionarySetValue((CFMutableDictionaryRef)a1, a2, v6);
    CFRelease(v7);
  }
}

CFNumberRef sub_100009B70(const __CFAllocator *a1, uint64_t a2)
{
  uint64_t valuePtr;

  valuePtr = a2;
  return CFNumberCreate(a1, kCFNumberSInt64Type, &valuePtr);
}

const __CFNumber *sub_100009B98(const __CFNumber *result)
{
  const __CFNumber *v1;
  CFTypeID v2;
  uint64_t valuePtr;

  valuePtr = 0;
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
      return (const __CFNumber *)valuePtr;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

UInt8 *sub_100009BF4(const __CFString *a1)
{
  CFIndex Length;
  UInt8 *v3;
  CFIndex maxBufLen;
  CFRange v6;
  CFRange v7;

  if (!a1)
    return 0;
  maxBufLen = 0;
  Length = CFStringGetLength(a1);
  v6.location = 0;
  v6.length = Length;
  if (!CFStringGetBytes(a1, v6, 0x8000100u, 0, 0, 0, 0, &maxBufLen))
    return 0;
  v3 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0xF4C2DB0DuLL);
  if (v3)
  {
    v7.location = 0;
    v7.length = Length;
    CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, v3, maxBufLen, 0);
    v3[maxBufLen] = 0;
  }
  return v3;
}

UInt8 *sub_100009CC0(const __CFURL *a1)
{
  const __CFString *v1;
  const __CFString *v2;
  UInt8 *v3;

  if (!a1)
    return 0;
  v1 = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_100009BF4(v1);
  CFRelease(v2);
  return v3;
}

const char *sub_100009D08(unsigned int a1)
{
  if (a1 > 0x11)
    return "Unknown Kind";
  else
    return (&off_100020FB8)[a1];
}

CFMutableDataRef sub_100009D2C(const __CFAllocator *a1, uint64_t a2)
{
  CFMutableDataRef Mutable;

  Mutable = CFDataCreateMutable(a1, 0);
  if (Mutable && !__CFBinaryPlistWriteToStream(a2, Mutable))
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

CFMutableDataRef sub_100009D78(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v5;
  const __CFUUID *Value;
  CFStringRef v7;
  CFStringRef v8;
  const __CFURL *v9;
  CFStringRef v10;
  CFStringRef v11;
  const __CFUUID *v12;
  CFStringRef v13;
  CFStringRef v14;
  CFMutableDataRef v15;

  if (!theDict)
    return 0;
  MutableCopy = CFDictionaryCreateMutableCopy(a1, 0, theDict);
  if (!MutableCopy)
    return 0;
  v5 = MutableCopy;
  Value = (const __CFUUID *)CFDictionaryGetValue(theDict, CFSTR("DAMediaUUID"));
  if (Value)
  {
    v7 = CFUUIDCreateString(a1, Value);
    if (v7)
    {
      v8 = v7;
      CFDictionarySetValue(v5, CFSTR("DAMediaUUID"), v7);
      CFRelease(v8);
    }
  }
  v9 = (const __CFURL *)CFDictionaryGetValue(theDict, CFSTR("DAVolumePath"));
  if (v9)
  {
    v10 = CFURLCopyFileSystemPath(v9, kCFURLPOSIXPathStyle);
    if (v10)
    {
      v11 = v10;
      CFDictionarySetValue(v5, CFSTR("DAVolumePath"), v10);
      CFRelease(v11);
    }
  }
  v12 = (const __CFUUID *)CFDictionaryGetValue(theDict, CFSTR("DAVolumeUUID"));
  if (v12)
  {
    v13 = CFUUIDCreateString(a1, v12);
    if (v13)
    {
      v14 = v13;
      CFDictionarySetValue(v5, CFSTR("DAVolumeUUID"), v13);
      CFRelease(v14);
    }
  }
  v15 = sub_100009D2C(a1, (uint64_t)v5);
  CFRelease(v5);
  return v15;
}

CFPropertyListRef sub_100009EA4(const __CFAllocator *a1, const __CFData *a2)
{
  return CFPropertyListCreateWithData(a1, a2, 0, 0, 0);
}

__CFDictionary *sub_100009EB4(const __CFAllocator *a1, const __CFData *a2)
{
  const __CFDictionary *v3;
  __CFDictionary *v4;
  const __CFString *Value;
  CFUUIDRef v6;
  CFUUIDRef v7;
  const __CFString *v8;
  CFURLRef v9;
  CFURLRef v10;
  const __CFString *v11;
  CFUUIDRef v12;
  CFUUIDRef v13;

  v3 = (const __CFDictionary *)CFPropertyListCreateWithData(a1, a2, 1uLL, 0, 0);
  v4 = v3;
  if (v3)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v3, CFSTR("DAMediaUUID"));
    if (Value)
    {
      v6 = CFUUIDCreateFromString(a1, Value);
      if (v6)
      {
        v7 = v6;
        CFDictionarySetValue(v4, CFSTR("DAMediaUUID"), v6);
        CFRelease(v7);
      }
    }
    v8 = (const __CFString *)CFDictionaryGetValue(v4, CFSTR("DAVolumePath"));
    if (v8)
    {
      v9 = CFURLCreateWithFileSystemPath(a1, v8, kCFURLPOSIXPathStyle, 1u);
      if (v9)
      {
        v10 = v9;
        CFDictionarySetValue(v4, CFSTR("DAVolumePath"), v9);
        CFRelease(v10);
      }
    }
    v11 = (const __CFString *)CFDictionaryGetValue(v4, CFSTR("DAVolumeUUID"));
    if (v11)
    {
      v12 = CFUUIDCreateFromString(a1, v11);
      if (v12)
      {
        v13 = v12;
        CFDictionarySetValue(v4, CFSTR("DAVolumeUUID"), v12);
        CFRelease(v13);
      }
    }
  }
  return v4;
}

__CFDictionary *sub_100009FC8(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  const __CFData *v4;
  const __CFData *v5;
  __CFDictionary *v6;

  if (!a2)
    return 0;
  v4 = CFDataCreateWithBytesNoCopy(a1, a2, a3, kCFAllocatorNull);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = sub_100009EB4(a1, v4);
  CFRelease(v5);
  return v6;
}

CFPropertyListRef sub_10000A024(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  const __CFData *v4;
  const __CFData *v5;
  CFPropertyListRef v6;

  if (!a2)
    return 0;
  v4 = CFDataCreateWithBytesNoCopy(a1, a2, a3, kCFAllocatorNull);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFPropertyListCreateWithData(a1, v4, 0, 0, 0);
  CFRelease(v5);
  return v6;
}

char *sub_10000A08C(uint64_t a1)
{
  char *v3;
  char v4[1024];
  char v5[1024];

  v3 = 0;
  if (!strcmp((const char *)(a1 + 72), "lifs")
    && (__strlcpy_chk(v5, a1 + 1112, 1024, 1024), !sub_10000A184(v5, v4, 1024)))
  {
    asprintf(&v3, "/dev/%s");
  }
  else if (!strncmp((const char *)(a1 + 1112), "/dev/", 5uLL))
  {
    asprintf(&v3, "%s");
  }
  else
  {
    asprintf(&v3, "%s?owner=%u");
  }
  return v3;
}

uint64_t sub_10000A184(char *a1, char *a2, int a3)
{
  char *v6;
  char *v7;
  char *v8;
  char *v9;

  v6 = strstr(a1, "://");
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  if (!strncmp(a1, "apfs", 4uLL))
    return 0xFFFFFFFFLL;
  v8 = v7 + 3;
  v9 = strrchr(v8, 47);
  if (!v9)
    return 0xFFFFFFFFLL;
  *v9 = 0;
  strlcpy(a2, v8, a3);
  return 0;
}

char *sub_10000A210(uint64_t a1)
{
  char v3[1024];
  char v4[1024];

  if (!strcmp((const char *)(a1 + 72), "lifs")
    && (__strlcpy_chk(v4, a1 + 1112, 1024, 1024), !sub_10000A184(v4, v3, 1024)))
  {
    snprintf(byte_100024D50, 0x411uLL, "/dev/%s");
  }
  else if (!strncmp((const char *)(a1 + 1112), "/dev/", 5uLL))
  {
    snprintf(byte_100024D50, 0x411uLL, "%s");
  }
  else
  {
    snprintf(byte_100024D50, 0x411uLL, "%s?owner=%u");
  }
  return byte_100024D50;
}

uint64_t sub_10000A320(uint64_t a1, char *a2, int a3)
{
  char *v5;
  const char *v6;
  char *v7;
  char __s1[1024];

  __strlcpy_chk(__s1, a1 + 1112, 1024, 1024);
  v5 = strstr(__s1, "://");
  if (!v5)
    return 0xFFFFFFFFLL;
  v6 = v5 + 3;
  v7 = strrchr(v5 + 3, 47);
  if (!v7)
    return 0xFFFFFFFFLL;
  *v7 = 0;
  strlcpy(a2, "/dev/", a3);
  strlcat(a2, v6, a3);
  return 0;
}

void sub_10000A3F0(char *cStr, ...)
{
  va_list va;

  va_start(va, cStr);
  sub_10000A420(5, cStr, va);
}

void sub_10000A420(int a1, char *cStr, va_list a3)
{
  const char *v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  char *v12;

  if (a3)
    v4 = (const char *)sub_1000052B4(cStr, a3);
  else
    v4 = strdup(cStr);
  v5 = (char *)v4;
  if (v4)
  {
    switch(a1)
    {
      case 3:
        v9 = qword_100025190;
        if (os_log_type_enabled((os_log_t)qword_100025190, OS_LOG_TYPE_ERROR))
          sub_10001AEF8((uint64_t)v5, v9);
        goto LABEL_24;
      case 6:
        if (byte_100025168 && qword_100025170)
          sub_10000A860(v4);
        v10 = qword_100025190;
        if (!os_log_type_enabled((os_log_t)qword_100025190, OS_LOG_TYPE_DEFAULT))
          goto LABEL_24;
        v11 = 136446210;
        v12 = v5;
        break;
      case 7:
        if (byte_100025168)
        {
          if (qword_100025170)
            sub_10000A860(v4);
        }
        v6 = qword_100025190;
        if (!os_log_type_enabled((os_log_t)qword_100025190, OS_LOG_TYPE_INFO))
          goto LABEL_24;
        v11 = 136446210;
        v12 = v5;
        v7 = v6;
        v8 = OS_LOG_TYPE_INFO;
        goto LABEL_23;
      default:
        v10 = qword_100025190;
        if (!os_log_type_enabled((os_log_t)qword_100025190, OS_LOG_TYPE_DEFAULT))
        {
LABEL_24:
          free(v5);
          return;
        }
        v11 = 136446210;
        v12 = v5;
        break;
    }
    v7 = v10;
    v8 = OS_LOG_TYPE_DEFAULT;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%{public}s", (uint8_t *)&v11, 0xCu);
    goto LABEL_24;
  }
}

void sub_10000A5E8()
{
  byte_100025168 = 0;
  if (qword_100025170)
  {
    fclose((FILE *)qword_100025170);
    qword_100025170 = 0;
  }
  closelog();
}

void sub_10000A61C(char *cStr, ...)
{
  char *v2;
  va_list va;

  va_start(va, cStr);
  if (byte_100025178 == 1)
  {
    v2 = (char *)qword_100025180;
    if (!qword_100025180)
      sub_10001AF6C();
    if (qword_100025188)
      free((void *)qword_100025188);
    qword_100025188 = (uint64_t)v2;
    qword_100025180 = 0;
    byte_100025178 = 0;
    sub_10000A420(7, v2, 0);
  }
  sub_10000A420(7, cStr, va);
}

void sub_10000A6B4(char *cStr, ...)
{
  UInt8 *v2;
  UInt8 *v3;
  va_list va;

  va_start(va, cStr);
  if (qword_100025180)
  {
    free((void *)qword_100025180);
    qword_100025180 = 0;
    byte_100025178 = 0;
  }
  if (cStr)
  {
    v2 = sub_1000052B4(cStr, va);
    if (v2)
    {
      v3 = v2;
      if (qword_100025188 && !strcmp((const char *)qword_100025188, (const char *)v2))
      {
        free(v3);
      }
      else
      {
        qword_100025180 = (uint64_t)v3;
        byte_100025178 = 1;
      }
    }
  }
}

void sub_10000A748(char *cStr, ...)
{
  va_list va;

  va_start(va, cStr);
  sub_10000A420(7, cStr, va);
  sub_10000A420(3, cStr, va);
}

void sub_10000A798(char *cStr, ...)
{
  va_list va;

  va_start(va, cStr);
  sub_10000A420(6, cStr, va);
}

void sub_10000A7C8(const char *a1, int a2)
{
  char *__filename;

  qword_100025190 = (uint64_t)os_log_create("com.apple.DiskArbitration.diskarbitrationd", "default");
  openlog(a1, 1, 24);
  if (a2)
  {
    __filename = 0;
    asprintf(&__filename, "/var/log/%s.log", a1);
    if (__filename)
    {
      qword_100025170 = (uint64_t)fopen(__filename, "a");
      free(__filename);
    }
  }
  byte_100025168 = a2;
}

uint64_t sub_10000A860(const char *a1)
{
  tm *v2;
  time_t v4;
  char v5[10];

  v4 = time(0);
  v2 = localtime(&v4);
  if (strftime(v5, 0xAuLL, "%T ", v2))
    fputs(v5, (FILE *)qword_100025170);
  fputs(a1, (FILE *)qword_100025170);
  fputc(10, (FILE *)qword_100025170);
  return fflush((FILE *)qword_100025170);
}

uint64_t sub_10000A910(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _OWORD v12[2];

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 16);
  v4 = *(id *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = v5;
  if (objc_opt_class(FSClient))
  {
    v8 = (void *)objc_opt_new(FSAuditToken);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tokenWithRuid:", dword_10002527C));

    if (v9)
      objc_msgSend(v9, "audit_token");
    else
      memset(v12, 0, sizeof(v12));
    v10 = (uint64_t)+[FSKitDiskArbHelper DAMountUserFSVolume:deviceName:mountPoint:volumeName:auditToken:mountOptions:](FSKitDiskArbHelper, "DAMountUserFSVolume:deviceName:mountPoint:volumeName:auditToken:mountOptions:", v2, v3, v4, v7, v12, v6);

  }
  else
  {
    sub_10000A748("Attempt to use FSKit, when not present, to mount volume of type %@", v2);
    v10 = 43;
  }

  return v10;
}

uint64_t sub_10000AA40(const char *a1, int a2)
{
  xpc_connection_t mach_service;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;
  char *v9;
  uint64_t v10;
  int64_t int64;

  mach_service = xpc_connection_create_mach_service("com.apple.filesystems.userfs_helper", 0, 0);
  if (!mach_service)
    sub_10001AF94();
  v5 = mach_service;
  if (xpc_get_type(mach_service) != (xpc_type_t)&_xpc_type_connection)
    sub_10001AFBC();
  xpc_connection_set_event_handler(v5, &stru_100021068);
  xpc_connection_resume(v5);
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "path", a1);
  xpc_dictionary_set_int64(v6, "flags", a2);
  v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
  v8 = v7;
  if (!v7)
  {
    v9 = "NULL";
    goto LABEL_7;
  }
  if (xpc_get_type(v7) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v9 = xpc_copy_description(v8);
LABEL_7:
    sub_10000A798("open:invalidReply:%{public}s", v9);
    v10 = 0xFFFFFFFFLL;
    LODWORD(int64) = 5;
    goto LABEL_8;
  }
  v10 = xpc_dictionary_dup_fd(v8, "fd");
  if ((v10 & 0x80000000) == 0)
    goto LABEL_9;
  int64 = xpc_dictionary_get_int64(v8, "error");
  sub_10000A798("open:error:%d", int64);
  if (!int64)
    LODWORD(int64) = 5;
LABEL_8:
  *__error() = int64;
LABEL_9:
  xpc_connection_cancel(v5);

  return v10;
}

void start(int a1, char **a2)
{
  int v4;
  NSObject *v5;

  qword_1000252E8 = (uint64_t)basename(*a2);
  if (!geteuid())
  {
    while (1)
    {
      v4 = getopt(a1, a2, "d") << 24;
      if (v4 != 1677721600)
        break;
      byte_100025198 = 1;
    }
    if (v4 == -16777216)
    {
      signal(15, (void (__cdecl *)(int))sub_10000ACF0);
      v5 = sub_100013AFC();
      dispatch_async_and_wait_f(v5, 0, (dispatch_function_t)sub_10000AD08);
      dispatch_main();
    }
    fprintf(__stderrp, "%s: [-d]\n", (const char *)qword_1000252E8);
    fwrite("options:\n", 9uLL, 1uLL, __stderrp);
    fwrite("\t-d\tenable debugging\n", 0x15uLL, 1uLL, __stderrp);
    exit(64);
  }
  fprintf(__stderrp, "%s: permission denied.\n", (const char *)qword_1000252E8);
  exit(77);
}

uint64_t sub_10000ACF0(uint64_t result)
{
  if ((_DWORD)result == 15)
    byte_100025290 = 1;
  return result;
}

uint64_t sub_10000AD08()
{
  IONotificationPortRef v0;
  IONotificationPort *v1;
  NSObject *v2;
  IONotificationPort *v3;
  const __CFDictionary *v4;
  IONotificationPort *v5;
  const __CFDictionary *v6;
  NSObject *v7;
  NSObject *v8;
  FILE *v9;
  FILE *v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  _QWORD handler[5];
  char __str[1024];
  _BYTE v17[2168];

  sub_1000078CC();
  sub_1000084F0();
  sub_100013DEC();
  qword_100025268 = (uint64_t)CFURLCreateWithFileSystemPath(kCFAllocatorDefault, CFSTR("/System/Library/Frameworks/DiskArbitration.framework"), kCFURLPOSIXPathStyle, 1u);
  if (!qword_100025268)
    sub_10001AFE4();
  sub_10000A7C8((const char *)qword_1000252E8, byte_100025198);
  dword_1000252E0 = getpid();
  asprintf((char **)&qword_1000252F0, "%s [%d]", (const char *)qword_1000252E8, dword_1000252E0);
  if (!qword_1000252F0)
    sub_10001B00C();
  qword_100025288 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_100025288)
    sub_10001B034();
  qword_100025298 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_100025298)
    sub_10001B05C();
  qword_1000252A0 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_1000252A0)
    sub_10001B084();
  qword_1000252C0 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_1000252C0)
    sub_10001B0AC();
  qword_1000252C8 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_1000252C8)
    sub_10001B0D4();
  qword_1000252D0 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!qword_1000252D0)
    sub_10001B0FC();
  qword_1000252D8 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_1000252D8)
    sub_10001B124();
  qword_1000252F8 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_1000252F8)
    sub_10001B14C();
  qword_100025300 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_100025300)
    sub_10001B174();
  qword_100025308 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!qword_100025308)
    sub_10001B19C();
  qword_100025310 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!qword_100025310)
    sub_10001B1C4();
  sub_100013B74();
  v0 = IONotificationPortCreate(kIOMainPortDefault);
  qword_1000252B8 = (uint64_t)v0;
  if (!v0)
  {
    sub_10000A748("could not create I/O Kit notification port.");
    goto LABEL_47;
  }
  v1 = v0;
  v2 = sub_100013AFC();
  IONotificationPortSetDispatchQueue(v1, v2);
  if (!sub_1000084AC())
  {
    sub_10000A748("could not create file system run loop channel.");
    goto LABEL_47;
  }
  if (!sub_100017F78())
  {
    sub_10000A748("could not create thread run loop channel.");
    goto LABEL_47;
  }
  v3 = (IONotificationPort *)qword_1000252B8;
  v4 = IOServiceMatching("IOMedia");
  IOServiceAddMatchingNotification(v3, "IOServiceTerminate", v4, (IOServiceMatchingCallback)sub_100011BD4, 0, (io_iterator_t *)&dword_1000252B0);
  if (!dword_1000252B0)
  {
    sub_10000A748("could not create \"media disappeared\" notification.");
    goto LABEL_47;
  }
  v5 = (IONotificationPort *)qword_1000252B8;
  v6 = IOServiceMatching("IOMedia");
  IOServiceAddMatchingNotification(v5, "IOServiceMatched", v6, (IOServiceMatchingCallback)sub_1000110C0, 0, (io_iterator_t *)&dword_1000252AC);
  if (!dword_1000252AC)
  {
    sub_10000A748("could not create \"media appeared\" notification.");
LABEL_47:
    exit(70);
  }
  if ((os_variant_has_factory_content("com.apple.diskarbitrationd") & 1) == 0)
    sub_100010F50();
  v7 = sub_100013AFC();
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vfs, 0, 0x118uLL, v7);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_10000B270;
  handler[3] = &unk_100021088;
  handler[4] = v8;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(v8);
  snprintf(__str, 0x400uLL, "/var/run/%s.pid", (const char *)qword_1000252E8);
  v9 = fopen(__str, "w");
  if (v9)
  {
    v10 = v9;
    fprintf(v9, "%d\n", dword_1000252E0);
    fclose(v10);
  }
  sub_10000A798("");
  sub_10000A798("server has been started.");
  if (qword_100025270)
    sub_10000A798("  console user = %@ [%d].", qword_100025270, dword_10002527C);
  else
    sub_10000A798("  console user = none.", v13, v14);
  sub_1000176A0();
  sub_1000155B4();
  sub_100016CB8();
  sub_100017070();
  sub_10001748C();
  sub_100011BD4(0, dword_1000252B0);
  sub_1000110C0(0, dword_1000252AC);
  memset(v17, 0, 512);
  if (!sub_10000982C("/", v17, 2))
    sub_100013860((uint64_t)v17);
  v11 = sub_100013AFC();
  xpc_set_event_stream_handler("com.apple.iokit.matching", v11, &stru_1000210C8);
  return notify_post("com.apple.diskarbitrationd.launched");
}

void sub_10000B270(uint64_t a1)
{
  __int16 data;
  __int16 v2;

  data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  v2 = data;
  if ((data & 8) != 0)
  {
    sub_100013938();
    if ((v2 & 0x10) == 0)
    {
LABEL_3:
      if ((v2 & 0x100) == 0)
        return;
LABEL_7:
      sub_100013A74();
      return;
    }
  }
  else if ((data & 0x10) == 0)
  {
    goto LABEL_3;
  }
  sub_100013A74();
  if ((v2 & 0x100) != 0)
    goto LABEL_7;
}

void sub_10000B2BC(id a1, void *a2)
{
  sub_10000A61C("iokit.matching: got event object to process:", a2);
}

void sub_10000B2C8(uint64_t a1, const void *a2, void (*a3)(_QWORD, _QWORD, _QWORD), uint64_t a4, int a5, int a6, int a7, int a8)
{
  uint64_t v8;

  sub_10000B2E8(a1, a2, a3, a4, a5, a6, a7, a8, 0, v8);
}

void sub_10000B2E8(uint64_t a1, const void *a2, void (*a3)(_QWORD, _QWORD, _QWORD), uint64_t a4, int a5, int a6, int a7, int a8, const __CFString *cf1, uint64_t a10)
{
  uint64_t v14;
  void *v15;
  uint64_t v16;
  CFMutableStringRef Mutable;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  const void *v19;
  const __CFBoolean *v20;
  const __CFString *v21;
  const __CFString **v22;
  uint64_t v23;
  _BYTE *v24;
  int v25;
  io_registry_entry_t v26;
  CFTypeRef v27;
  const void *v28;
  uint64_t v29;
  CFIndex Count;
  CFIndex v31;
  CFIndex v32;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v34;
  const void *Value;
  const void *v36;
  const void *v37;
  const void *v38;
  CFTypeID v39;
  uint64_t v40;
  const __CFString *v41;
  CFTypeID v42;
  CFTypeID v43;
  io_service_t v44;
  const __CFString *v45;
  const __CFString *v46;
  const void *v47;
  CFIndex v48;
  CFIndex v49;
  CFIndex v50;
  const __CFDictionary *v51;
  const __CFDictionary *v52;
  const void *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFBoolean *v56;
  const void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  const char **v75;
  const char *v76;
  int v77;
  int v78;
  const char *v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  const __CFURL *v83;
  uint64_t v84;
  uint64_t v85;
  const void *v86;
  uint64_t v87;
  uint64_t v88;
  CFBooleanRef v89;
  CFTypeRef cf;
  int v91;
  BOOLean_t matches;
  const __CFString **v93;

  v14 = sub_1000077F4(a1);
  if (a2)
    CFRetain(a2);
  v93 = 0;
  v15 = malloc_type_malloc(0x50uLL, 0x10E004044FAF12CuLL);
  if (!v15)
  {
    Mutable = 0;
    v23 = 12;
    if (a2)
      goto LABEL_89;
    goto LABEL_90;
  }
  v16 = (uint64_t)v15;
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (!Mutable)
  {
    v23 = 12;
    goto LABEL_88;
  }
  v87 = a4;
  v88 = v14;
  v18 = a3;
  cf = (CFTypeRef)a1;
  v19 = a2;
  v20 = kCFBooleanTrue;
  v93 = (const __CFString **)&a10;
  v21 = cf1;
  if (cf1)
  {
    v89 = 0;
    v91 = 0;
    do
    {
      if (CFEqual(v21, CFSTR("force")))
      {
        v91 = 1;
      }
      else if (CFEqual(v21, CFSTR("automatic")))
      {
        v20 = 0;
        v89 = kCFBooleanTrue;
      }
      else
      {
        CFStringAppend(Mutable, v21);
        CFStringAppend(Mutable, CFSTR(","));
      }
      v22 = v93++;
      v21 = *v22;
    }
    while (*v22);
  }
  else
  {
    v91 = 0;
    v89 = 0;
  }
  CFStringTrim(Mutable, CFSTR(","));
  v24 = (_BYTE *)v16;
  *(_BYTE *)v16 = v20 == 0;
  a2 = v19;
  a3 = v18;
  if (sub_100007790((uint64_t)cf, CFSTR("DADeviceTDMLocked")) == kCFBooleanTrue)
  {
    if (!sub_100017C24((uint64_t)cf, 16))
    {
      v23 = 1;
      goto LABEL_87;
    }
    v24 = (_BYTE *)v16;
    if (!sub_10000C330((uint64_t)cf, CFSTR("PreBoot")))
    {
      v23 = 1;
      goto LABEL_88;
    }
  }
  v16 = (uint64_t)v24;
  if (*v24 == 1)
  {
    if (sub_100017C24((uint64_t)cf, 16))
    {
      v25 = sub_10000C330((uint64_t)cf, CFSTR("System"));
      v26 = sub_100007788((uint64_t)cf);
      v27 = IORegistryEntrySearchCFProperty(v26, "IOService", CFSTR("Role"), kCFAllocatorDefault, 0);
      if (v27)
        CFRelease(v27);
      if (v25)
      {
        CFStringInsert(Mutable, 0, CFSTR(","));
        CFStringInsert(Mutable, 0, CFSTR("rdonly"));
      }
    }
    if (*(_BYTE *)v16 == 1 && sub_1000078A0((uint64_t)cf, 64))
    {
      CFStringInsert(Mutable, 0, CFSTR(","));
      CFStringInsert(Mutable, 0, CFSTR("quarantine"));
    }
  }
  if (sub_10000BD90(Mutable, CFSTR("update")))
  {
    if (a2)
      goto LABEL_35;
    v28 = sub_100007790((uint64_t)cf, CFSTR("DAVolumePath"));
    a2 = v28;
    if (!v28)
      goto LABEL_35;
    CFRetain(v28);
  }
  if (sub_10000BD90(Mutable, CFSTR("-s=")))
  {
    if (!a2 || (v29 = (uint64_t)sub_100007790((uint64_t)cf, CFSTR("DAVolumePath"))) == 0)
    {
LABEL_35:
      v23 = 22;
LABEL_87:
      a4 = v87;
      goto LABEL_88;
    }
  }
  else
  {
    v29 = sub_1000077EC((uint64_t)cf);
  }
  Count = CFArrayGetCount((CFArrayRef)qword_1000252C0);
  v86 = a2;
  v85 = v29;
  if (Count < 1)
    goto LABEL_65;
  v31 = Count;
  v84 = v16;
  v32 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000252C0, v32);
    if (!ValueAtIndex)
      goto LABEL_50;
    v34 = ValueAtIndex;
    Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("DAProbeID"));
    v36 = CFDictionaryGetValue(v34, CFSTR("DAProbeKind"));
    if (v36)
    {
      v37 = v36;
      v38 = sub_1000084B0(v14);
      if (!CFEqual(v37, v38))
        goto LABEL_50;
    }
    v39 = CFGetTypeID(Value);
    if (v39 == CFUUIDGetTypeID())
    {
      v40 = (uint64_t)cf;
      v41 = CFSTR("DAVolumeUUID");
      goto LABEL_49;
    }
    v42 = CFGetTypeID(Value);
    if (v42 != CFStringGetTypeID())
      break;
    v40 = (uint64_t)cf;
    v41 = CFSTR("DAVolumeName");
LABEL_49:
    if (!sub_1000063D0(v40, v41, Value))
      goto LABEL_54;
LABEL_50:
    if (v31 == ++v32)
      goto LABEL_64;
  }
  v43 = CFGetTypeID(Value);
  if (v43 != CFDictionaryGetTypeID())
    goto LABEL_50;
  matches = 0;
  v44 = sub_100007788((uint64_t)cf);
  IOServiceMatchPropertyTable(v44, (CFDictionaryRef)Value, &matches);
  if (!matches)
    goto LABEL_50;
LABEL_54:
  if (!v20)
  {
    v20 = (const __CFBoolean *)CFDictionaryGetValue(v34, CFSTR("DAMountAutomatic"));
    if (v20 == kCFBooleanTrue)
    {
      sub_100007DAC((uint64_t)cf, 16, 1);
      sub_100007DAC((uint64_t)cf, 32, 1);
      v20 = kCFBooleanTrue;
    }
  }
  v45 = (const __CFString *)CFDictionaryGetValue(v34, CFSTR("DAMountOptions"));
  if (v45)
  {
    v46 = v45;
    CFStringInsert(Mutable, 0, CFSTR(","));
    CFStringInsert(Mutable, 0, v46);
  }
  if (!a2)
  {
    v47 = CFDictionaryGetValue(v34, CFSTR("DAMountPath"));
    if (v47)
    {
      v86 = v47;
      CFRetain(v47);
    }
    else
    {
      v86 = 0;
    }
  }
LABEL_64:
  v16 = v84;
LABEL_65:
  v48 = CFArrayGetCount((CFArrayRef)qword_1000252C8);
  if (v48 >= 1)
  {
    v49 = v48;
    v50 = 0;
    while (1)
    {
      v51 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000252C8, v50);
      if (v51)
      {
        v52 = v51;
        v53 = CFDictionaryGetValue(v51, CFSTR("DAProbeID"));
        if (!sub_1000063D0((uint64_t)cf, CFSTR("DAVolumeUUID"), v53))
          break;
      }
      if (v49 == ++v50)
        goto LABEL_73;
    }
    v54 = (const __CFString *)CFDictionaryGetValue(v52, CFSTR("DAMountOptions"));
    if (v54)
    {
      v55 = v54;
      CFStringInsert(Mutable, 0, CFSTR(","));
      CFStringInsert(Mutable, 0, v55);
    }
  }
LABEL_73:
  a3 = v18;
  if (!v20)
  {
    if (sub_1000078A0((uint64_t)cf, 16))
      v20 = sub_1000078A0((uint64_t)cf, 32) ? kCFBooleanTrue : 0;
    else
      v20 = kCFBooleanFalse;
    if (!v20 && !byte_100025318)
    {
      if (sub_10000C0D8((uint64_t)cf, 0))
      {
        sub_10000A798(" No console users yet, delaying mount of %@", cf);
        v20 = kCFBooleanFalse;
      }
      else
      {
        v20 = 0;
      }
    }
  }
  a2 = v86;
  if (v20 == kCFBooleanFalse)
  {
    v23 = 89;
    goto LABEL_87;
  }
  if (sub_100007790((uint64_t)cf, CFSTR("DAMediaWritable")) == kCFBooleanFalse)
  {
    CFStringInsert(Mutable, 0, CFSTR(","));
    CFStringInsert(Mutable, 0, CFSTR("rdonly"));
  }
  v56 = v89;
  if (!sub_10000C0D8((uint64_t)cf, 1))
  {
    CFStringInsert(Mutable, 0, CFSTR(","));
    CFStringInsert(Mutable, 0, CFSTR("nosuid"));
    CFStringInsert(Mutable, 0, CFSTR(","));
    CFStringInsert(Mutable, 0, CFSTR("noowners"));
    CFStringInsert(Mutable, 0, CFSTR(","));
    CFStringInsert(Mutable, 0, CFSTR("nodev"));
  }
  v57 = sub_1000084B0(v88);
  a4 = v87;
  if (CFEqual(v57, CFSTR("hfs")))
  {
    sub_1000053C8(Mutable, 0, CFSTR("-m=%o,"), v58, v59, v60, v61, v62, 237);
    if (sub_1000078BC((uint64_t)cf))
      v68 = sub_1000078BC((uint64_t)cf);
    else
      v68 = 99;
    sub_1000053C8(Mutable, 0, CFSTR("-g=%d,"), v63, v64, v65, v66, v67, v68);
    if (sub_1000078C4((uint64_t)cf))
      v74 = sub_1000078C4((uint64_t)cf);
    else
      v74 = 99;
    sub_1000053C8(Mutable, 0, CFSTR("-u=%d,"), v69, v70, v71, v72, v73, v74);
  }
  CFStringTrim(Mutable, CFSTR(","));
  sub_10000A798(" Mount options %@", Mutable);
  if (!v89 && (v56 = kCFBooleanTrue, sub_10000BD90(Mutable, CFSTR("rdonly"))) || v56 == kCFBooleanFalse)
  {
    v56 = kCFBooleanFalse;
    if (sub_1000078A0((uint64_t)cf, 2) && !v91)
    {
      v23 = 92;
      a3 = v18;
      goto LABEL_88;
    }
  }
  if (v56 == kCFBooleanTrue)
  {
    if (sub_1000078A0((uint64_t)cf, 2))
      v56 = kCFBooleanTrue;
    else
      v56 = kCFBooleanFalse;
  }
  CFRetain(cf);
  *(_DWORD *)(v16 + 4) = 0;
  *(_QWORD *)(v16 + 8) = v18;
  *(_QWORD *)(v16 + 16) = v87;
  *(_QWORD *)(v16 + 24) = cf;
  *(_BYTE *)(v16 + 32) = v91;
  *(_QWORD *)(v16 + 40) = v86;
  *(_QWORD *)(v16 + 48) = Mutable;
  *(_QWORD *)(v16 + 56) = v85;
  *(_QWORD *)(v16 + 64) = 0;
  *(_DWORD *)(v16 + 72) = -1;
  if (v56 != kCFBooleanTrue)
  {
    sub_10000C418(89, v16);
    return;
  }
  v75 = sub_100007DF8((uint64_t)cf);
  *(_QWORD *)(v16 + 64) = v75;
  if (v75)
  {
    v76 = (const char *)sub_100007774((uint64_t)v75, 1);
    v77 = sub_10000AA40(v76, 2);
    a3 = v18;
    if (v77 != -1)
    {
      v78 = v77;
      sub_100017E38(*(_QWORD *)(v16 + 64), 1, 1);
      CFRetain(*(CFTypeRef *)(v16 + 64));
      goto LABEL_123;
    }
LABEL_126:
    v23 = *__error();
    if (!(_DWORD)v23)
      return;
LABEL_88:
    free((void *)v16);
    if (a2)
LABEL_89:
      CFRelease(a2);
LABEL_90:
    if (Mutable)
      CFRelease(Mutable);
    if (a3)
      a3(v23, 0, a4);
    return;
  }
  v79 = (const char *)sub_100007774((uint64_t)cf, 1);
  v78 = sub_10000AA40(v79, 2);
  a3 = v18;
  if (v78 == -1)
    goto LABEL_126;
LABEL_123:
  v80 = dup(v78);
  close(v78);
  *(_DWORD *)(v16 + 72) = v80;
  sub_10000A798("repaired disk, id = %@, ongoing.", cf);
  IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), CFSTR("com.apple.DiskArbitration.diskarbitrationd"), 0, 0, 0, 0.0, 0, (IOPMAssertionID *)(v16 + 4));
  v81 = sub_1000077F4((uint64_t)cf);
  v82 = *(_QWORD *)(v16 + 64);
  if (!v82)
    v82 = (uint64_t)cf;
  v83 = (const __CFURL *)sub_1000077EC(v82);
  sub_100008FB8(v81, v83, *(unsigned int *)(v16 + 72), sub_10000C418, v16);
}

BOOL sub_10000BD90(const __CFString *a1, CFStringRef theString)
{
  const void *v4;
  const CFBooleanRef *v5;
  CFBooleanRef v6;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  const __CFBoolean *v11;
  CFIndex v12;
  const __CFString *v13;
  const __CFString *ValueAtIndex;
  __CFString *MutableCopy;
  const __CFString *v16;
  const __CFString *Copy;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  CFStringRef v21;
  const void *v22;
  const CFBooleanRef *v23;
  const __CFString *v24;
  const __CFBoolean *v25;
  const __CFBoolean *v27;
  CFRange v28;
  CFRange v29;
  CFRange v30;

  if (CFStringHasPrefix(theString, CFSTR("no")))
  {
    v28.length = CFStringGetLength(theString) - 2;
    v28.location = 2;
    v4 = CFStringCreateWithSubstring(kCFAllocatorDefault, theString, v28);
    v5 = &kCFBooleanFalse;
  }
  else
  {
    v4 = CFRetain(theString);
    v5 = &kCFBooleanTrue;
  }
  v6 = *v5;
  if (v4)
  {
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, a1, CFSTR(","));
    if (ArrayBySeparatingStrings)
    {
      v8 = ArrayBySeparatingStrings;
      v27 = v6;
      Count = CFArrayGetCount(ArrayBySeparatingStrings);
      if (Count >= 1)
      {
        v10 = Count;
        v11 = 0;
        v12 = 0;
        v13 = CFSTR("-s=");
        while (1)
        {
          if (!CFArrayGetValueAtIndex(v8, v12))
            goto LABEL_38;
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v8, v12);
          MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, ValueAtIndex);
          if (!MutableCopy)
            goto LABEL_38;
          v16 = MutableCopy;
          CFStringLowercase(MutableCopy, 0);
          Copy = CFStringCreateCopy(kCFAllocatorDefault, v16);
          if (!Copy)
            break;
          v18 = Copy;
          v19 = v13;
          if (!CFStringHasPrefix(Copy, CFSTR("-o")))
          {
            CFRelease(v16);
LABEL_19:
            if (CFStringHasPrefix(v18, CFSTR("no")))
            {
              v30.length = CFStringGetLength(v18) - 2;
              v30.location = 2;
              v22 = CFStringCreateWithSubstring(kCFAllocatorDefault, v18, v30);
              v23 = &kCFBooleanFalse;
              v13 = v19;
              if (!v22)
                goto LABEL_37;
            }
            else
            {
              v13 = v19;
              if (CFStringHasPrefix(v18, v19))
                v24 = v19;
              else
                v24 = v18;
              v22 = CFRetain(v24);
              v23 = &kCFBooleanTrue;
              if (!v22)
                goto LABEL_37;
            }
            v25 = *v23;
            if (CFEqual(v22, CFSTR("ro")))
            {
              CFRelease(v22);
              v22 = CFRetain(CFSTR("rdonly"));
            }
            if (CFEqual(v22, CFSTR("rw")))
            {
              CFRelease(v22);
              v22 = CFRetain(CFSTR("rdonly"));
              if (v25 == kCFBooleanTrue)
                v25 = kCFBooleanFalse;
              else
                v25 = kCFBooleanTrue;
            }
            if (v22)
            {
              if (CFEqual(v4, v22))
                v11 = v25;
              CFRelease(v22);
            }
            v13 = v19;
            goto LABEL_37;
          }
          if (CFStringHasPrefix(v18, CFSTR("-o=")))
            v20 = 3;
          else
            v20 = 2;
          v29.length = CFStringGetLength(v18) - v20;
          v29.location = v20;
          v21 = CFStringCreateWithSubstring(kCFAllocatorDefault, v18, v29);
          CFRelease(v18);
          CFRelease(v16);
          v18 = v21;
          if (v21)
            goto LABEL_19;
          v13 = v19;
LABEL_38:
          if (v10 == ++v12)
            goto LABEL_43;
        }
        v18 = v16;
LABEL_37:
        CFRelease(v18);
        goto LABEL_38;
      }
      v11 = 0;
LABEL_43:
      CFRelease(v8);
      v6 = v27;
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v11 = 0;
  }
  return v6 == v11;
}

uint64_t sub_10000C0D0()
{
  return 0;
}

uint64_t sub_10000C0D8(uint64_t a1, int a2)
{
  const __CFBoolean *v3;
  CFBooleanRef v4;
  const __CFBoolean *v5;
  const __CFDictionary *v6;
  const void **v7;
  const __CFBoolean *Value;
  CFBooleanRef v9;
  const __CFBoolean *v10;
  const void **v11;
  const __CFBoolean *v12;
  const void **v13;
  const CFBooleanRef *v14;
  const __CFBoolean *v15;

  switch(a2)
  {
    case 0:
      v3 = (const __CFBoolean *)sub_100007790(a1, CFSTR("DAMediaRemovable"));
      v4 = kCFBooleanTrue;
      if (v3 == kCFBooleanTrue)
      {
        v9 = v3;
        v6 = (const __CFDictionary *)qword_1000252D0;
        v13 = (const void **)&off_1000213D8;
        goto LABEL_22;
      }
      v5 = (const __CFBoolean *)sub_100007790(a1, CFSTR("DADeviceInternal"));
      v6 = (const __CFDictionary *)qword_1000252D0;
      if (v5 != kCFBooleanTrue)
      {
        v7 = (const void **)&off_1000213C8;
        goto LABEL_26;
      }
      v11 = (const void **)&off_1000213D0;
      goto LABEL_17;
    case 1:
      v9 = kCFBooleanTrue;
      if (sub_100007790(a1, CFSTR("DAMediaRemovable")) == kCFBooleanTrue)
      {
        v6 = (const __CFDictionary *)qword_1000252D0;
        v11 = (const void **)&off_1000213F0;
        goto LABEL_17;
      }
      v10 = (const __CFBoolean *)sub_100007790(a1, CFSTR("DADeviceInternal"));
      v6 = (const __CFDictionary *)qword_1000252D0;
      if (v10 != kCFBooleanTrue)
      {
        v11 = (const void **)&off_1000213E0;
LABEL_17:
        Value = (const __CFBoolean *)CFDictionaryGetValue(v6, *v11);
        v14 = &kCFBooleanFalse;
        goto LABEL_18;
      }
      v13 = (const void **)&off_1000213E8;
LABEL_22:
      Value = (const __CFBoolean *)CFDictionaryGetValue(v6, *v13);
      if (!Value)
        Value = v9;
LABEL_28:
      if (!Value)
        sub_10001B1EC();
      return CFBooleanGetValue(Value);
    case 2:
      v6 = (const __CFDictionary *)qword_1000252D0;
      v11 = (const void **)&off_1000213F8;
      goto LABEL_17;
    case 3:
      v4 = kCFBooleanFalse;
      if (sub_100007790(a1, CFSTR("DADeviceInternal")) == kCFBooleanFalse)
      {
        Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)qword_1000252D0, CFSTR("DAEnableUserFSMountExternal"));
        v14 = &kCFBooleanTrue;
LABEL_18:
        v15 = *v14;
        if (!Value)
          Value = v15;
      }
      else
      {
        v12 = (const __CFBoolean *)sub_100007790(a1, CFSTR("DADeviceInternal"));
        v6 = (const __CFDictionary *)qword_1000252D0;
        if (v12 == kCFBooleanTrue)
          v7 = (const void **)&off_100021408;
        else
          v7 = (const void **)&off_100021410;
LABEL_26:
        Value = (const __CFBoolean *)CFDictionaryGetValue(v6, *v7);
        if (!Value)
          Value = v4;
      }
      goto LABEL_28;
    default:
      Value = kCFBooleanFalse;
      goto LABEL_28;
  }
}

uint64_t sub_10000C330(uint64_t a1, const __CFString *a2)
{
  io_registry_entry_t v3;
  const __CFArray *v4;
  const __CFArray *v5;
  CFTypeID v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const __CFString *ValueAtIndex;
  CFTypeID v11;
  uint64_t v12;

  v3 = sub_100007788(a1);
  v4 = (const __CFArray *)IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("Role"), kCFAllocatorDefault, 0);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFGetTypeID(v4);
  if (v6 == CFArrayGetTypeID() && (Count = CFArrayGetCount(v5), Count >= 1))
  {
    v8 = Count;
    v9 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v5, v9);
      v11 = CFGetTypeID(ValueAtIndex);
      if (v11 == CFStringGetTypeID())
      {
        v12 = 1;
        if (CFStringCompare(ValueAtIndex, a2, 1uLL) == kCFCompareEqualTo)
          break;
      }
      if (v8 == ++v9)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    v12 = 0;
  }
  CFRelease(v5);
  return v12;
}

void sub_10000C418(uint64_t a1, uint64_t a2)
{
  IOPMAssertionID v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  const void *v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFURL *v17;
  const void *v18;
  const __CFURL *v19;
  uid_t v20;
  gid_t v21;

  v4 = *(_DWORD *)(a2 + 4);
  if (v4)
  {
    IOPMAssertionRelease(v4);
    *(_DWORD *)(a2 + 4) = 0;
  }
  v5 = *(_QWORD *)(a2 + 64);
  if (v5)
  {
    sub_100017E38(v5, 1, 0);
    CFRelease(*(CFTypeRef *)(a2 + 64));
    *(_QWORD *)(a2 + 64) = 0;
  }
  v6 = *(_DWORD *)(a2 + 72);
  if (v6 != -1)
    close(v6);
  if ((_DWORD)a1)
  {
    if ((_DWORD)a1 != 89)
    {
      sub_10000A798("repaired disk, id = %@, failure.", *(_QWORD *)(a2 + 24));
      sub_10000A748("unable to repair %@ (status code 0x%08X).", *(_QWORD *)(a2 + 24), a1);
      if (!*(_BYTE *)(a2 + 32))
      {
        v13 = 92;
LABEL_21:
        sub_10000C5FC(v13, (void *)a2, v7, v8, v9, v10, v11, v12);
        return;
      }
    }
  }
  else
  {
    sub_100007DAC(*(_QWORD *)(a2 + 24), 2, 0);
    sub_10000A798("repaired disk, id = %@, success.", *(_QWORD *)(a2 + 24));
  }
  if (!*(_QWORD *)(a2 + 40) && sub_10000C0D8(*(_QWORD *)(a2 + 24), 3) != 1)
  {
    v13 = 28;
    goto LABEL_21;
  }
  sub_10000A798("mounted disk, id = %@, ongoing.", *(_QWORD *)(a2 + 24));
  v14 = *(const void **)(a2 + 40);
  if (v14)
    CFArrayAppendValue((CFMutableArrayRef)qword_1000252D8, v14);
  if (sub_10000C0D8(*(_QWORD *)(a2 + 24), 3) == 1)
    v15 = CFSTR("UserFS");
  else
    v15 = 0;
  v16 = sub_1000077F4(*(_QWORD *)(a2 + 24));
  v17 = *(const __CFURL **)(a2 + 56);
  v18 = sub_100007790(*(_QWORD *)(a2 + 24), CFSTR("DAVolumeName"));
  v19 = *(const __CFURL **)(a2 + 40);
  v20 = sub_1000078C4(*(_QWORD *)(a2 + 24));
  v21 = sub_1000078BC(*(_QWORD *)(a2 + 24));
  sub_100008540(v16, v17, v18, v19, v20, v21, v15, sub_10000C69C, (void (*)(CFIndex, uint64_t))a2, *(CFStringRef *)(a2 + 48), 0);
}

void sub_10000C5FC(int a1, void *a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, int a8)
{
  void (*v9)(void);
  const void *v10;

  if (a1 == 92 && *(_BYTE *)a2)
  {
    sub_10000B2E8(*((_QWORD *)a2 + 3), 0, *((_QWORD *)a2 + 1), *((_QWORD *)a2 + 2), a5, a6, a7, a8, CFSTR("force"));
    *((_QWORD *)a2 + 1) = 0;
  }
  else
  {
    v9 = (void (*)(void))*((_QWORD *)a2 + 1);
    if (v9)
      v9();
  }
  CFRelease(*((CFTypeRef *)a2 + 3));
  CFRelease(*((CFTypeRef *)a2 + 6));
  v10 = (const void *)*((_QWORD *)a2 + 5);
  if (v10)
    CFRelease(v10);
  free(a2);
}

void sub_10000C69C(uint64_t a1, uint64_t a2)
{
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(const void **)(a2 + 40);
  if (v4)
    sub_1000099FC((const __CFArray *)qword_1000252D8, v4);
  if ((_DWORD)a1)
  {
    sub_10000A798("mounted disk, id = %@, failure.", *(_QWORD *)(a2 + 24));
    sub_10000A748("unable to mount %@ (status code 0x%08X).", *(_QWORD *)(a2 + 24), a1);
    v11 = a1;
LABEL_5:
    sub_10000C5FC(v11, (void *)a2, v5, v6, v7, v8, v9, v10);
    return;
  }
  sub_10000A798("mounted disk, id = %@, success.", *(_QWORD *)(a2 + 24));
  v12 = sub_1000078A0(*(_QWORD *)(a2 + 24), 4);
  v13 = *(_QWORD *)(a2 + 24);
  if (!v12)
  {
    sub_100007DAC(v13, 4, 0);
    v11 = 0;
    goto LABEL_5;
  }
  v14 = sub_1000077F4(v13);
  sub_1000091E4(v14, *(const __CFURL **)(a2 + 40), (void (*)(uint64_t, uint64_t))sub_10000C770, (void (*)(uint64_t, uint64_t))a2);
}

void sub_10000C770(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;

  if ((_DWORD)a1)
    sub_10000A748("unable to repair quotas on disk %@ (status code 0x%08X).", a2[3], a1);
  else
    sub_100007DAC(a2[3], 4, 0);
  sub_10000C5FC(0, a2, v3, v4, v5, v6, v7, v8);
}

uint64_t sub_10000C7C8(void *a1)
{
  int v2;
  unint64_t v3;
  uint64_t v4;
  char *v5;
  const char *v6;
  const void *v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  const char *v13;
  CFMutableArrayRef Mutable;
  __CFArray *v15;
  const __CFURL *v16;
  const __CFArray *v17;
  size_t v18;
  CFURLRef v19;
  CFURLRef v20;
  char *f_mntonname;
  size_t v22;
  CFURLRef v23;
  uint64_t v24;
  statfs *v26;

  if (sub_100007790((uint64_t)a1, CFSTR("DAVolumePath")))
  {
    v26 = 0;
    v2 = getmntinfo(&v26, 2);
    if (v2 < 1)
    {
LABEL_6:
      v7 = sub_100007790((uint64_t)a1, CFSTR("DAVolumePath"));
      CFRetain(v7);
      sub_100018150((uint64_t)sub_10000CB68, (uint64_t)v7, 0, 0);
      sub_100007A0C((uint64_t)a1, 0);
      if (sub_100007790((uint64_t)a1, CFSTR("DAMediaPath")))
      {
        sub_100007B54((uint64_t)a1, CFSTR("DAVolumePath"), 0);
        sub_10000E1D0(a1, CFSTR("DAVolumePath"));
      }
      else
      {
        sub_10000A798("removed disk, id = %@.", a1);
        sub_10000E268(a1);
        sub_100007B54((uint64_t)a1, CFSTR("DAVolumePath"), 0);
        sub_100007DAC((uint64_t)a1, 0x10000000, 1);
        sub_1000099FC((const __CFArray *)qword_100025288, a1);
      }
      sub_10001439C(v8);
    }
    else
    {
      v3 = 0;
      v4 = 2168 * v2;
      while (1)
      {
        v5 = sub_10000A210((uint64_t)&v26[v3 / 0x878]);
        v6 = (const char *)sub_100007344((uint64_t)a1);
        if (!strcmp(v5, v6))
          break;
        v3 += 2168;
        if (v4 == v3)
          goto LABEL_6;
      }
      Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      if (Mutable)
      {
        v15 = Mutable;
        if (!strcmp(v26[v3 / 0x878].f_fstypename, "hfs"))
        {
          v16 = (const __CFURL *)sub_100007790((uint64_t)a1, CFSTR("DAVolumePath"));
          v17 = _FSCopyNameForVolumeFormatAtURL(v16);
          if (sub_1000063D0((uint64_t)a1, CFSTR("DAVolumeType"), v17))
          {
            sub_100007B54((uint64_t)a1, CFSTR("DAVolumeType"), v17);
            CFArrayAppendValue(v15, CFSTR("DAVolumeType"));
          }
          if (v17)
            CFRelease(v17);
        }
        v18 = strlen(v26[v3 / 0x878].f_mntonname);
        v19 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v26[v3 / 0x878].f_mntonname, v18, 1u);
        if (v19)
        {
          v20 = v19;
          if (sub_1000063D0((uint64_t)a1, CFSTR("DAVolumePath"), v19))
          {
            sub_100007A0C((uint64_t)a1, v20);
            sub_100007B54((uint64_t)a1, CFSTR("DAVolumePath"), v20);
            sub_10000A798("volume path changed for %@", a1);
            CFArrayAppendValue(v15, CFSTR("DAVolumePath"));
          }
          CFRelease(v20);
        }
        if (CFArrayGetCount(v15))
        {
          sub_10000A798("updated disk, id = %@.", a1);
          if (sub_1000078A0((uint64_t)a1, 0x80000))
            sub_10000E1D0(a1, v15);
        }
        goto LABEL_30;
      }
    }
  }
  else
  {
    v26 = 0;
    v9 = getmntinfo(&v26, 2);
    if (v9 >= 1)
    {
      v10 = 0;
      v11 = 2168 * v9;
      while (1)
      {
        v12 = sub_10000A210((uint64_t)&v26[v10 / 0x878]);
        v13 = (const char *)sub_100007344((uint64_t)a1);
        if (!strcmp(v12, v13))
          break;
        v10 += 2168;
        if (v11 == v10)
          return 0;
      }
      f_mntonname = v26[v10 / 0x878].f_mntonname;
      v22 = strlen(f_mntonname);
      v23 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)f_mntonname, v22, 1u);
      if (v23)
      {
        v15 = v23;
        sub_100007A0C((uint64_t)a1, v23);
        sub_100007B54((uint64_t)a1, CFSTR("DAVolumePath"), v15);
        sub_10000E1D0(a1, CFSTR("DAVolumePath"));
        sub_10001439C(v24);
LABEL_30:
        CFRelease(v15);
      }
    }
  }
  return 0;
}

uint64_t sub_10000CB68(const void *a1)
{
  nullsub_4();
  CFRelease(a1);
  return 0;
}

uint64_t sub_10000CB94(uint64_t a1, int a2)
{
  const __CFURL *v4;
  const __CFURL *v5;
  UInt8 *v6;
  UInt8 *v7;
  pid_t v8;
  int v9;
  const char *v11;
  int v12;

  v4 = (const __CFURL *)sub_100007790(a1, CFSTR("DAVolumePath"));
  if (!v4)
    return 4175036419;
  v5 = v4;
  sub_1000077F4(a1);
  v6 = sub_100009CC0(v5);
  if (!v6)
    return 49174;
  v7 = v6;
  v8 = fork();
  v12 = v8;
  if (v8 == -1)
  {
    v9 = *__error();
  }
  else
  {
    if (!v8)
    {
      v11 = "-a";
      if (!a2)
        v11 = "-d";
      execle("/usr/sbin/vsdbutil", "/usr/sbin/vsdbutil", v11, v7, 0, 0);
      exit(71);
    }
    waitpid(v8, &v12, 0);
    if ((v12 & 0x7F) != 0)
      v9 = v12;
    else
      v9 = (__int16)v12 >> 8;
  }
  free(v7);
  if (v9)
    return v9 | 0xC000u;
  else
    return 0;
}

uint64_t sub_10000CC90(void *a1, int a2)
{
  uint64_t v4;
  const __CFURL *v5;
  const __CFURL *v6;
  UInt8 *v7;
  UInt8 *v8;
  pid_t v9;
  int v10;
  CFMutableArrayRef Mutable;
  __CFArray *v12;
  const void *v13;
  const void *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  int v18;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  int v25;
  char __str[16];
  _BYTE v27[64];
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v4 = 4175036417;
  v5 = (const __CFURL *)sub_100007790((uint64_t)a1, CFSTR("DAVolumePath"));
  if (!v5)
    return 4175036419;
  v6 = v5;
  sub_1000077F4((uint64_t)a1);
  bzero(v27, 0x878uLL);
  v7 = sub_100009CC0(v6);
  if (!v7)
  {
    v10 = 22;
    return v10 | 0xC000u;
  }
  v8 = v7;
  if (sub_10000982C((const char *)v7, v27, 2) == -1 || (v9 = fork(), v25 = v9, v9 == -1))
  {
    v10 = *__error();
  }
  else
  {
    if (!v9)
    {
      snprintf(__str, 0x10uLL, "-o-e=%d", a2);
      v20 = "-onodev";
      if ((v28 & 0x10) == 0)
        v20 = "-odev";
      v21 = "-onoexec";
      if ((v28 & 4) == 0)
        v21 = "-oexec";
      v22 = "-onosuid";
      if ((v28 & 8) == 0)
        v22 = "-osuid";
      v23 = "-ordonly";
      if ((v28 & 1) == 0)
        v23 = "-orw";
      if ((v28 & 0x200000) != 0)
        v24 = "-onoowners";
      else
        v24 = "-oowners";
      execle("/sbin/mount", "/sbin/mount", "-t", &v29, "-u", __str, v20, v21, v22, v23, v24, &v31, &v30, 0, 0);
      exit(71);
    }
    waitpid(v9, &v25, 0);
    if ((v25 & 0x7F) != 0)
      v10 = v25;
    else
      v10 = (__int16)v25 >> 8;
  }
  free(v8);
  if (v10)
    return v10 | 0xC000u;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!Mutable)
    return 4175036421;
  v12 = Mutable;
  v13 = sub_100007790((uint64_t)a1, CFSTR("DAVolumeName"));
  if (v13 && (v14 = v13, v15 = sub_1000077F4((uint64_t)a1), (v16 = sub_100008108(v15, v6, 0)) != 0))
  {
    v17 = v16;
    v18 = CFEqual(v14, v16);
    sub_100007B54((uint64_t)a1, CFSTR("DAVolumeName"), v17);
    CFArrayAppendValue(v12, CFSTR("DAVolumeName"));
    if (v18)
    {
      v4 = 0;
    }
    else
    {
      v4 = sub_10000C0D0();
      if (v4)
      {
        sub_100007A0C((uint64_t)a1, (CFTypeRef)v4);
        sub_100007B54((uint64_t)a1, CFSTR("DAVolumePath"), (const void *)v4);
        CFArrayAppendValue(v12, CFSTR("DAVolumePath"));
      }
    }
    sub_10000E1D0(a1, v12);
    CFRelease(v12);
    CFRelease(v17);
    if (v4)
    {
      CFRelease((CFTypeRef)v4);
      return 0;
    }
  }
  else
  {
    CFRelease(v12);
  }
  return v4;
}

uint64_t sub_10000CFB8()
{
  return 0;
}

void sub_10000CFC0(int a1, void *a2)
{
  void *v4;
  CFMutableArrayRef Mutable;
  __CFArray *v6;
  const void **v7;
  const void *v8;

  v4 = (void *)*((_QWORD *)a2 + 1);
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v6 = Mutable;
  if (!a1 && Mutable)
  {
    v7 = (const void **)(*(_BYTE *)a2 ? &kCFBooleanTrue : &kCFBooleanFalse);
    v8 = *v7;
    if (sub_1000063D0((uint64_t)v4, CFSTR("DAMediaEncrypted"), *v7))
    {
      sub_100007B54((uint64_t)v4, CFSTR("DAMediaEncrypted"), v8);
      CFArrayAppendValue(v6, CFSTR("DAMediaEncrypted"));
    }
  }
  if (CFArrayGetCount(v6))
  {
    sub_10000A798("encryption status changed, id = %@.", v4);
    if (sub_1000078A0((uint64_t)v4, 0x80000))
      sub_10000E1D0(v4, v6);
  }
  if (v6)
    CFRelease(v6);
  CFRelease(*((CFTypeRef *)a2 + 1));
  free(a2);
}

BOOL sub_10000D0D0(uint64_t a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  CFBooleanRef v5;
  const void *ValueAtIndex;
  int v7;
  const __CFString *v8;
  _BOOL8 result;
  CFIndex v10;
  CFIndex v11;
  const void *v12;
  const __CFString *v13;
  BOOL v14;

  Count = CFArrayGetCount((CFArrayRef)qword_100025288);
  if (Count < 1)
    return 1;
  v3 = Count;
  v4 = 0;
  v5 = kCFBooleanTrue;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, v4);
    v7 = sub_1000077CC(a1);
    if (v7 == sub_1000077CC((uint64_t)ValueAtIndex))
    {
      v8 = (const __CFString *)sub_100007790((uint64_t)ValueAtIndex, CFSTR("DAMediaBSDName"));
      if (sub_1000077D4((uint64_t)ValueAtIndex))
        break;
      result = sub_1000078A0((uint64_t)ValueAtIndex, 16);
      if (!result)
        return result;
      if (sub_100007790((uint64_t)ValueAtIndex, CFSTR("DAVolumeMountable")) == v5)
        break;
      if (sub_100007790((uint64_t)ValueAtIndex, CFSTR("DAMediaLeaf")) == kCFBooleanFalse)
      {
        v10 = CFArrayGetCount((CFArrayRef)qword_100025288);
        if (v10 < 1)
        {
          v11 = 0;
        }
        else
        {
          v11 = 0;
          while (1)
          {
            v12 = CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, v11);
            if (ValueAtIndex != v12)
            {
              v13 = (const __CFString *)sub_100007790((uint64_t)v12, CFSTR("DAMediaBSDName"));
              if (v13)
              {
                if (CFStringHasPrefix(v13, v8))
                  break;
              }
            }
            if (v10 == ++v11)
              return 0;
          }
        }
        v14 = v11 == v10;
        v5 = kCFBooleanTrue;
        if (v14)
          break;
      }
    }
    if (++v4 == v3)
      return 1;
  }
  return 0;
}

void sub_10000D274(const void *a1, const void *a2, void (*a3)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t), uint64_t a4)
{
  _QWORD *v7;
  _QWORD *v8;
  CFMutableArrayRef MutableCopy;
  __CFArray *v10;
  const __CFNumber *v11;

  v7 = malloc_type_malloc(0x38uLL, 0x10A0040668C0A6DuLL);
  if (v7)
  {
    v8 = v7;
    MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, (CFArrayRef)qword_1000252A0);
    if (MutableCopy)
    {
      v10 = MutableCopy;
      v11 = (const __CFNumber *)sub_100007790((uint64_t)a1, CFSTR("DAMediaSize"));
      if (v11 && !sub_100009B98(v11))
        CFArrayRemoveAllValues(v10);
      CFRetain(a1);
      if (a2)
      {
        sub_100017E38((uint64_t)a2, 1, 1);
        CFRetain(a2);
      }
      *v8 = a3;
      v8[1] = a4;
      v8[2] = v10;
      v8[3] = a1;
      v8[4] = a2;
      v8[5] = 0;
      *((_DWORD *)v8 + 12) = 0;
      sub_10000D3D0(0xFFFFFFFFLL, 0, 0, 0, 0, (uint64_t)v8);
      return;
    }
    free(v8);
  }
  if (a3)
    a3(12, -1, 0, 0, 0, 0, a4);
}

void sub_10000D3D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  void (*v18)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v20;
  const void *Value;
  const void *v22;
  const __CFDictionary *v23;
  const __CFDictionary *v24;
  io_service_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  const void *v30;
  uint64_t v31;
  const char *v32;
  const __CFURL *v33;
  const char *v34;
  _BOOL4 v35;
  unsigned int v36;
  BOOLean_t matches;

  v12 = *(_QWORD *)(a6 + 40);
  if (!(_DWORD)a1)
  {
    v17 = sub_1000084B0(v12);
    sub_10000A798("probed disk, id = %@, with %@, success.", *(_QWORD *)(a6 + 24), v17);
    v18 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))a6;
    if (!*(_QWORD *)a6)
      goto LABEL_27;
    goto LABEL_26;
  }
  if (v12)
  {
    v13 = sub_1000084B0(v12);
    sub_10000A798("probed disk, id = %@, with %@, failure.", *(_QWORD *)(a6 + 24), v13);
    if ((_DWORD)a1 != -2)
      sub_10000A748("unable to probe %@ (status code 0x%08X).", *(_QWORD *)(a6 + 24), a1);
    CFRelease(*(CFTypeRef *)(a6 + 40));
    *(_QWORD *)(a6 + 40) = 0;
  }
  v36 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v35 = (sub_100007790(*(_QWORD *)(a6 + 24), CFSTR("DAMediaRemovable")) != kCFBooleanTrue
      || sub_100007790(*(_QWORD *)(a6 + 24), CFSTR("DADeviceInternal")))
     && sub_100007790(*(_QWORD *)(a6 + 24), CFSTR("DADeviceInternal")) != kCFBooleanTrue;
  if (!CFArrayGetCount(*(CFArrayRef *)(a6 + 16)))
  {
LABEL_19:
    if (!byte_100024419)
    {
      if (_os_feature_enabled_impl("DiskArbitration", "enableFSKitModules"))
      {
        if (!*(_DWORD *)(a6 + 48))
        {
          *(_DWORD *)(a6 + 48) = 1;
          v26 = malloc_type_malloc(0x38uLL, 0x10A0040668C0A6DuLL);
          if (v26)
          {
            v27 = (uint64_t)v26;
            CFRetain(*(CFTypeRef *)(a6 + 24));
            *(_OWORD *)v27 = *(_OWORD *)a6;
            *(_QWORD *)(v27 + 16) = 0;
            *(_OWORD *)(v27 + 24) = *(_OWORD *)(a6 + 24);
            *(_QWORD *)(v27 + 40) = 0;
            *(_DWORD *)(v27 + 48) = 1;
            sub_100015FB4(dword_10002527C, v27);
          }
        }
      }
    }
    v18 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))a6;
    a5 = v16;
    a4 = v15;
    a3 = v14;
    a2 = v36;
    if (!*(_QWORD *)a6 || *(_DWORD *)(a6 + 48))
      goto LABEL_27;
LABEL_26:
    v18(a1, *(_QWORD *)(a6 + 40), a2, a3, a4, a5, *(_QWORD *)(a6 + 8));
LABEL_27:
    CFRelease(*(CFTypeRef *)(a6 + 16));
    CFRelease(*(CFTypeRef *)(a6 + 24));
    v28 = *(_QWORD *)(a6 + 32);
    if (v28)
    {
      sub_100017E38(v28, 1, 0);
      CFRelease(*(CFTypeRef *)(a6 + 32));
    }
    v29 = *(const void **)(a6 + 40);
    if (v29)
      CFRelease(v29);
    free((void *)a6);
    return;
  }
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a6 + 16), 0);
    if (ValueAtIndex)
    {
      v20 = ValueAtIndex;
      Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("DAFileSystem"));
      if (Value)
      {
        v22 = Value;
        v23 = (const __CFDictionary *)CFDictionaryGetValue(v20, CFSTR("FSMediaProperties"));
        if (v23)
        {
          v24 = v23;
          matches = 0;
          v25 = sub_100007788(*(_QWORD *)(a6 + 24));
          IOServiceMatchPropertyTable(v25, v24, &matches);
          if (matches)
            break;
        }
      }
    }
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a6 + 16), 0);
    if (!CFArrayGetCount(*(CFArrayRef *)(a6 + 16)))
      goto LABEL_19;
  }
  v30 = sub_1000084B0((uint64_t)v22);
  CFRetain(v22);
  *(_QWORD *)(a6 + 40) = v22;
  if (CFDictionaryGetValue(v20, CFSTR("autodiskmount")) == kCFBooleanFalse)
  {
    sub_100007DAC(*(_QWORD *)(a6 + 24), 16, 0);
    sub_100007DAC(*(_QWORD *)(a6 + 24), 32, 0);
  }
  CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a6 + 16), 0);
  sub_10000A798("probed disk, id = %@, with %@, ongoing.", *(_QWORD *)(a6 + 24), v30);
  v31 = *(_QWORD *)(a6 + 32);
  if (v31)
    v32 = (const char *)sub_100007774(v31, 1);
  else
    v32 = 0;
  v33 = (const __CFURL *)sub_1000077EC(*(_QWORD *)(a6 + 24));
  v34 = (const char *)sub_100007774(*(_QWORD *)(a6 + 24), 1);
  sub_1000089D0((uint64_t)v22, v33, v34, v32, (void (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))sub_10000D3D0, a6, v35);
}

BOOL sub_10000D788(const void *a1, int a2)
{
  CFIndex Count;
  CFIndex v5;
  const __CFDictionary *ValueAtIndex;
  const __CFNumber *v7;
  CFIndex v8;
  _BOOL8 v9;
  const __CFNumber *v10;
  CFIndex v11;
  const __CFNumber *v12;
  const void *v13;
  unsigned int v14;
  const __CFData *v15;
  const UInt8 *BytePtr;
  const __CFNumber *v17;
  const __CFNumber *v18;
  unsigned int v19;
  const char *v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  const __CFNumber *v23;
  unsigned int v24;
  const __CFNumber *v25;
  const __CFNumber *v26;
  unsigned int v27;
  const char *v29;
  const char *v30;

  Count = CFArrayGetCount((CFArrayRef)qword_100025300);
  if (Count < 1)
    return 0;
  v5 = Count;
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025300, 0);
  v7 = (const __CFNumber *)sub_100005A9C(ValueAtIndex);
  if (sub_100009B98(v7) != (const __CFNumber *)a2)
  {
    v10 = (const __CFNumber *)a2;
    v11 = 1;
    while (v5 != v11)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025300, v11);
      v12 = (const __CFNumber *)sub_100005A9C(ValueAtIndex);
      ++v11;
      if (sub_100009B98(v12) == v10)
      {
        v8 = v11 - 1;
        v9 = v8 < v5;
        goto LABEL_8;
      }
    }
    return 0;
  }
  v8 = 0;
  v9 = 1;
LABEL_8:
  v13 = sub_100005AB4(ValueAtIndex);
  v14 = sub_100005AC0(ValueAtIndex);
  switch(v14)
  {
    case 6u:
    case 8u:
    case 0xEu:
      goto LABEL_9;
    case 7u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
    case 0xDu:
      break;
    case 9u:
      v25 = sub_100005A84(ValueAtIndex);
      v26 = sub_100005AA8(ValueAtIndex);
      v27 = sub_100005AC0(ValueAtIndex);
      v30 = sub_100009D08(v27);
      sub_10000A61C("  dispatched response, id = %016llX:%016llX, kind = %s, disk = %@.", v25, v26, v30, v13);
      break;
    default:
      if (v14 == 2)
      {
LABEL_9:
        if (a1)
        {
          v15 = (const __CFData *)sub_1000077E4((uint64_t)v13);
          if (v15)
          {
            BytePtr = CFDataGetBytePtr(v15);
            if (!*((_QWORD *)BytePtr + 2))
              *((_QWORD *)BytePtr + 2) = CFRetain(a1);
          }
          v17 = sub_100005A84(ValueAtIndex);
          v18 = sub_100005AA8(ValueAtIndex);
          v19 = sub_100005AC0(ValueAtIndex);
          v20 = sub_100009D08(v19);
          v21 = sub_1000080D8((const __CFDictionary *)a1);
          sub_10000A748("  dispatched response, id = %016llX:%016llX, kind = %s, disk = %@, dissented, status = 0x%08X.", v17, v18, v20, v13, v21);
        }
        else
        {
          v22 = sub_100005A84(ValueAtIndex);
          v23 = sub_100005AA8(ValueAtIndex);
          v24 = sub_100005AC0(ValueAtIndex);
          v29 = sub_100009D08(v24);
          sub_10000A61C("  dispatched response, id = %016llX:%016llX, kind = %s, disk = %@, approved.", v22, v23, v29, v13);
        }
      }
      break;
  }
  CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025300, v8);
  sub_10000D99C(v13);
  return v9;
}

void sub_10000D99C(const void *a1)
{
  CFIndex Count;
  CFIndex v3;
  const __CFDictionary *ValueAtIndex;
  const __CFData *v5;
  const UInt8 *BytePtr;
  uint64_t v7;
  void (*v8)(const void *, uint64_t);
  const void *v9;
  CFIndex v10;
  CFIndex v11;
  CFIndex v12;
  double v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const void *v16;
  double v17;
  CFAbsoluteTime Current;
  dispatch_time_t v19;
  NSObject *v20;

  Count = CFArrayGetCount((CFArrayRef)qword_100025300);
  if (Count < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025300, v3);
      if (sub_100005AB4(ValueAtIndex) == a1)
        break;
      if (Count == ++v3)
        goto LABEL_8;
    }
  }
  if (v3 == Count)
  {
LABEL_8:
    v5 = (const __CFData *)sub_1000077E4((uint64_t)a1);
    BytePtr = CFDataGetBytePtr(v5);
    v8 = *(void (**)(const void *, uint64_t))BytePtr;
    v7 = *((_QWORD *)BytePtr + 1);
    v9 = (const void *)*((_QWORD *)BytePtr + 2);
    sub_100007B14((uint64_t)a1, 0);
    v8(v9, v7);
    if (v9)
      CFRelease(v9);
  }
  v10 = CFArrayGetCount((CFArrayRef)qword_100025300);
  if (v10 >= 1)
  {
    v11 = v10;
    v12 = 0;
    v13 = kCFAbsoluteTimeIntervalSince1904;
    do
    {
      v14 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025300, v12);
      if (v14)
      {
        v15 = v14;
        v16 = sub_100005B04(v14);
        if (!sub_100013DB0((uint64_t)v16, 0x1000000))
        {
          v17 = sub_100005B10(v15) + 10.0 + 1.0;
          if (v17 < v13)
            v13 = v17;
        }
      }
      ++v12;
    }
    while (v11 != v12);
    if (v13 < kCFAbsoluteTimeIntervalSince1904 && v13 > CFAbsoluteTimeGetCurrent())
    {
      Current = CFAbsoluteTimeGetCurrent();
      v19 = dispatch_time(0, 1000000000 * (uint64_t)(v13 - Current));
      v20 = sub_100013AFC();
      dispatch_after(v19, v20, &stru_100021108);
    }
  }
}

void sub_10000DB44(void *a1)
{
  sub_10000DB54(0, a1, 0);
}

void sub_10000DB54(int a1, void *a2, void *a3)
{
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v10;

  Count = CFArrayGetCount((CFArrayRef)qword_100025308);
  if (Count >= 1)
  {
    v7 = Count;
    for (i = 0; i != v7; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100025308, i);
      v10 = (uint64_t)ValueAtIndex;
      if (a1 == 15)
      {
        if (!sub_100013DC8((uint64_t)ValueAtIndex, 1))
        {
          sub_10000E454(v10, 15, a2, a3);
          sub_100013FD0(v10, 1, 1);
        }
      }
      else
      {
        sub_10000E454((uint64_t)ValueAtIndex, a1, a2, a3);
      }
    }
  }
}

void sub_10000DC20(void *a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4)
{
  sub_10000DC60((uint64_t)a1, a3, a4);
  sub_10000DCD4(a2, a1, 0);
  sub_10000D99C(a1);
}

void sub_10000DC60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFData *Mutable;
  const __CFData *v7;
  UInt8 *BytePtr;

  Mutable = CFDataCreateMutable(kCFAllocatorDefault, 24);
  if (Mutable)
  {
    v7 = Mutable;
    BytePtr = (UInt8 *)CFDataGetBytePtr(Mutable);
    *((_QWORD *)BytePtr + 1) = a3;
    *((_QWORD *)BytePtr + 2) = 0;
    *(_QWORD *)BytePtr = a2;
    sub_100007B14(a1, v7);
    CFRelease(v7);
  }
}

void sub_10000DCD4(const __CFDictionary *a1, void *a2, void *a3)
{
  const void *v6;
  const __CFDictionary *v7;
  CFMutableDataRef v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  unsigned int v11;
  const char *v12;
  const char *v13;
  CFNumberRef v14;
  CFNumberRef v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  CFAbsoluteTime Current;
  __CFDictionary *v19;
  __CFDictionary *v20;
  CFMutableDataRef v21;
  const __CFNumber *v22;
  const __CFNumber *v23;
  unsigned int v24;
  const char *v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  CFMutableDataRef v28;
  const __CFNumber *v29;
  const __CFNumber *v30;
  unsigned int v31;
  const char *v32;
  __CFDictionary *v33;
  CFMutableDictionaryRef v34;
  const __CFDictionary *v35;
  const __CFNumber *v36;
  const __CFNumber *v37;
  unsigned int v38;
  const char *v39;
  const __CFArray *v40;
  const __CFArray *v41;
  const __CFArray *MutableCopy;
  const __CFArray *v43;
  CFMutableDictionaryRef v44;
  const __CFDictionary *v45;
  CFIndex Count;
  CFIndex v47;
  CFIndex i;
  const __CFNumber *v49;
  const __CFNumber *v50;
  unsigned int v51;
  const char *v52;
  const void *ValueAtIndex;
  CFMutableDataRef v54;
  const __CFNumber *v55;

  v6 = sub_100005B04(a1);
  sub_10000A6B4("%s -> %@", qword_1000252F0, v6);
  if (!sub_100013DC8((uint64_t)v6, 0x10000000))
  {
    if (sub_100005A84(a1))
    {
      v7 = (const __CFDictionary *)sub_100005ADC(a1);
      if (!v7 || sub_1000078F0((uint64_t)a2, v7))
      {
        switch(sub_100005AC0(a1))
        {
          case 0u:
          case 4u:
            v26 = sub_100005A78(kCFAllocatorDefault, a1);
            if (v26)
            {
              v27 = v26;
              sub_100005B78(v26, a2);
              v28 = sub_100007868(a2);
              sub_100005B48(v27, v28);
              sub_100013E10((uint64_t)v6, v27);
              v29 = sub_100005A84(v27);
              v30 = sub_100005AA8(v27);
              v31 = sub_100005AC0(v27);
              v32 = sub_100009D08(v31);
              sub_10000A61C("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@.", v29, v30, v32, a2);
              v33 = v27;
              goto LABEL_23;
            }
            return;
          case 1u:
          case 5u:
          case 7u:
          case 0xAu:
          case 0xCu:
          case 0xDu:
          case 0x11u:
            sub_100005B78(a1, a2);
            v8 = sub_100007868(a2);
            sub_100005B48(a1, v8);
            sub_100005B60(a1, a3);
            sub_100013E10((uint64_t)v6, a1);
            v9 = sub_100005A84(a1);
            v10 = sub_100005AA8(a1);
            v11 = sub_100005AC0(a1);
            v12 = sub_100009D08(v11);
            v13 = v12;
            if (a3)
            {
              v55 = sub_1000080D8((const __CFDictionary *)a3);
              sub_10000A61C("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@, status = 0x%08X.", v9, v10, v13, a2, v55);
            }
            else
            {
              sub_10000A61C("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@, success.", v9, v10, v12, a2);
            }
            return;
          case 2u:
            if (!sub_100013DC8((uint64_t)v6, 0x1000000))
            {
              if (a3)
                sub_10001B214();
              goto LABEL_11;
            }
            return;
          case 3u:
            if (sub_1000078A0((uint64_t)a2, 0x10000000))
              return;
            v40 = (const __CFArray *)sub_100005B3C(a1);
            if (v40)
            {
              v41 = v40;
              MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, (CFArrayRef)a3);
              if (MutableCopy)
              {
                v43 = MutableCopy;
                sub_100004E20(MutableCopy, v41);
                goto LABEL_32;
              }
            }
            else
            {
              v43 = (const __CFArray *)CFRetain(a3);
              if (v43)
              {
LABEL_32:
                if (CFArrayGetCount(v43))
                {
                  v44 = sub_100005A78(kCFAllocatorDefault, a1);
                  if (v44)
                  {
                    v45 = v44;
                    Count = CFArrayGetCount(v43);
                    if (Count >= 1)
                    {
                      v47 = Count;
                      for (i = 0; i != v47; ++i)
                      {
                        v49 = sub_100005A84(v45);
                        v50 = sub_100005AA8(v45);
                        v51 = sub_100005AC0(v45);
                        v52 = sub_100009D08(v51);
                        ValueAtIndex = CFArrayGetValueAtIndex(v43, i);
                        sub_10000A61C("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@, key = %@.", v49, v50, v52, a2, ValueAtIndex);
                      }
                    }
                    sub_100005B78(v45, a2);
                    v54 = sub_100007868(a2);
                    sub_100005B48(v45, v54);
                    sub_100005B60(v45, v43);
                    sub_100013E10((uint64_t)v6, v45);
                    CFRelease(v45);
                  }
                }
                v33 = v43;
                goto LABEL_23;
              }
            }
            break;
          case 6u:
          case 8u:
          case 9u:
          case 0xEu:
            if (!sub_100013DC8((uint64_t)v6, 0x1000000))
            {
              if (a3)
                sub_10001B23C();
LABEL_11:
              v14 = sub_100009B70(kCFAllocatorDefault, dword_10002519C);
              if (v14)
              {
                v15 = v14;
                v16 = sub_100005A78(kCFAllocatorDefault, a1);
                if (v16)
                {
                  v17 = v16;
                  sub_100005B78(v16, a2);
                  sub_100005B60(v17, v15);
                  Current = CFAbsoluteTimeGetCurrent();
                  sub_100005BC0(v17, Current);
                  CFArrayAppendValue((CFMutableArrayRef)qword_100025300, v17);
                  CFRelease(v17);
                }
                v19 = sub_100005A78(kCFAllocatorDefault, a1);
                if (v19)
                {
                  v20 = v19;
                  sub_100005B78(v19, a2);
                  v21 = sub_100007868(a2);
                  sub_100005B48(v20, v21);
                  sub_100005B60(v20, v15);
                  sub_100013E10((uint64_t)v6, v20);
                  v22 = sub_100005A84(v20);
                  v23 = sub_100005AA8(v20);
                  v24 = sub_100005AC0(v20);
                  v25 = sub_100009D08(v24);
                  sub_10000A61C("  dispatched callback, id = %016llX:%016llX, kind = %s, disk = %@.", v22, v23, v25, a2);
                  CFRelease(v20);
                }
                CFRelease(v15);
              }
              ++dword_10002519C;
            }
            return;
          case 0xFu:
          case 0x10u:
            v34 = sub_100005A78(kCFAllocatorDefault, a1);
            if (v34)
            {
              v35 = v34;
              sub_100013E10((uint64_t)v6, v34);
              v36 = sub_100005A84(v35);
              v37 = sub_100005AA8(v35);
              v38 = sub_100005AC0(v35);
              v39 = sub_100009D08(v38);
              sub_10000A61C("  dispatched callback, id = %016llX:%016llX, kind = %s.", v36, v37, v39);
              v33 = v35;
LABEL_23:
              CFRelease(v33);
            }
            return;
          default:
            return;
        }
      }
    }
  }
}

void sub_10000E1D0(void *a1, void *cf)
{
  CFTypeID v4;
  __CFArray *Mutable;

  v4 = CFGetTypeID(cf);
  if (v4 == CFArrayGetTypeID())
  {
    sub_10000DB54(3, a1, cf);
  }
  else
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, cf);
    sub_10000DB54(3, a1, Mutable);
    CFRelease(Mutable);
  }
}

void sub_10000E268(void *a1)
{
  sub_10000DB54(4, a1, 0);
}

uint64_t sub_10000E278(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return sub_10000E298(5, a1, a2, 0, 0, a3);
}

void sub_10000E298(unsigned int a1, const void *a2, uint64_t a3, const void *a4, const void *a5, const void *a6)
{
  __CFDictionary *v6;
  __CFDictionary *v7;

  v6 = sub_10000EBE0((uint64_t)kCFAllocatorDefault, a1, a2, a3, a4, a5, 0, 0, a6);
  if (v6)
  {
    v7 = v6;
    sub_10000E71C(v6);
    CFRelease(v7);
  }
}

void sub_10000E30C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_10000DC60((uint64_t)a1, a2, a3);
  sub_10000DB54(6, a1, 0);
  sub_10000D99C(a1);
}

void sub_10000E340(const void *a1, const void *a2, unsigned int a3, const void *a4)
{
  sub_10000E298(7u, a1, a3, a2, 0, a4);
}

uint64_t sub_10000E35C(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  return sub_10000E298(7, a1, a3, a2, a5, a4);
}

void sub_10000E374(void *a1, uint64_t a2, uint64_t a3)
{
  sub_10000DC60((uint64_t)a1, a2, a3);
  sub_10000DB54(8, a1, 0);
  sub_10000D99C(a1);
}

void sub_10000E3A8(const void *a1, const void *a2)
{
  sub_10000E298(0xAu, a1, 0, 0, 0, a2);
}

void sub_10000E3C4(const void *a1, const void *a2)
{
  sub_10000E298(0xBu, a1, 0, 0, 0, a2);
}

void sub_10000E3E0(const void *a1, unsigned int a2, const void *a3)
{
  sub_10000E298(0xDu, a1, a2, 0, 0, a3);
}

void sub_10000E400(void *a1, uint64_t a2, uint64_t a3)
{
  sub_10000DC60((uint64_t)a1, a2, a3);
  sub_10000DB54(14, a1, 0);
  sub_10000D99C(a1);
}

void sub_10000E434()
{
  sub_10000DB54(15, 0, 0);
}

void sub_10000E444()
{
  sub_10000DB54(16, 0, 0);
}

void sub_10000E454(uint64_t a1, int a2, void *a3, void *a4)
{
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;

  v7 = (const __CFArray *)sub_1000077DC(a1);
  if (v7)
  {
    v8 = v7;
    Count = CFArrayGetCount(v7);
    if (Count >= 1)
    {
      v10 = Count;
      for (i = 0; i != v10; ++i)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, i);
        if (sub_100005AC0(ValueAtIndex) == a2)
          sub_10000DCD4(ValueAtIndex, a3, a4);
      }
    }
  }
}

void sub_10000E4E8(const void *a1)
{
  CFIndex Count;
  unint64_t v3;
  const __CFDictionary *ValueAtIndex;
  CFIndex v5;
  unint64_t v6;
  const __CFDictionary *v7;

  Count = CFArrayGetCount((CFArrayRef)qword_100025300);
  if (Count >= 1)
  {
    v3 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025300, v3 - 2);
      if (sub_100005AB4(ValueAtIndex) == a1)
      {
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025300, v3 - 2);
        sub_10000D99C(a1);
      }
      --v3;
    }
    while (v3 > 1);
  }
  v5 = CFArrayGetCount((CFArrayRef)qword_1000252F8);
  if (v5 >= 1)
  {
    v6 = v5 + 1;
    do
    {
      v7 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000252F8, v6 - 2);
      if (sub_10000EE24(v7) == a1)
      {
        sub_10000FD7C(v7, -119930874);
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_1000252F8, v6 - 2);
      }
      --v6;
    }
    while (v6 > 1);
  }
}

void sub_10000E5D0(const void *a1)
{
  CFIndex Count;
  unint64_t v3;
  const __CFDictionary *ValueAtIndex;
  const void *v5;
  CFIndex v6;
  unint64_t v7;
  const __CFDictionary *v8;
  __CFDictionary *v9;
  const __CFDictionary *v10;
  CFIndex v11;
  unint64_t v12;
  const void *v13;
  uint64_t v14;
  const __CFDictionary *v15;

  Count = CFArrayGetCount((CFArrayRef)qword_100025300);
  if (Count >= 1)
  {
    v3 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025300, v3 - 2);
      if (sub_100005B04(ValueAtIndex) == a1)
      {
        v5 = sub_100005AB4(ValueAtIndex);
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025300, v3 - 2);
        sub_10000D99C(v5);
      }
      --v3;
    }
    while (v3 > 1);
  }
  v6 = CFArrayGetCount((CFArrayRef)qword_1000252F8);
  if (v6 >= 1)
  {
    v7 = v6 + 1;
    do
    {
      v8 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000252F8, v7 - 2);
      if (v8)
      {
        v9 = v8;
        v10 = (const __CFDictionary *)sub_10000FEF0(v8);
        if (v10)
        {
          if (sub_100005B04(v10) == a1)
            sub_10000FF80(v9, 0);
        }
      }
      --v7;
    }
    while (v7 > 1);
  }
  v11 = CFArrayGetCount((CFArrayRef)qword_100025288);
  if (v11 >= 1)
  {
    v12 = v11 + 1;
    do
    {
      v13 = CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, v12 - 2);
      if (v13)
      {
        v14 = (uint64_t)v13;
        v15 = (const __CFDictionary *)sub_1000077D4((uint64_t)v13);
        if (v15)
        {
          if (sub_100005B04(v15) == a1)
            sub_100007A94(v14, 0);
        }
      }
      --v12;
    }
    while (v12 > 1);
  }
}

void sub_10000E71C(const __CFDictionary *a1)
{
  unsigned int v2;
  unsigned int v3;
  const void *v4;
  uint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  const void *v9;
  int v10;
  CFMutableArrayRef Mutable;
  __CFArray *v13;
  CFIndex Count;
  CFIndex v15;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v18;
  const char *v19;
  const char *v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  __CFDictionary *v25;
  __CFDictionary *v26;

  v2 = sub_10000EE30(a1);
  if (v2 > 0xD || ((1 << v2) & 0x20A0) == 0)
    goto LABEL_33;
  v3 = sub_10000FECC(a1);
  v4 = sub_10000EE24(a1);
  v5 = (sub_10000EE30(a1) == 5) | v3;
  if ((v5 & 1) != 0)
  {
    v6 = -119930868;
    v7 = (unint64_t)sub_10000FED8(a1);
    v8 = (unint64_t)sub_10000FEE4(a1);
    v9 = sub_100007790((uint64_t)v4, CFSTR("DAMediaWhole"));
    if (sub_100007790((uint64_t)v4, CFSTR("DAMediaWhole")) == kCFBooleanFalse)
      goto LABEL_18;
    v10 = -119930877;
    if (!(v8 | v7))
      v10 = 0;
    v6 = v9 ? v10 : -119930868;
    if (!v9 || (v8 | v7) != 0)
    {
LABEL_18:
      sub_10000FD7C(a1, v6);
      return;
    }
  }
  else if (!sub_1000078A0((uint64_t)v4, 128) || sub_10000EE30(a1) != 13)
  {
    goto LABEL_33;
  }
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    v13 = Mutable;
    Count = CFArrayGetCount((CFArrayRef)qword_100025288);
    if (Count >= 1)
    {
      v15 = Count;
      for (i = 0; v15 != i; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, i);
        if (v4 != ValueAtIndex)
        {
          v18 = ValueAtIndex;
          v19 = (const char *)sub_100007774((uint64_t)ValueAtIndex, 0);
          v20 = (const char *)sub_100007774((uint64_t)v4, 0);
          if ((v5 & 1) == 0)
          {
            if (!v20 || !v19 || strcmp(v20, v19))
              continue;
LABEL_29:
            v22 = sub_10000EE30(a1);
            v23 = sub_10000FF64(a1);
            v24 = sub_10000FF48(a1);
            v25 = sub_10000EBE0((uint64_t)kCFAllocatorDefault, v22, v18, v5, 0, 0, v23, v24, 0);
            if (v25)
            {
              v26 = v25;
              CFArrayAppendValue(v13, v25);
              CFArrayAppendValue((CFMutableArrayRef)qword_1000252F8, v26);
              CFRelease(v26);
            }
            continue;
          }
          v21 = sub_1000077CC((uint64_t)v4);
          if (v21 == sub_1000077CC((uint64_t)v18))
            goto LABEL_29;
        }
      }
    }
    sub_10000FFB0(a1, v13);
    CFRelease(v13);
  }
LABEL_33:
  CFArrayAppendValue((CFMutableArrayRef)qword_1000252F8, a1);
  sub_10001439C();
}

void sub_10000E9DC(const __CFDictionary *a1)
{
  CFIndex Count;
  unint64_t v3;
  const __CFDictionary *ValueAtIndex;
  const void *v5;
  const __CFNumber *v6;
  const __CFNumber *v7;
  const void *v8;

  Count = CFArrayGetCount((CFArrayRef)qword_100025300);
  if (Count >= 1)
  {
    v3 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025300, v3 - 2);
      v5 = sub_100005B04(ValueAtIndex);
      if (v5 == sub_100005B04(a1))
      {
        v6 = sub_100005A84(ValueAtIndex);
        if (v6 == sub_100005A84(a1))
        {
          v7 = sub_100005AA8(ValueAtIndex);
          if (v7 == sub_100005AA8(a1))
          {
            v8 = sub_100005AB4(ValueAtIndex);
            CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025300, v3 - 2);
            sub_10000D99C(v8);
          }
        }
      }
      --v3;
    }
    while (v3 > 1);
  }
}

void sub_10000EAB4(id a1)
{
  double Current;
  CFIndex Count;
  unint64_t v3;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v5;
  const void *v6;
  const void *v7;

  Current = CFAbsoluteTimeGetCurrent();
  Count = CFArrayGetCount((CFArrayRef)qword_100025300);
  if (Count >= 1)
  {
    v3 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025300, v3 - 2);
      if (ValueAtIndex)
      {
        v5 = ValueAtIndex;
        v6 = sub_100005B04(ValueAtIndex);
        if (!sub_100013DB0((uint64_t)v6, 0x1000000) && sub_100005B10(v5) + 10.0 < Current)
        {
          v7 = sub_100005AB4(v5);
          if (!sub_100013DC8((uint64_t)v6, 0x1000000))
          {
            sub_10000A61C("  timed out session, id = %@.", v6);
            sub_10000A748("%@ not responding.", v6);
            sub_100013FD0((uint64_t)v6, 0x1000000, 1);
          }
          CFRetain(v7);
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100025300, v3 - 2);
          sub_10000D99C(v7);
          CFRelease(v7);
        }
      }
      --v3;
    }
    while (v3 > 1);
  }
}

__CFDictionary *sub_10000EBE0(uint64_t a1, unsigned int a2, const void *a3, uint64_t a4, const void *a5, const void *a6, unsigned int a7, unsigned int a8, const void *a9)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v17;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v17 = Mutable;
  if (Mutable)
  {
    sub_100009B0C(Mutable, CFSTR("DARequestKind"), a2);
    if (a3)
      CFDictionarySetValue(v17, CFSTR("DARequestDisk"), a3);
    if (a4)
      sub_100009B0C(v17, CFSTR("DARequestArgument1"), a4);
    if (a5)
      CFDictionarySetValue(v17, CFSTR("DARequestArgument2"), a5);
    if (a6)
      CFDictionarySetValue(v17, CFSTR("DARequestArgument3"), a6);
    sub_100009B0C(v17, CFSTR("DARequestUserGID"), a8);
    sub_100009B0C(v17, CFSTR("DARequestUserUID"), a7);
    if (a9)
      CFDictionarySetValue(v17, CFSTR("DARequestCallback"), a9);
  }
  return v17;
}

uint64_t sub_10000ED14(uint64_t result)
{
  const __CFDictionary *v1;
  uint64_t v2;
  unsigned int v3;

  if (result)
  {
    v1 = (const __CFDictionary *)result;
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("DARequestDisk"));
    if (result)
    {
      v2 = result;
      if (sub_1000078A0(result, 1))
      {
        return 0;
      }
      else
      {
        result = sub_1000078A0(v2, 0x80000);
        if ((_DWORD)result)
        {
          v3 = sub_100009AD8(v1, CFSTR("DARequestKind"));
          result = 0;
          switch(v3)
          {
            case 1u:
              result = sub_10000EE4C(v1);
              break;
            case 5u:
              result = sub_10000F098(v1);
              break;
            case 7u:
              result = sub_10000F240(v1);
              break;
            case 0xAu:
              result = sub_10000F624(v1);
              break;
            case 0xBu:
              sub_10000F790(v1);
              result = 1;
              break;
            case 0xCu:
              result = sub_10000F868(v1);
              break;
            case 0xDu:
              result = sub_10000FA98(v1);
              break;
            case 0x11u:
              result = sub_10000F9C8(v1);
              break;
            default:
              return result;
          }
        }
      }
    }
  }
  return result;
}

const void *sub_10000EE24(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
}

const __CFNumber *sub_10000EE30(const __CFDictionary *a1)
{
  return sub_100009AD8(a1, CFSTR("DARequestKind"));
}

uint64_t sub_10000EE4C(const __CFDictionary *a1)
{
  void *Value;
  const __CFDictionary *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  const void *v9;
  const void *v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  __CFDictionary *v15;
  __CFDictionary *v16;
  const void *v17;
  uint64_t v18;
  CFMutableDictionaryRef v19;

  Value = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
  if ((sub_100009AD8(a1, CFSTR("DARequestState")) & 0x100000) != 0)
  {
    if (CFDictionaryGetValue(a1, CFSTR("DARequestDissenter")))
    {
      v5 = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDissenter"));
      sub_10000FDD4(a1, v5);
      sub_10001439C(v6);
      return 1;
    }
    else
    {
      CFRetain(a1);
      sub_100007DAC((uint64_t)Value, 1, 1);
      sub_100007A94((uint64_t)Value, 0);
      v8 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("DARequestCallback"));
      if (v8)
      {
        v9 = sub_100005B04(v8);
        if (v9)
        {
          v10 = v9;
          v11 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("DARequestArgument2"));
          v12 = sub_100009B98(v11);
          v13 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("DARequestArgument3"));
          v14 = sub_100009B98(v13);
          v15 = sub_100005974(kCFAllocatorDefault, v10, (uint64_t)v12, (uint64_t)v14, 2u, 0, 0, 0);
          if (v15)
          {
            v16 = v15;
            sub_100007A94((uint64_t)Value, v15);
            CFRelease(v16);
          }
        }
      }
      v17 = CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
      sub_10000A798("claimed disk, id = %@, success.", v17);
      sub_10000FDD4(a1, 0);
      v7 = 1;
      v18 = sub_100007DAC((uint64_t)v17, 1, 0);
      sub_10001439C(v18);
      CFRelease(a1);
    }
  }
  else
  {
    v3 = (const __CFDictionary *)sub_1000077D4((uint64_t)Value);
    CFRetain(a1);
    sub_100007DAC((uint64_t)Value, 1, 1);
    v4 = sub_100009AD8(a1, CFSTR("DARequestState"));
    sub_100009B0C(a1, CFSTR("DARequestState"), v4 | 0x100000);
    if (v3)
    {
      if (sub_100005A84(v3))
      {
        sub_10000DC20(Value, v3, (uint64_t)sub_100010030, (uint64_t)a1);
      }
      else
      {
        v19 = sub_100008068(kCFAllocatorDefault, -119930872);
        sub_100010030(v19, a1);
        CFRelease(v19);
      }
    }
    else
    {
      sub_100010030(0, a1);
    }
    return 0;
  }
  return v7;
}

uint64_t sub_10000F098(const __CFDictionary *a1)
{
  void *Value;
  const void *v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;

  Value = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
  if ((sub_100009AD8(a1, CFSTR("DARequestState")) & 0x100000) != 0)
  {
    if (!CFDictionaryGetValue(a1, CFSTR("DARequestDissenter")))
    {
      if (!sub_100017C7C((uint64_t)Value, 1))
      {
        CFRetain(a1);
        v7 = 1;
        sub_100007DAC((uint64_t)Value, 1, 1);
        sub_100017E38((uint64_t)Value, 1, 1);
        sub_10000A798("ejected disk, id = %@, ongoing.", Value);
        sub_100018150((uint64_t)sub_1000100C8, (uint64_t)Value, (uint64_t (*)(uint64_t, uint64_t))sub_100010174, (uint64_t)a1);
        return v7;
      }
      return 0;
    }
    v6 = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDissenter"));
    sub_10000FDD4(a1, v6);
  }
  else
  {
    v3 = sub_100007790((uint64_t)Value, CFSTR("DAMediaWhole"));
    if (sub_100007790((uint64_t)Value, CFSTR("DAMediaWhole")) != kCFBooleanFalse && v3 != 0)
    {
      CFRetain(a1);
      sub_100007DAC((uint64_t)Value, 1, 1);
      v8 = sub_100009AD8(a1, CFSTR("DARequestState"));
      sub_100009B0C(a1, CFSTR("DARequestState"), v8 | 0x100000);
      sub_10000E30C(Value, (uint64_t)sub_10001007C, (uint64_t)a1);
      return 0;
    }
    sub_10000FD7C(a1, -119930868);
  }
  sub_10001439C(v5);
  return 1;
}

BOOL sub_10000F240(const __CFDictionary *a1)
{
  void *Value;
  _BOOL8 result;
  const void *v4;
  const __CFString *v5;
  int v6;
  _BOOL4 v7;
  _BOOL4 v8;
  unsigned int v10;
  const void *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  const __CFDictionary *v16;
  int v17;
  const __CFString *v18;
  CFURLRef v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  const __CFString *cf1;
  const void *v30;

  Value = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
  if (CFDictionaryGetValue(a1, CFSTR("DARequestLink")) && sub_100017C24((uint64_t)Value, 1))
    return 0;
  if ((sub_100009AD8(a1, CFSTR("DARequestState")) & 0x10000) == 0)
  {
    v4 = sub_100007790((uint64_t)Value, CFSTR("DAMediaPath"));
    v5 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("DARequestArgument3"));
    if (sub_100007790((uint64_t)Value, CFSTR("DAVolumePath")))
    {
      v6 = -119930878;
      if (!v5)
        goto LABEL_42;
      if (!sub_10000BD90(v5, CFSTR("update")))
      {
        v7 = sub_10000BD90(v5, CFSTR("-s="));
        if (v7)
          v6 = -119930868;
        else
          v6 = -119930878;
        if (!v7 || !v4)
          goto LABEL_42;
LABEL_27:
        v10 = sub_100009AD8(a1, CFSTR("DARequestState"));
        sub_100009B0C(a1, CFSTR("DARequestState"), v10 & 0xFFFEFFFF | 0x10000);
        v11 = CFDictionaryGetValue(a1, CFSTR("DARequestArgument3"));
        if ((!v11 || !CFEqual(v11, CFSTR("automatic"))) && !sub_100007790((uint64_t)Value, CFSTR("DAVolumePath")))
        {
          v20 = sub_100007DAC((uint64_t)Value, 0x10000, 0);
          sub_10001439C(v20);
          return 0;
        }
LABEL_30:
        if ((sub_100009AD8(a1, CFSTR("DARequestState")) & 0x100000) != 0)
        {
          if ((sub_100009AD8(a1, CFSTR("DARequestState")) & 0x200000) == 0)
          {
            v13 = sub_100009AD8(a1, CFSTR("DARequestState"));
            sub_100009B0C(a1, CFSTR("DARequestState"), v13 | 0x200000);
          }
          if (CFDictionaryGetValue(a1, CFSTR("DARequestDissenter")))
          {
            v14 = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDissenter"));
            sub_10000FDD4(a1, v14);
LABEL_44:
            sub_10001439C(v15);
            return 1;
          }
          if (!sub_100017C7C((uint64_t)Value, 1))
          {
            v18 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("DARequestArgument2"));
            if (v18)
              v19 = CFURLCreateWithString(kCFAllocatorDefault, v18, 0);
            else
              v19 = 0;
            CFRetain(a1);
            sub_100007DAC((uint64_t)Value, 1, 1);
            sub_100017E38((uint64_t)Value, 1, 1);
            if ((sub_100009AD8(a1, CFSTR("DARequestState")) & 0x8000000) != 0)
            {
              v30 = CFDictionaryGetValue(a1, CFSTR("DARequestArgument3"));
              sub_10000B2E8((uint64_t)Value, v19, (void (*)(_QWORD, _QWORD, _QWORD))sub_100010534, (uint64_t)a1, v25, v26, v27, v28, CFSTR("rdonly"), (uint64_t)v30);
            }
            else
            {
              cf1 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("DARequestArgument3"));
              sub_10000B2E8((uint64_t)Value, v19, (void (*)(_QWORD, _QWORD, _QWORD))sub_100010534, (uint64_t)a1, v21, v22, v23, v24, cf1, 0);
            }
            if (v19)
              CFRelease(v19);
            return 1;
          }
        }
        else
        {
          if (sub_100007790((uint64_t)Value, CFSTR("DAVolumeMountable")) == kCFBooleanFalse)
          {
            v16 = a1;
            v17 = -119930868;
LABEL_43:
            sub_10000FD7C(v16, v17);
            goto LABEL_44;
          }
          CFRetain(a1);
          sub_100007DAC((uint64_t)Value, 1, 1);
          v12 = sub_100009AD8(a1, CFSTR("DARequestState"));
          sub_100009B0C(a1, CFSTR("DARequestState"), v12 & 0xFFEFFFFF | 0x100000);
          sub_10000E374(Value, (uint64_t)sub_1000104E8, (uint64_t)a1);
        }
        return 0;
      }
    }
    else if (v5)
    {
      v8 = sub_10000BD90(v5, CFSTR("-s="));
      if (v8)
        v6 = 22;
      else
        v6 = -119930868;
      if (v8 || v4 == 0)
        goto LABEL_42;
      goto LABEL_27;
    }
    if (v4)
      goto LABEL_27;
    v6 = -119930868;
LABEL_42:
    v16 = a1;
    v17 = v6;
    goto LABEL_43;
  }
  result = sub_1000078A0((uint64_t)Value, 0x10000);
  if (result)
    goto LABEL_30;
  return result;
}

uint64_t sub_10000F624(const __CFDictionary *a1)
{
  const void *Value;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const void *v8;
  uint64_t v9;

  Value = CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
  if ((sub_100009AD8(a1, CFSTR("DARequestState")) & 0x10000) != 0)
  {
    if (!sub_1000078A0((uint64_t)Value, 0x10000))
      return 0;
  }
  else if (!sub_100007790((uint64_t)Value, CFSTR("DAVolumePath")))
  {
    v3 = sub_100009AD8(a1, CFSTR("DARequestState"));
    sub_100009B0C(a1, CFSTR("DARequestState"), v3 | 0x10000);
    v4 = sub_100007DAC((uint64_t)Value, 0x10000, 0);
    sub_10001439C(v4);
    return 0;
  }
  if (sub_100017C7C((uint64_t)Value, 1))
    return 0;
  if (sub_100007790((uint64_t)Value, CFSTR("DAVolumePath")))
  {
    sub_10000FD7C(a1, -119930878);
    sub_10001439C(v7);
    return 1;
  }
  else
  {
    CFRetain(a1);
    v5 = 1;
    sub_100007DAC((uint64_t)Value, 1, 1);
    sub_100017E38((uint64_t)Value, 1, 1);
    v8 = CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
    sub_10000FDD4(a1, 0);
    sub_100017E38((uint64_t)v8, 1, 0);
    v9 = sub_100007DAC((uint64_t)v8, 1, 0);
    sub_10001439C(v9);
    CFRelease(a1);
  }
  return v5;
}

void sub_10000F790(const __CFDictionary *a1)
{
  void *Value;
  int v3;
  const void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  Value = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
  if (sub_100007790((uint64_t)Value, CFSTR("DAVolumeMountable")) == kCFBooleanFalse)
  {
    sub_10000FD7C(a1, -119930868);
    sub_10001439C(v7);
  }
  else
  {
    CFRetain(a1);
    sub_100007DAC((uint64_t)Value, 1, 1);
    v3 = sub_10000C7C8(Value);
    v4 = CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
    if (v3)
      v5 = 49197;
    else
      v5 = 0;
    sub_10000FD7C(a1, v5);
    v6 = sub_100007DAC((uint64_t)v4, 1, 0);
    sub_10001439C(v6);
    CFRelease(a1);
  }
}

uint64_t sub_10000F868(const __CFDictionary *a1)
{
  const void *Value;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  const __CFURL *v8;
  const __CFString *v9;

  Value = CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
  if (sub_100017C7C((uint64_t)Value, 1))
    return 0;
  if (sub_100007790((uint64_t)Value, CFSTR("DAVolumeMountable")) == kCFBooleanFalse)
    v4 = -119930868;
  else
    v4 = 0;
  if (!sub_100007790((uint64_t)Value, CFSTR("DAVolumePath")))
    v4 = -119930873;
  if (CFDictionaryGetValue(a1, CFSTR("DARequestArgument2")))
    v5 = v4;
  else
    v5 = -119930868;
  if (v5)
  {
    sub_10000FD7C(a1, v5);
    sub_10001439C(v6);
    return 1;
  }
  else
  {
    CFRetain(a1);
    v3 = 1;
    sub_100007DAC((uint64_t)Value, 1, 1);
    sub_100017E38((uint64_t)Value, 1, 1);
    sub_10000A798("renamed disk, id = %@, ongoing.", Value);
    v7 = sub_1000077F4((uint64_t)Value);
    v8 = (const __CFURL *)sub_100007790((uint64_t)Value, CFSTR("DAVolumePath"));
    v9 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("DARequestArgument2"));
    sub_100008E8C(v7, v8, v9, (void (*)(uint64_t, uint64_t))sub_100010698, (uint64_t)a1);
  }
  return v3;
}

uint64_t sub_10000F9C8(const __CFDictionary *a1)
{
  uint64_t result;
  CFDictionaryRef *v3;
  const __CFDictionary *Value;
  const __CFDictionary *v5;
  int v6;
  CFTypeID v7;
  uint64_t v8;
  int context;

  result = (uint64_t)CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
  if (result)
  {
    v3 = (CFDictionaryRef *)result;
    context = 0;
    Value = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("DARequestArgument2"));
    v5 = Value;
    if (!Value)
      goto LABEL_5;
    v6 = -119930877;
    v7 = CFGetTypeID(Value);
    if (v7 != CFDictionaryGetTypeID())
    {
      v6 = -119930868;
      goto LABEL_7;
    }
    context = 0;
    CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)sub_100010944, &context);
    if (!context)
    {
LABEL_5:
      sub_100007BD4(v3, v5);
      v6 = 0;
    }
LABEL_7:
    sub_10000FD7C(a1, v6);
    sub_10001439C(v8);
    return 1;
  }
  return result;
}

uint64_t sub_10000FA98(const __CFDictionary *a1)
{
  void *Value;
  uint64_t v3;
  int v4;
  const __CFBoolean *v5;
  const __CFURL *v6;
  CFStringRef v7;
  CFStringRef v8;
  CFMutableDictionaryRef v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  unsigned int v14;

  Value = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
  if (CFDictionaryGetValue(a1, CFSTR("DARequestLink")) && sub_100017C24((uint64_t)Value, 1))
    return 0;
  if ((sub_100009AD8(a1, CFSTR("DARequestState")) & 0x100000) != 0)
    goto LABEL_14;
  v4 = -119930878;
  v5 = (const __CFBoolean *)sub_100007790((uint64_t)Value, CFSTR("DAVolumeMountable"));
  if (!sub_100007790((uint64_t)Value, CFSTR("DAVolumePath")))
  {
    v4 = -119930873;
    goto LABEL_10;
  }
  v6 = (const __CFURL *)sub_100007790((uint64_t)Value, CFSTR("DAVolumePath"));
  v7 = CFURLGetString(v6);
  if (CFEqual(v7, CFSTR("file:///")) || (v8 = CFURLGetString(v6), CFEqual(v8, CFSTR("file:///System/Volumes/Data/"))))
  {
    v9 = sub_100008068(kCFAllocatorDefault, -119930878);
    sub_10000FF98(a1, v9);
    CFRelease(v9);
LABEL_10:
    sub_10000FD7C(a1, v4);
    goto LABEL_16;
  }
  if (v5 == kCFBooleanFalse)
  {
    v4 = -119930868;
    goto LABEL_10;
  }
  if (sub_1000078A0((uint64_t)Value, 0x10000000))
  {
    v11 = sub_100009AD8(a1, CFSTR("DARequestState"));
    sub_100009B0C(a1, CFSTR("DARequestState"), v11 & 0xFFEFFFFF | 0x100000);
LABEL_14:
    if (!CFDictionaryGetValue(a1, CFSTR("DARequestDissenter")))
    {
      if (!sub_100017C7C((uint64_t)Value, 1))
      {
        sub_100009AD8(a1, CFSTR("DARequestArgument1"));
        CFRetain(a1);
        v3 = 1;
        sub_100007DAC((uint64_t)Value, 1, 1);
        sub_100017E38((uint64_t)Value, 1, 1);
        sub_10000A798("unmounted disk, id = %@, ongoing.", Value);
        sub_100018150((uint64_t)sub_100010B18, (uint64_t)a1, (uint64_t (*)(uint64_t, uint64_t))sub_100010BA0, (uint64_t)a1);
        return v3;
      }
      return 0;
    }
    v12 = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDissenter"));
    sub_10000FDD4(a1, v12);
LABEL_16:
    sub_10001439C(v10);
    return 1;
  }
  CFRetain(a1);
  sub_100007DAC((uint64_t)Value, 1, 1);
  v14 = sub_100009AD8(a1, CFSTR("DARequestState"));
  sub_100009B0C(a1, CFSTR("DARequestState"), v14 & 0xFFEFFFFF | 0x100000);
  if (sub_100007790((uint64_t)Value, CFSTR("DAMediaWritable")) == kCFBooleanTrue)
    sub_100018150((uint64_t)sub_1000109AC, (uint64_t)Value, (uint64_t (*)(uint64_t, uint64_t))sub_100010A40, (uint64_t)a1);
  else
    sub_10000E400(Value, (uint64_t)sub_100010A78, (uint64_t)a1);
  return 0;
}

void sub_10000FD7C(const __CFDictionary *a1, int a2)
{
  CFMutableDictionaryRef v3;

  if (a2)
  {
    v3 = sub_100008068(kCFAllocatorDefault, a2);
    sub_10000FDD4(a1, v3);
    CFRelease(v3);
  }
  else
  {
    sub_10000FDD4(a1, 0);
  }
}

void sub_10000FDD4(const __CFDictionary *a1, void *a2)
{
  const __CFDictionary *Value;
  const __CFDictionary *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  const __CFDictionary *ValueAtIndex;
  void *v12;
  void *v13;

  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("DARequestCallback"));
  if (Value)
  {
    v5 = Value;
    v6 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("DARequestLink"));
    if (v6)
    {
      v7 = v6;
      a2 = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDissenter"));
      if (!a2)
      {
        Count = CFArrayGetCount(v7);
        if (Count < 1)
        {
LABEL_8:
          a2 = 0;
        }
        else
        {
          v9 = Count;
          v10 = 0;
          while (1)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v7, v10);
            v12 = (void *)CFDictionaryGetValue(ValueAtIndex, CFSTR("DARequestDissenter"));
            if (v12)
              break;
            if (v9 == ++v10)
              goto LABEL_8;
          }
          a2 = v12;
        }
      }
    }
    v13 = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
    sub_10000DCD4(v5, v13, a2);
  }
}

const __CFNumber *sub_10000FECC(const __CFDictionary *a1)
{
  return sub_100009AD8(a1, CFSTR("DARequestArgument1"));
}

const void *sub_10000FED8(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DARequestArgument2"));
}

const void *sub_10000FEE4(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DARequestArgument3"));
}

const void *sub_10000FEF0(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DARequestCallback"));
}

const void *sub_10000FEFC(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DARequestDissenter"));
}

const void *sub_10000FF08(const __CFDictionary *a1)
{
  return CFDictionaryGetValue(a1, CFSTR("DARequestLink"));
}

BOOL sub_10000FF14(const __CFDictionary *a1, int a2)
{
  return (sub_100009AD8(a1, CFSTR("DARequestState")) & a2) != 0;
}

const __CFNumber *sub_10000FF48(const __CFDictionary *a1)
{
  return sub_100009AD8(a1, CFSTR("DARequestUserGID"));
}

const __CFNumber *sub_10000FF64(const __CFDictionary *a1)
{
  return sub_100009AD8(a1, CFSTR("DARequestUserUID"));
}

void sub_10000FF80(__CFDictionary *a1, void *value)
{
  if (value)
    CFDictionarySetValue(a1, CFSTR("DARequestCallback"), value);
  else
    CFDictionaryRemoveValue(a1, CFSTR("DARequestCallback"));
}

void sub_10000FF98(__CFDictionary *a1, void *value)
{
  if (value)
    CFDictionarySetValue(a1, CFSTR("DARequestDissenter"), value);
  else
    CFDictionaryRemoveValue(a1, CFSTR("DARequestDissenter"));
}

void sub_10000FFB0(__CFDictionary *a1, void *value)
{
  if (value)
    CFDictionarySetValue(a1, CFSTR("DARequestLink"), value);
  else
    CFDictionaryRemoveValue(a1, CFSTR("DARequestLink"));
}

void sub_10000FFC8(const __CFDictionary *a1, int a2, int a3)
{
  unsigned int v6;
  uint64_t v7;

  v6 = sub_100009AD8(a1, CFSTR("DARequestState"));
  if (a3)
    v7 = v6 | a2;
  else
    v7 = v6 & ~a2;
  sub_100009B0C(a1, CFSTR("DARequestState"), v7);
}

void sub_100010018(__CFDictionary *a1, void *value)
{
  if (value)
    CFDictionarySetValue(a1, CFSTR("DARequestArgument2"), value);
  else
    CFDictionaryRemoveValue(a1, CFSTR("DARequestArgument2"));
}

void sub_100010030(void *value, __CFDictionary *a2)
{
  const void *v3;
  uint64_t v4;

  sub_10000FF98(a2, value);
  v3 = CFDictionaryGetValue(a2, CFSTR("DARequestDisk"));
  v4 = sub_100007DAC((uint64_t)v3, 1, 0);
  sub_10001439C(v4);
  CFRelease(a2);
}

void sub_10001007C(void *value, __CFDictionary *a2)
{
  const void *v3;
  uint64_t v4;

  sub_10000FF98(a2, value);
  v3 = CFDictionaryGetValue(a2, CFSTR("DARequestDisk"));
  v4 = sub_100007DAC((uint64_t)v3, 1, 0);
  sub_10001439C(v4);
  CFRelease(a2);
}

uint64_t sub_1000100C8(uint64_t a1)
{
  const char *v2;
  int v3;
  int v4;
  uint64_t v5;
  int *v6;

  v2 = (const char *)sub_100007774(a1, 1);
  v3 = open(v2, 0);
  if (v3 == -1)
  {
    v6 = __error();
    sub_10000A798("open failed with %d for %@", *v6, a1);
    return *__error();
  }
  else
  {
    v4 = v3;
    v5 = ioctl(v3, 0x20006415uLL, 0);
    if ((_DWORD)v5 == -1)
    {
      if (*__error() == 25)
        v5 = 0;
      else
        v5 = *__error();
    }
    close(v4);
  }
  return v5;
}

void sub_100010174(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  uint64_t v5;
  CFMutableDictionaryRef v6;
  int v7;
  uint64_t v8;

  Value = CFDictionaryGetValue(theDict, CFSTR("DARequestDisk"));
  v5 = (uint64_t)Value;
  if ((_DWORD)a1)
  {
    if (!CFDictionaryGetValue(theDict, CFSTR("DARequestDissenter")))
    {
      sub_10000A798("ejected disk, id = %@, failure.", v5);
      sub_10000A798("unable to eject %@ (status code 0x%08X).", v5, a1);
      v6 = sub_100008068(kCFAllocatorDefault, a1 | 0xC000);
      sub_10000FF98(theDict, v6);
      CFRelease(v6);
      sub_100018150((uint64_t)sub_100010294, (uint64_t)theDict, (uint64_t (*)(uint64_t, uint64_t))sub_100010174, (uint64_t)theDict);
      return;
    }
  }
  else
  {
    sub_10000A798("ejected disk, id = %@, success.", Value);
  }
  if ((_DWORD)a1)
    v7 = a1 | 0xC000;
  else
    v7 = 0;
  sub_10000FD7C(theDict, v7);
  sub_100017E38(v5, 1, 0);
  v8 = sub_100007DAC(v5, 1, 0);
  sub_10001439C(v8);
  CFRelease(theDict);
}

uint64_t sub_100010294(const __CFDictionary *a1)
{
  const void *Value;
  const char *v3;
  char *v4;
  char *v5;
  void *v6;
  io_registry_entry_t v8;
  io_object_t v9;
  io_object_t v10;
  const __CFAllocator *v11;
  const __CFString *CFProperty;
  const __CFString *v13;
  void *v14;
  int v15;
  io_iterator_t iterator;
  int buffer;
  char path[1024];
  _OWORD v19[8];

  Value = CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
  v3 = (const char *)sub_100007774((uint64_t)Value, 1);
  v4 = strdup(v3);
  if (v4)
  {
    v5 = v4;
    buffer = 0;
    proc_listpidspath(1u, 0, v4, 2u, &buffer, 4);
    free(v5);
    if (buffer)
    {
      v6 = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDissenter"));
      sub_1000080F4(v6, buffer);
      return 0xFFFFFFFFLL;
    }
    v8 = sub_100007788((uint64_t)Value);
    if (v8)
    {
      iterator = 0;
      IORegistryEntryCreateIterator(v8, "IOService", 1u, &iterator);
      if (iterator)
      {
        v9 = IOIteratorNext(iterator);
        if (!v9)
          goto LABEL_16;
        v10 = v9;
        while (1)
        {
          if (IOObjectConformsTo(v10, "IOMedia"))
          {
            v11 = CFGetAllocator(Value);
            CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v10, CFSTR("BSD Name"), v11, 0);
            if (CFProperty)
            {
              v13 = CFProperty;
              memset(v19, 0, sizeof(v19));
              CFStringGetCString(CFProperty, (char *)v19, 128, 0x8000100u);
              __strlcpy_chk(path, "/dev/", 1024, 1024);
              __strlcat_chk(path, "r", 1024, 1024);
              __strlcat_chk(path, v19, 1024, 1024);
              v15 = 0;
              proc_listpidspath(1u, 0, path, 0, &v15, 4);
              if (v15)
              {
                v14 = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDissenter"));
                sub_1000080F4(v14, v15);
                CFRelease(v13);
                IOObjectRelease(v10);
LABEL_16:
                IOObjectRelease(iterator);
                return 0xFFFFFFFFLL;
              }
              CFRelease(v13);
            }
          }
          IOObjectRelease(v10);
          v10 = IOIteratorNext(iterator);
          if (!v10)
            goto LABEL_16;
        }
      }
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_1000104E8(void *value, __CFDictionary *a2)
{
  const void *v3;
  uint64_t v4;

  sub_10000FF98(a2, value);
  v3 = CFDictionaryGetValue(a2, CFSTR("DARequestDisk"));
  v4 = sub_100007DAC((uint64_t)v3, 1, 0);
  sub_10001439C(v4);
  CFRelease(a2);
}

void sub_100010534(int a1, const void *a2, CFDictionaryRef theDict)
{
  void *Value;
  CFMutableDictionaryRef v7;
  int v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;

  Value = (void *)CFDictionaryGetValue(theDict, CFSTR("DARequestDisk"));
  if (a1)
  {
    v7 = sub_100008068(kCFAllocatorDefault, a1 | 0xC000u);
    sub_10000FF98(theDict, v7);
    CFRelease(v7);
  }
  else
  {
    v10 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("DARequestArgument3"));
    if (a2)
    {
      v11 = v10;
      if (v10)
      {
        if (sub_10000BD90(v10, CFSTR("-s=")))
          goto LABEL_3;
        sub_100007A0C((uint64_t)Value, a2);
        sub_100007B54((uint64_t)Value, CFSTR("DAVolumePath"), a2);
        if (sub_10000BD90(v11, CFSTR("update")))
          goto LABEL_3;
      }
      else
      {
        sub_100007A0C((uint64_t)Value, a2);
        sub_100007B54((uint64_t)Value, CFSTR("DAVolumePath"), a2);
      }
      sub_10000E1D0(Value, CFSTR("DAVolumePath"));
    }
  }
LABEL_3:
  if (a1)
    v8 = a1 | 0xC000;
  else
    v8 = 0;
  sub_10000FD7C(theDict, v8);
  sub_100017E38((uint64_t)Value, 1, 0);
  v9 = sub_100007DAC((uint64_t)Value, 1, 0);
  sub_10001439C(v9);
  CFRelease(theDict);
}

void sub_100010698(uint64_t a1, CFDictionaryRef theDict)
{
  void *Value;
  void *v5;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v7;
  const void *v8;
  const __CFURL *v9;
  UInt8 *v10;
  UInt8 *v11;
  CFStringRef v12;
  CFStringRef v13;
  CFStringRef v14;
  int v15;
  const void *v16;
  const void *v17;
  int v18;
  uint64_t v19;
  _BYTE v20[1112];
  char v21[1056];

  Value = (void *)CFDictionaryGetValue(theDict, CFSTR("DARequestDisk"));
  v5 = Value;
  if ((_DWORD)a1)
  {
    sub_10000A798("renamed disk, id = %@, failure.", Value);
    sub_10000A798("unable to rename %@ (status code 0x%08X).", v5, a1);
    goto LABEL_20;
  }
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    v7 = Mutable;
    v8 = CFDictionaryGetValue(theDict, CFSTR("DARequestArgument2"));
    if (!sub_1000063D0((uint64_t)v5, CFSTR("DAVolumeName"), v8))
    {
LABEL_18:
      CFRelease(v7);
      goto LABEL_19;
    }
    sub_100007B54((uint64_t)v5, CFSTR("DAVolumeName"), v8);
    CFArrayAppendValue(v7, CFSTR("DAVolumeName"));
    v9 = (const __CFURL *)sub_100007790((uint64_t)v5, CFSTR("DAVolumePath"));
    if (sub_100007790((uint64_t)v5, CFSTR("DAVolumeLifsURL")))
    {
      bzero(v20, 0x878uLL);
      v10 = sub_100009CC0(v9);
      if (v10)
      {
        v11 = v10;
        if (!sub_10000982C((const char *)v10, v20, 2))
        {
          v12 = CFStringCreateWithCString(kCFAllocatorDefault, v21, 0x8000100u);
          if (v12)
          {
            v13 = v12;
            sub_100007B54((uint64_t)v5, CFSTR("DAVolumeLifsURL"), v12);
            CFArrayAppendValue(v7, CFSTR("DAVolumeLifsURL"));
            CFRelease(v13);
          }
        }
        free(v11);
      }
    }
    v14 = CFURLGetString(v9);
    v15 = CFEqual(v14, CFSTR("file:///"));
    v16 = (const void *)sub_10000C0D0();
    v17 = v16;
    if (v15)
    {
      if (v16)
      {
        sub_100007A0C((uint64_t)v5, v16);
LABEL_16:
        CFRelease(v17);
      }
    }
    else if (v16)
    {
      sub_100007A0C((uint64_t)v5, v16);
      sub_100007B54((uint64_t)v5, CFSTR("DAVolumePath"), v17);
      CFArrayAppendValue(v7, CFSTR("DAVolumePath"));
      goto LABEL_16;
    }
    sub_10000E1D0(v5, v7);
    goto LABEL_18;
  }
LABEL_19:
  sub_10000A798("renamed disk, id = %@, success.", v5);
LABEL_20:
  if ((_DWORD)a1)
    v18 = a1 | 0xC000;
  else
    v18 = 0;
  sub_10000FD7C(theDict, v18);
  sub_100017E38((uint64_t)v5, 1, 0);
  v19 = sub_100007DAC((uint64_t)v5, 1, 0);
  sub_10001439C(v19);
  CFRelease(theDict);
}

CFIndex sub_100010944(const __CFString *a1, uint64_t a2, _DWORD *a3)
{
  CFIndex result;
  UInt8 buffer[4];
  CFRange v6;

  *(_DWORD *)buffer = 0;
  v6.location = 0;
  v6.length = 2;
  result = CFStringGetBytes(a1, v6, 0x8000100u, 0, 0, buffer, 4, 0);
  if (*(unsigned __int16 *)buffer != 21318)
    *a3 = 1;
  return result;
}

uint64_t sub_1000109AC(uint64_t a1)
{
  const __CFNumber *v2;
  const __CFNumber *v3;
  size_t v4;
  void *v5;
  void *v6;
  const char *v7;
  int v8;
  int v9;

  v2 = (const __CFNumber *)sub_100007790(a1, CFSTR("DAMediaBlockSize"));
  v3 = sub_100009B98(v2);
  if (v3)
  {
    v4 = (size_t)v3;
    v5 = malloc_type_malloc((size_t)v3, 0xF8827464uLL);
    if (v5)
    {
      v6 = v5;
      v7 = (const char *)sub_100007774(a1, 1);
      v8 = open(v7, 0);
      if (v8 != -1)
      {
        v9 = v8;
        read(v8, v6, v4);
        close(v9);
      }
      free(v6);
    }
  }
  return 0;
}

void sub_100010A40(int a1, CFDictionaryRef theDict)
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(theDict, CFSTR("DARequestDisk"));
  sub_10000E400(Value, (uint64_t)sub_100010A78, (uint64_t)theDict);
}

void sub_100010A78(const void *a1, CFDictionaryRef theDict)
{
  const void *Value;
  uint64_t v5;

  if (a1)
  {
    if ((sub_100009AD8(theDict, CFSTR("DARequestArgument1")) & 0x80000) == 0)
      CFDictionarySetValue(theDict, CFSTR("DARequestDissenter"), a1);
    if (sub_1000080D8((const __CFDictionary *)a1) == -119865599)
      CFDictionarySetValue(theDict, CFSTR("DARequestDissenter"), a1);
  }
  Value = CFDictionaryGetValue(theDict, CFSTR("DARequestDisk"));
  v5 = sub_100007DAC((uint64_t)Value, 1, 0);
  sub_10001439C(v5);
  CFRelease(theDict);
}

uint64_t sub_100010B18(const __CFDictionary *a1)
{
  const void *Value;
  const __CFURL *v3;
  UInt8 *v4;
  char *v5;
  const __CFNumber *v6;
  uint64_t v7;

  Value = CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
  v3 = (const __CFURL *)sub_100007790((uint64_t)Value, CFSTR("DAVolumePath"));
  v4 = sub_100009CC0(v3);
  if (!v4)
    return 22;
  v5 = (char *)v4;
  v6 = sub_100009AD8(a1, CFSTR("DARequestArgument1"));
  v7 = unmount(v5, v6 & 0x80000);
  if ((_DWORD)v7 == -1)
    v7 = *__error();
  free(v5);
  return v7;
}

void sub_100010BA0(uint64_t a1, CFDictionaryRef theDict)
{
  void *Value;
  int v5;
  int v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  char *v10;
  const char *v11;
  const char *v12;
  size_t v13;
  const void *v14;
  const __CFDictionary *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  CFMutableDictionaryRef v19;
  statfs *v20;

  Value = (void *)CFDictionaryGetValue(theDict, CFSTR("DARequestDisk"));
  if (!(_DWORD)a1)
    goto LABEL_10;
  v20 = 0;
  v5 = getmntinfo(&v20, 2);
  v6 = v5;
  if (v5 < 1)
  {
    v8 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 2168 * v5;
    while (1)
    {
      v10 = sub_10000A210((uint64_t)&v20[v7 / 0x878]);
      v11 = (const char *)sub_100007344((uint64_t)Value);
      v12 = (const char *)sub_100007344((uint64_t)Value);
      v13 = strlen(v12);
      if (!strncmp(v10, v11, v13 + 1))
        break;
      ++v8;
      v7 += 2168;
      if (v9 == v7)
        goto LABEL_9;
    }
  }
  if (v8 == v6)
  {
LABEL_9:
    sub_10000A61C(" %@ is not mounted. Ignore the umount error %d", Value, a1);
LABEL_10:
    v14 = sub_100007790((uint64_t)Value, CFSTR("DAVolumePath"));
    if (!sub_100009924((const __CFArray *)qword_1000252D8, v14))
      nullsub_4(v14);
    sub_100007A0C((uint64_t)Value, 0);
    sub_10000A798("unmounted disk, id = %@, success.", Value);
    if (sub_100007790((uint64_t)Value, CFSTR("DAMediaPath")))
    {
      sub_100007B54((uint64_t)Value, CFSTR("DAVolumePath"), 0);
      sub_10000E1D0(Value, CFSTR("DAVolumePath"));
    }
    else
    {
      sub_10000A798("removed disk, id = %@.", Value);
      sub_10000E268(Value);
      sub_100007B54((uint64_t)Value, CFSTR("DAVolumePath"), 0);
      sub_100007DAC((uint64_t)Value, 0x10000000, 1);
      sub_1000099FC((const __CFArray *)qword_100025288, Value);
    }
    v15 = theDict;
    v16 = 0;
    goto LABEL_16;
  }
  v18 = (void *)CFDictionaryGetValue(theDict, CFSTR("DARequestDissenter"));
  if (!v18)
  {
    sub_10000A798("unmounted disk, id = %@, failure.", Value);
    sub_10000A748("unable to unmount %@ (status code 0x%08X).", Value, a1);
    v19 = sub_100008068(kCFAllocatorDefault, 49168);
    sub_10000FF98(theDict, v19);
    CFRelease(v19);
    sub_100018150((uint64_t)sub_100010E38, (uint64_t)theDict, (uint64_t (*)(uint64_t, uint64_t))sub_100010BA0, (uint64_t)theDict);
    return;
  }
  v16 = v18;
  v15 = theDict;
LABEL_16:
  sub_10000FDD4(v15, v16);
  sub_100017E38((uint64_t)Value, 1, 0);
  v17 = sub_100007DAC((uint64_t)Value, 1, 0);
  sub_10001439C(v17);
  CFRelease(theDict);
}

uint64_t sub_100010E38(const __CFDictionary *a1)
{
  const void *Value;
  const __CFURL *v3;
  UInt8 *v4;
  UInt8 *v5;
  void *v6;
  int buffer;

  Value = CFDictionaryGetValue(a1, CFSTR("DARequestDisk"));
  v3 = (const __CFURL *)sub_100007790((uint64_t)Value, CFSTR("DAVolumePath"));
  v4 = sub_100009CC0(v3);
  if (v4)
  {
    v5 = v4;
    buffer = 0;
    proc_listpidspath(1u, 0, (const char *)v4, 3u, &buffer, 4);
    if (buffer)
    {
      v6 = (void *)CFDictionaryGetValue(a1, CFSTR("DARequestDissenter"));
      sub_1000080F4(v6, buffer);
    }
    free(v5);
  }
  return 0xFFFFFFFFLL;
}

const void *sub_100010ED0(const char *a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *ValueAtIndex;
  const char *v6;

  Count = CFArrayGetCount((CFArrayRef)qword_100025288);
  if (Count < 1)
    return 0;
  v3 = Count;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, v4);
    v6 = (const char *)sub_100007344((uint64_t)ValueAtIndex);
    if (!strcmp(v6, a1))
      break;
    if (v3 == ++v4)
      return 0;
  }
  return ValueAtIndex;
}

void sub_100010F50()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100010FC8, CFSTR("com.apple.mobile.keybagd.first_unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (MKBGetDeviceLockState(0) == 3 || MKBDeviceUnlockedSinceBoot())
  {
    sub_10000A798(" Device is unlocked");
    byte_100025318 = 1;
  }
  else
  {
    sub_10000A798(" Device is locked");
  }
}

void sub_100010FC8()
{
  int v0;
  CFIndex Count;
  CFIndex v2;
  CFIndex i;
  const void *ValueAtIndex;

  sub_10000A798("First unlock notification received");
  v0 = byte_100025318;
  byte_100025318 = 1;
  if (!v0)
  {
    Count = CFArrayGetCount((CFArrayRef)qword_100025288);
    if (Count >= 1)
    {
      v2 = Count;
      for (i = 0; i != v2; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, i);
        if (sub_100007790((uint64_t)ValueAtIndex, CFSTR("DAVolumeMountable")) == kCFBooleanTrue
          && !sub_10000C0D8((uint64_t)ValueAtIndex, 2))
        {
          if (sub_10000C0D8((uint64_t)ValueAtIndex, 0))
            sub_10000E35C((uint64_t)ValueAtIndex, 0, 0, 0, (uint64_t)CFSTR("automatic"));
        }
      }
    }
  }
}

void sub_1000110C0(int a1, io_iterator_t iterator)
{
  io_object_t v3;
  io_object_t v4;
  const __CFString *v5;
  CFBooleanRef v6;
  CFBooleanRef v7;
  const __CFAllocator *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const void *v21;
  const __CFBoolean *v22;
  const __CFString *v23;
  io_registry_entry_t v24;
  io_object_t v25;
  const __CFAllocator *v26;
  const __CFNumber *CFProperty;
  const __CFNumber *v28;
  int v29;
  const __CFAllocator *v30;
  const __CFString *v31;
  _QWORD *v32;
  uint64_t v33;
  io_object_t notification[2];
  int valuePtr;
  io_registry_entry_t parent;
  char __s1[1024];
  char buffer[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  v3 = IOIteratorNext(iterator);
  if (!v3)
    goto LABEL_44;
  v4 = v3;
  v5 = CFSTR("DAVolumeMountable");
  v6 = kCFBooleanTrue;
  v7 = kCFBooleanFalse;
  v8 = kCFAllocatorDefault;
  do
  {
    v9 = sub_100011644(v4);
    if (v9)
    {
      v10 = v9;
      sub_1000116C4(v4);
      if (sub_100007790((uint64_t)v10, v5) == v6 && sub_100007790((uint64_t)v10, CFSTR("DAMediaLeaf")) == v7)
        sub_10000E3A8(v10, 0);
      goto LABEL_43;
    }
    *(_QWORD *)notification = 0;
    IOServiceAddInterestNotification((IONotificationPortRef)qword_1000252B8, v4, "IOBusyInterest", (IOServiceInterestCallback)sub_100011B38, 0, &notification[1]);
    notification[0] = 0;
    IOServiceAddInterestNotification((IONotificationPortRef)qword_1000252B8, v4, "IOGeneralInterest", (IOServiceInterestCallback)sub_100011B38, 0, notification);
    v11 = (const void *)sub_10000642C(v8, v4);
    if (!v11)
      goto LABEL_39;
    v12 = v11;
    if (sub_100009924((const __CFArray *)qword_100025288, v11))
    {
      v13 = sub_100004DC8((const __CFArray *)qword_100025288, v12);
      sub_100011BD4((uint64_t)v13, 0);
      if (sub_100009924((const __CFArray *)qword_100025288, v12))
        sub_10001B264();
    }
    if (notification[1])
      sub_1000079CC((uint64_t)v12, notification[1]);
    if (notification[0])
      sub_100007D6C((uint64_t)v12, notification[0]);
    if (!sub_1000077B0((uint64_t)v12, 1))
      goto LABEL_20;
    v14 = (const char *)sub_1000077B0((uint64_t)v12, 1);
    if (!strncmp(v14, "/dev/disk", 9uLL))
      goto LABEL_20;
    v15 = (const char *)sub_100007774((uint64_t)v12, 1);
    v16 = (const char *)sub_1000077B0((uint64_t)v12, 1);
    if (link(v15, v16))
      goto LABEL_19;
    v17 = (const char *)sub_100007774((uint64_t)v12, 0);
    v18 = (const char *)sub_1000077B0((uint64_t)v12, 0);
    if (link(v17, v18))
    {
      v19 = (const char *)sub_1000077B0((uint64_t)v12, 1);
      unlink(v19);
LABEL_19:
      v20 = sub_1000077B0((uint64_t)v12, 1);
      sub_10000A748("unable to link %@ to %s.", v12, v20);
      sub_100007A4C((uint64_t)v12, 1, 0);
      sub_100007A4C((uint64_t)v12, 0, 0);
    }
LABEL_20:
    v21 = sub_100007790((uint64_t)v12, CFSTR("DAMediaContent"));
    if (!CFEqual(v21, CFSTR("41504653-0000-11AA-AA11-00306543ECAC")))
      goto LABEL_30;
    v22 = v7;
    v23 = v5;
    sub_100017E38((uint64_t)v12, 16, 1);
    parent = 0;
    v24 = sub_100007788((uint64_t)v12);
    IORegistryEntryGetParentEntry(v24, "IOService", &parent);
    v25 = parent;
    if (!parent)
      goto LABEL_29;
    while (1)
    {
      if (!IOObjectConformsTo(v25, "IOMedia"))
        goto LABEL_26;
      v26 = CFGetAllocator(v12);
      CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v25, CFSTR("BSD Unit"), v26, 0);
      if (!CFProperty)
        goto LABEL_26;
      v28 = CFProperty;
      valuePtr = 0;
      CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
      v29 = valuePtr;
      if (v29 != sub_1000077CC((uint64_t)v12))
        break;
      CFRelease(v28);
LABEL_26:
      IORegistryEntryGetParentEntry(v25, "IOService", &parent);
      IOObjectRelease(v25);
      v25 = parent;
      parent = 0;
      if (!v25)
        goto LABEL_29;
    }
    v30 = CFGetAllocator(v12);
    v31 = (const __CFString *)IORegistryEntryCreateCFProperty(v25, CFSTR("BSD Name"), v30, 0);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    *(_OWORD *)buffer = 0u;
    v39 = 0u;
    CFStringGetCString(v31, buffer, 128, 0x8000100u);
    __strlcpy_chk(__s1, "/dev/", 1024, 1024);
    __strlcat_chk(__s1, buffer, 1024, 1024);
    sub_100007DC8((uint64_t)v12, __s1);
    IOObjectRelease(v25);
    CFRelease(v28);
LABEL_29:
    v5 = v23;
    v7 = v22;
    v8 = kCFAllocatorDefault;
    v6 = kCFBooleanTrue;
LABEL_30:
    if (sub_100017C24((uint64_t)v12, 16) && sub_100017C24((uint64_t)v12, 4))
      sub_100007DAC((uint64_t)v12, 0x40000, 1);
    sub_10000A798("created disk, id = %@.", v12);
    sub_100017E38((uint64_t)v12, 0x10000, 0);
    CFArrayInsertValueAtIndex((CFMutableArrayRef)qword_100025288, 0, v12);
    v32 = malloc_type_malloc(0x10uLL, 0x10200405A9B18D6uLL);
    if (v32)
    {
      v33 = (uint64_t)v32;
      v32[1] = v12;
      CFRetain(v12);
      sub_100018150((uint64_t)sub_10000CFB8, v33, (uint64_t (*)(uint64_t, uint64_t))sub_10000CFC0, v33);
    }
    if (sub_100007790((uint64_t)v12, CFSTR("DADeviceInternal")) == v7
      || sub_100007790((uint64_t)v12, CFSTR("DAMediaRemovable")) == v6)
    {
      sub_100004D3C();
    }
    CFRelease(v12);
LABEL_39:
    if (notification[1])
      IOObjectRelease(notification[1]);
    if (notification[0])
      IOObjectRelease(notification[0]);
LABEL_43:
    IOObjectRelease(v4);
    v4 = IOIteratorNext(iterator);
  }
  while (v4);
LABEL_44:
  sub_10001439C();
}

const void *sub_100011644(io_object_t a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *ValueAtIndex;
  io_object_t v6;

  Count = CFArrayGetCount((CFArrayRef)qword_100025288);
  if (Count < 1)
    return 0;
  v3 = Count;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, v4);
    v6 = sub_100007788((uint64_t)ValueAtIndex);
    if (IOObjectIsEqualTo(v6, a1))
      break;
    if (v3 == ++v4)
      return 0;
  }
  return ValueAtIndex;
}

void sub_1000116C4(io_object_t a1)
{
  void *v2;
  void *v3;
  CFMutableArrayRef Mutable;
  __CFArray *v5;
  const __CFAllocator *v6;
  const void *Value;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const __CFString *v13;
  CFUUIDRef v14;
  CFUUIDRef v15;
  const void *v16;
  const void *v17;
  _QWORD *v18;
  uint64_t v19;
  CFTypeRef v20;
  CFMutableDictionaryRef properties;

  v2 = (void *)sub_100011644(a1);
  if (v2)
  {
    v3 = v2;
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      v5 = Mutable;
      properties = 0;
      v6 = CFGetAllocator(v3);
      IORegistryEntryCreateCFProperties(a1, &properties, v6, 0);
      if (properties)
      {
        Value = CFDictionaryGetValue(properties, CFSTR("Content"));
        if (sub_1000063D0((uint64_t)v3, CFSTR("DAMediaContent"), Value))
        {
          sub_100007B54((uint64_t)v3, CFSTR("DAMediaContent"), Value);
          CFArrayAppendValue(v5, CFSTR("DAMediaContent"));
        }
        v8 = CFDictionaryGetValue(properties, CFSTR("Ejectable"));
        if (sub_1000063D0((uint64_t)v3, CFSTR("DAMediaEjectable"), v8))
        {
          sub_100007B54((uint64_t)v3, CFSTR("DAMediaEjectable"), v8);
          CFArrayAppendValue(v5, CFSTR("DAMediaEjectable"));
        }
        v9 = CFDictionaryGetValue(properties, CFSTR("Leaf"));
        if (sub_1000063D0((uint64_t)v3, CFSTR("DAMediaLeaf"), v9))
        {
          sub_100007B54((uint64_t)v3, CFSTR("DAMediaLeaf"), v9);
          CFArrayAppendValue(v5, CFSTR("DAMediaLeaf"));
        }
        v10 = CFDictionaryGetValue(properties, CFSTR("Preferred Block Size"));
        if (sub_1000063D0((uint64_t)v3, CFSTR("DAMediaBlockSize"), v10))
        {
          sub_100007B54((uint64_t)v3, CFSTR("DAMediaBlockSize"), v10);
          CFArrayAppendValue(v5, CFSTR("DAMediaBlockSize"));
        }
        v11 = CFDictionaryGetValue(properties, CFSTR("Removable"));
        if (sub_1000063D0((uint64_t)v3, CFSTR("DAMediaRemovable"), v11))
        {
          sub_100007B54((uint64_t)v3, CFSTR("DAMediaRemovable"), v11);
          CFArrayAppendValue(v5, CFSTR("DAMediaRemovable"));
        }
        v12 = CFDictionaryGetValue(properties, CFSTR("Size"));
        if (sub_1000063D0((uint64_t)v3, CFSTR("DAMediaSize"), v12))
        {
          sub_100007B54((uint64_t)v3, CFSTR("DAMediaSize"), v12);
          CFArrayAppendValue(v5, CFSTR("DAMediaSize"));
        }
        v13 = (const __CFString *)CFDictionaryGetValue(properties, CFSTR("UUID"));
        if (v13)
        {
          v14 = sub_100005608(kCFAllocatorDefault, v13);
          if (v14)
          {
            v15 = v14;
            if (sub_1000063D0((uint64_t)v3, CFSTR("DAMediaUUID"), v14))
            {
              sub_100007B54((uint64_t)v3, CFSTR("DAMediaUUID"), v15);
              CFArrayAppendValue(v5, CFSTR("DAMediaUUID"));
            }
            CFRelease(v15);
          }
        }
        v16 = CFDictionaryGetValue(properties, CFSTR("Whole"));
        if (sub_1000063D0((uint64_t)v3, CFSTR("DAMediaWhole"), v16))
        {
          sub_100007B54((uint64_t)v3, CFSTR("DAMediaWhole"), v16);
          CFArrayAppendValue(v5, CFSTR("DAMediaWhole"));
        }
        v17 = CFDictionaryGetValue(properties, CFSTR("Writable"));
        if (sub_1000063D0((uint64_t)v3, CFSTR("DAMediaWritable"), v17))
        {
          sub_100007B54((uint64_t)v3, CFSTR("DAMediaWritable"), v17);
          CFArrayAppendValue(v5, CFSTR("DAMediaWritable"));
        }
        v18 = malloc_type_malloc(0x10uLL, 0x10200405A9B18D6uLL);
        if (v18)
        {
          v19 = (uint64_t)v18;
          v18[1] = v3;
          CFRetain(v3);
          sub_100018150((uint64_t)sub_10000CFB8, v19, (uint64_t (*)(uint64_t, uint64_t))sub_10000CFC0, v19);
        }
        v20 = IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("AppleTDMLocked"), kCFAllocatorDefault, 3u);
        if (sub_1000063D0((uint64_t)v3, CFSTR("DADeviceTDMLocked"), v20))
        {
          sub_100007B54((uint64_t)v3, CFSTR("DADeviceTDMLocked"), v20);
          CFArrayAppendValue(v5, CFSTR("DADeviceTDMLocked"));
        }
        if (v20)
          CFRelease(v20);
        if (CFArrayGetCount(v5))
        {
          sub_10000A798("updated disk, id = %@.", v3);
          if (sub_1000078A0((uint64_t)v3, 0x80000))
            sub_10000E1D0(v3, v5);
        }
        CFRelease(properties);
      }
      CFRelease(v5);
    }
  }
}

void sub_100011B38(uint64_t a1, io_object_t a2, int a3, uint64_t a4)
{
  const void *v5;
  uint64_t v6;
  double Current;

  if (a3 == -536870608)
  {
    sub_1000116C4(a2);
  }
  else if (a3 == -536870624)
  {
    v5 = sub_100011644(a2);
    if (v5)
    {
      v6 = (uint64_t)v5;
      if (a4)
      {
        Current = CFAbsoluteTimeGetCurrent();
        sub_1000079C4(v6, Current);
      }
      else
      {
        sub_1000110C0((int)v5, dword_1000252AC);
        sub_1000079C4(v6, 0.0);
        sub_10001439C();
      }
    }
  }
}

void sub_100011BD4(uint64_t a1, io_iterator_t a2)
{
  const __CFArray *Mutable;
  io_object_t v5;
  io_object_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  const __CFBoolean *v10;
  const __CFURL *v11;
  UInt8 *v12;
  UInt8 *v13;
  int v14;
  char v15;
  CFMutableDataRef v16;
  __CFArray *theArray;
  int v18;
  _OWORD v19[4];
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
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;

  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (a1)
    v5 = sub_100007788(a1);
  else
    v5 = IOIteratorNext(a2);
  v6 = v5;
  if (v5)
  {
    v18 = -1;
    theArray = Mutable;
    do
    {
      v7 = (void *)sub_100011644(v6);
      if (v7)
        goto LABEL_40;
      if (a1)
        sub_10001B28C();
      sub_1000110C0(0, dword_1000252AC);
      v7 = (void *)sub_100011644(v6);
      if (v7)
      {
LABEL_40:
        sub_10000A798("removed disk, id = %@.", v7);
        if (sub_1000077B0((uint64_t)v7, 1))
        {
          v8 = (const char *)sub_1000077B0((uint64_t)v7, 1);
          unlink(v8);
        }
        if (sub_1000077B0((uint64_t)v7, 0))
        {
          v9 = (const char *)sub_1000077B0((uint64_t)v7, 0);
          unlink(v9);
        }
        sub_10000E4E8(v7);
        if (sub_1000078A0((uint64_t)v7, 0x80000))
          sub_10000E268(v7);
        if (sub_1000078A0((uint64_t)v7, 0x40000))
        {
          sub_100007DAC((uint64_t)v7, 0x80000, 1);
          sub_10000E3E0(v7, 0x80000u, 0);
          v10 = (const __CFBoolean *)sub_100007790((uint64_t)v7, CFSTR("DAVolumeMountable"));
          if (sub_100007790((uint64_t)v7, CFSTR("DAVolumePath")))
          {
            if (v10 != kCFBooleanFalse && sub_100007790((uint64_t)v7, CFSTR("DAMediaWritable")) == kCFBooleanTrue)
            {
              v11 = (const __CFURL *)sub_100007790((uint64_t)v7, CFSTR("DAVolumePath"));
              v12 = sub_100009CC0(v11);
              if (!v12)
                goto LABEL_23;
              v13 = v12;
              v46 = 0u;
              v47 = 0u;
              v44 = 0u;
              v45 = 0u;
              v42 = 0u;
              v43 = 0u;
              v40 = 0u;
              v41 = 0u;
              v38 = 0u;
              v39 = 0u;
              v36 = 0u;
              v37 = 0u;
              v34 = 0u;
              v35 = 0u;
              v32 = 0u;
              v33 = 0u;
              v30 = 0u;
              v31 = 0u;
              v28 = 0u;
              v29 = 0u;
              v26 = 0u;
              v27 = 0u;
              v24 = 0u;
              v25 = 0u;
              v22 = 0u;
              v23 = 0u;
              v20 = 0u;
              v21 = 0u;
              memset(v19, 0, sizeof(v19));
              v14 = sub_10000982C((const char *)v12, v19, 2);
              v15 = v20;
              free(v13);
              if (v14)
                goto LABEL_23;
              if ((v15 & 1) != 0)
              {
                Mutable = theArray;
              }
              else
              {
LABEL_23:
                v16 = sub_100007868(v7);
                Mutable = theArray;
                if (v18 != -1 && v18 != sub_1000077CC((uint64_t)v7))
                  nullsub_4(theArray);
                CFArrayAppendValue(theArray, v16);
                v18 = sub_1000077CC((uint64_t)v7);
              }
            }
          }
        }
        if (sub_100007790((uint64_t)v7, CFSTR("DAMediaWhole")) == kCFBooleanTrue)
        {
          sub_100017E38((uint64_t)v7, 16, 0);
          sub_100017E38((uint64_t)v7, 2, 0);
          sub_100017E38((uint64_t)v7, 4, 0);
        }
        sub_100007DAC((uint64_t)v7, 0x10000000, 1);
        if (sub_100007790((uint64_t)v7, CFSTR("DADeviceInternal")) == kCFBooleanFalse
          || sub_100007790((uint64_t)v7, CFSTR("DAMediaRemovable")) == kCFBooleanTrue)
        {
          sub_100004D80();
          sub_10001424C();
        }
        sub_1000099FC((const __CFArray *)qword_100025288, v7);
        if (a1)
          break;
      }
      IOObjectRelease(v6);
      v6 = IOIteratorNext(a2);
    }
    while (v6);
  }
  if (CFArrayGetCount(Mutable))
    nullsub_4(Mutable);
  CFRelease(Mutable);
  sub_10001439C();
}

void sub_100011FC4(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t msg;
  mach_msg_header_t *v6;

  if (a2 == 8)
  {
    sub_1000120C0(a1);
  }
  else if (a2 == 2)
  {
    msg = dispatch_mach_msg_get_msg(a3, 0);
    if ((dispatch_mach_mig_demux(0, &off_100021128, 1, a3) & 1) == 0)
    {
      if (*(_DWORD *)(msg + 20) == 70)
        sub_10001206C(a1);
      v6 = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0);
      mach_msg_destroy(v6);
    }
  }
}

void sub_10001206C(int a1)
{
  const void *v2;

  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (a1)
  {
    v2 = sub_1000122A0(a1);
    if (v2)
      sub_100013EB4((uint64_t)v2);
  }
}

uint64_t sub_1000120C0(int a1)
{
  const void *v2;
  const void *v3;
  __CFArray *v4;
  __CFArray *v5;

  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (a1 && (v2 = sub_1000122A0(a1)) != 0)
  {
    v3 = v2;
    sub_10000A6B4("%@ -> %s", v2, qword_1000252F0);
    sub_10000A61C("  removed session, id = %@.", v3);
    v4 = (__CFArray *)sub_1000077D4((uint64_t)v3);
    if (v4)
      CFArrayRemoveAllValues(v4);
    v5 = (__CFArray *)sub_1000077DC((uint64_t)v3);
    if (v5)
      CFArrayRemoveAllValues(v5);
    sub_10000E5D0(v3);
    sub_100013FD0((uint64_t)v3, 0x10000000, 1);
    if (!sub_100013DE4((uint64_t)v3))
    {
      sub_100004D80();
      sub_10001424C();
    }
    sub_1000099FC((const __CFArray *)qword_100025308, v3);
    return 0;
  }
  else
  {
    sub_10000A61C("unable to release session, id = ? [?]:%d.", a1);
    return 4175036419;
  }
}

uint64_t sub_1000121C4(int a1, const char *a2, vm_address_t *a3, unsigned int *a4)
{
  const void *v8;
  const void *v9;
  const void *v10;
  const __CFData *v11;
  vm_address_t v12;
  uint64_t v13;

  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (a1
    && (v8 = sub_1000122A0(a1)) != 0
    && (sub_10000A6B4("%@ -> %s", v8, qword_1000252F0), (v9 = sub_100010ED0(a2)) != 0)
    && (v10 = v9, (v11 = sub_100007868(v9)) != 0)
    && (v12 = sub_100009A50(v11, a4), (*a3 = v12) != 0))
  {
    sub_10000A61C("  copied disk description, id = %@.", v10);
    return 0;
  }
  else
  {
    v13 = 4175036419;
    sub_10000A61C("unable to copy disk description, id = %s (status code 0x%08X).", a2, -119930877);
  }
  return v13;
}

const void *sub_1000122A0(int a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *ValueAtIndex;

  Count = CFArrayGetCount((CFArrayRef)qword_100025308);
  if (Count < 1)
    return 0;
  v3 = Count;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100025308, v4);
    if (sub_100013DA0((uint64_t)ValueAtIndex) == a1)
      break;
    if (v3 == ++v4)
      return 0;
  }
  return ValueAtIndex;
}

uint64_t sub_10001231C(int a1, const char *a2, _DWORD *a3)
{
  const void *v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;

  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (a1
    && (v6 = sub_1000122A0(a1)) != 0
    && (sub_10000A6B4("%@ -> %s", v6, qword_1000252F0), (v7 = sub_100010ED0(a2)) != 0))
  {
    v8 = v7;
    v9 = sub_100007858((uint64_t)v7);
    *a3 = v9;
    sub_10000A61C("  got disk options, id = %@, options = 0x%08X.", v8, v9);
    return 0;
  }
  else
  {
    v10 = 4175036419;
    sub_10000A61C("unable to get disk options, id = %s (status code 0x%08X).", a2, -119930877);
  }
  return v10;
}

uint64_t sub_1000123DC(int a1, const char *a2, _DWORD *a3)
{
  uint64_t v3;
  const void *v6;

  v3 = 4175036419;
  if (a1)
  {
    if (sub_1000122A0(a1))
    {
      v6 = sub_100010ED0(a2);
      if (v6)
      {
        v3 = 0;
        *a3 = sub_1000078C4((uint64_t)v6);
      }
    }
  }
  return v3;
}

uint64_t sub_100012434(int a1, const char *a2, _DWORD *a3)
{
  const void *v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (a1
    && (v6 = sub_1000122A0(a1)) != 0
    && (sub_10000A6B4("%@ -> %s", v6, qword_1000252F0), (v7 = sub_100010ED0(a2)) != 0))
  {
    v8 = v7;
    v9 = sub_1000077D4((uint64_t)v7);
    *a3 = v9 != 0;
    v10 = "false";
    if (v9)
      v10 = "true";
    sub_10000A61C("  got disk claim state, id = %@, claimed = %s.", v8, v10);
    return 0;
  }
  else
  {
    v11 = 4175036419;
    sub_10000A61C("unable to get disk claim state, id = %s (status code 0x%08X).", a2, -119930877);
  }
  return v11;
}

uint64_t sub_100012510(int a1, const char *a2, int a3, _OWORD *a4)
{
  uint64_t v8;
  const void *v9;
  const void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  const char *v14;
  audit_token_t atoken;

  v8 = 4175036419;
  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (!a1)
    goto LABEL_8;
  v9 = sub_1000122A0(a1);
  if (!v9)
    goto LABEL_8;
  sub_10000A6B4("%@ -> %s", v9, qword_1000252F0);
  v10 = sub_100010ED0(a2);
  if (!v10)
    goto LABEL_8;
  v11 = (uint64_t)v10;
  v12 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v12;
  audit_token_to_euid(&atoken);
  v13 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v13;
  audit_token_to_egid(&atoken);
  v8 = sub_1000155E0();
  if ((_DWORD)v8)
    goto LABEL_8;
  v14 = "true";
  if (!a3)
    v14 = "false";
  sub_10000A61C("  set disk adoption, id = %@, adoption = %s.", v11, v14);
  v8 = sub_10000CB94(v11, a3);
  if ((_DWORD)v8)
LABEL_8:
    sub_10000A61C("unable to set disk adoption, id = %s (status code 0x%08X).", a2, v8);
  return v8;
}

uint64_t sub_100012650(int a1, const char *a2, uint64_t a3, _OWORD *a4)
{
  uint64_t v8;
  const void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  audit_token_t atoken;

  v8 = 4175036419;
  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (!a1)
    goto LABEL_6;
  v9 = sub_1000122A0(a1);
  if (!v9)
    goto LABEL_6;
  sub_10000A6B4("%@ -> %s", v9, qword_1000252F0);
  v10 = (void *)sub_100010ED0(a2);
  if (!v10)
    goto LABEL_6;
  v11 = v10;
  v12 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v12;
  audit_token_to_euid(&atoken);
  v13 = a4[1];
  *(_OWORD *)atoken.val = *a4;
  *(_OWORD *)&atoken.val[4] = v13;
  audit_token_to_egid(&atoken);
  v8 = sub_1000155E0();
  if ((_DWORD)v8
    || (sub_10000A61C("  set disk encoding, id = %@, encoding = %d.", v11, a3), v8 = sub_10000CC90(v11, a3), (_DWORD)v8))
  {
LABEL_6:
    sub_10000A61C("unable to set disk encoding, id = %s (status code 0x%08X).", a2, v8);
  }
  return v8;
}

uint64_t sub_100012778(int a1, const char *a2, uint64_t a3, int a4)
{
  const void *v8;
  const void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (a1
    && (v8 = sub_1000122A0(a1)) != 0
    && (sub_10000A6B4("%@ -> %s", v8, qword_1000252F0), (v9 = sub_100010ED0(a2)) != 0))
  {
    v10 = (uint64_t)v9;
    v11 = "true";
    if (!a4)
      v11 = "false";
    sub_10000A61C("  set disk options, id = %@, options = 0x%08X, value = %s.", v9, a3, v11);
    sub_100007D50(v10, a3, a4);
    return 0;
  }
  else
  {
    v12 = 4175036419;
    sub_10000A61C("unable to set disk options, id = %s (status code 0x%08X).", a2, -119930877);
  }
  return v12;
}

uint64_t sub_100012868(int a1, const char *a2)
{
  const void *v4;
  const void *v5;
  const void *v6;
  uint64_t v7;
  const __CFDictionary *v8;
  uint64_t v9;

  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (a1
    && (v4 = sub_1000122A0(a1)) != 0
    && (v5 = v4, sub_10000A6B4("%@ -> %s", v4, qword_1000252F0), (v6 = sub_100010ED0(a2)) != 0)
    && (v7 = (uint64_t)v6, (v8 = (const __CFDictionary *)sub_1000077D4((uint64_t)v6)) != 0)
    && sub_100005B04(v8) == v5)
  {
    sub_10000A61C("  unclaimed disk, id = %@.", v7);
    sub_100007A94(v7, 0);
    return 0;
  }
  else
  {
    v9 = 4175036419;
    sub_10000A61C("unable to unclaim disk, id = %s (status code 0x%08X).", a2, -119930877);
  }
  return v9;
}

uint64_t sub_100012940(int a1, vm_address_t *a2, unsigned int *a3)
{
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex i;
  __CFDictionary *ValueAtIndex;
  const __CFData *v15;
  const __CFData *v16;
  vm_address_t v17;

  v6 = 4175036419;
  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (!a1)
    goto LABEL_14;
  v7 = sub_1000122A0(a1);
  if (!v7)
    goto LABEL_14;
  v8 = (uint64_t)v7;
  sub_10000A6B4("%s -> %@", qword_1000252F0, v7);
  v9 = (const __CFArray *)sub_1000077D4(v8);
  if (!v9)
  {
    sub_100013FD0(v8, 0x1000000, 0);
LABEL_14:
    sub_10000A61C("unable to copy callback queue (status code 0x%08X).", v6);
    return v6;
  }
  v10 = v9;
  Count = CFArrayGetCount(v9);
  if (Count >= 1)
  {
    v12 = Count;
    for (i = 0; i != v12; ++i)
    {
      ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(v10, i);
      sub_100005B78(ValueAtIndex, 0);
      sub_100005B90(ValueAtIndex, 0);
      sub_100005BA8(ValueAtIndex, 0);
    }
  }
  v15 = sub_100009D2C(kCFAllocatorDefault, (uint64_t)v10);
  if (v15)
  {
    v16 = v15;
    v17 = sub_100009A50(v15, a3);
    *a2 = v17;
    if (v17)
    {
      sub_10000A61C("  dispatched callback queue.");
      v6 = 0;
    }
    CFRelease(v16);
  }
  CFArrayRemoveAllValues(v10);
  sub_100013FD0(v8, 0x1000000, 0);
  if ((_DWORD)v6)
    goto LABEL_14;
  return v6;
}

BOOL sub_100012AB8(_OWORD *a1, const __CFString *a2)
{
  __int128 v3;
  __SecTask *v4;
  __SecTask *v5;
  CFTypeRef v6;
  const void *v7;
  _BOOL8 v8;
  audit_token_t v10;

  v3 = a1[1];
  *(_OWORD *)v10.val = *a1;
  *(_OWORD *)&v10.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v10);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = SecTaskCopyValueForEntitlement(v4, a2, 0);
  if (v6)
  {
    v7 = v6;
    v8 = CFEqual(v6, kCFBooleanTrue) != 0;
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

uint64_t sub_100012B5C(int a1, const char *a2, _OWORD *a3, _DWORD *a4)
{
  __int128 v8;
  pid_t v9;
  __int128 v10;
  __int128 v11;
  _BOOL4 v12;
  __int128 v13;
  pid_t v14;
  uint64_t v15;
  const void *v16;
  __int128 v18;
  pid_t v19;
  audit_token_t atoken;

  v8 = a3[1];
  *(_OWORD *)atoken.val = *a3;
  *(_OWORD *)&atoken.val[4] = v8;
  v9 = audit_token_to_pid(&atoken);
  sub_10000A6B4("%s [%d] -> %s", a2, v9, (const char *)qword_1000252F0);
  if (a1)
  {
    v10 = a3[1];
    *(_OWORD *)atoken.val = *a3;
    *(_OWORD *)&atoken.val[4] = v10;
    if (sub_100012AB8(&atoken, CFSTR("com.apple.private.diskarbitrationd.access")))
    {
      v11 = a3[1];
      *(_OWORD *)atoken.val = *a3;
      *(_OWORD *)&atoken.val[4] = v11;
      v12 = sub_100012AB8(&atoken, CFSTR("com.apple.private.diskarbitrationd.is_fskitd"));
      v13 = a3[1];
      *(_OWORD *)atoken.val = *a3;
      *(_OWORD *)&atoken.val[4] = v13;
      v14 = audit_token_to_pid(&atoken);
      v15 = sub_100013C34(kCFAllocatorDefault, a2, v14);
      if (v15)
      {
        v16 = (const void *)v15;
        sub_10000A6B4("%@ -> %s", v15, qword_1000252F0);
        sub_10000A61C("  created session, id = %@.", v16);
        *a4 = sub_100013DA0((uint64_t)v16);
        sub_100004D3C();
        CFArrayAppendValue((CFMutableArrayRef)qword_100025308, v16);
        sub_100013EE8((uint64_t)v16);
        sub_100013FA4((uint64_t)v16, v12);
        CFRelease(v16);
        return 0;
      }
    }
    else
    {
      sub_10000A61C("no entitlement");
    }
  }
  v18 = a3[1];
  *(_OWORD *)atoken.val = *a3;
  *(_OWORD *)&atoken.val[4] = v18;
  v19 = audit_token_to_pid(&atoken);
  sub_10000A61C("unable to create session, id = %s [%d].", a2, v19);
  return 4175036419;
}

uint64_t sub_100012CDC(int a1, unsigned int a2, const char *a3, uint64_t a4, const UInt8 *a5, unsigned int a6, const UInt8 *a7, unsigned int a8, uint64_t a9, uint64_t a10, _OWORD *a11)
{
  uint64_t v17;
  const void *v18;
  const void *v19;
  const __CFString *v20;
  uint64_t v21;
  const char *v22;
  CFPropertyListRef v24;
  __CFDictionary *v25;
  __int128 v26;
  uid_t v27;
  __int128 v28;
  gid_t v29;
  const __CFString *v30;
  __CFDictionary *v31;
  const void *v32;
  __CFDictionary *v33;
  __int128 v34;
  __int128 v35;
  const void *v36;
  __int128 v37;
  __int128 v38;
  uid_t v39;
  const __CFURL *v40;
  const __CFURL *v41;
  UInt8 *v42;
  size_t v43;
  const __CFURL *v44;
  __CFString *v45;
  __int128 v46;
  pid_t v47;
  __int128 v48;
  __int128 v49;
  const char *v50;
  int v51;
  __int128 v52;
  pid_t v53;
  __int128 v54;
  __int128 v55;
  unsigned int v56;
  uid_t v57;
  const void *v58;
  audit_token_t v61;
  audit_token_t atoken;

  v17 = a10;
  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (!a1
    || (v18 = sub_1000122A0(a1)) == 0
    || (v19 = v18, sub_10000A6B4("%@ -> %s", v18, qword_1000252F0), (v58 = sub_100010ED0(a3)) == 0))
  {
    v21 = 4175036419;
LABEL_7:
    v22 = sub_100009D08(a2);
    sub_10000A61C("unable to queue solicitation, id = %016llX:%016llX, kind = %s, disk = %s (status code 0x%08X).", a9, v17, v22, a3, v21);
    return v21;
  }
  sub_10000A6B4("%@ -> %s", v19, qword_1000252F0);
  if (a5)
    v20 = (const __CFString *)sub_10000A024(kCFAllocatorDefault, a5, a6);
  else
    v20 = 0;
  if (a7)
    v24 = sub_10000A024(kCFAllocatorDefault, a7, a8);
  else
    v24 = 0;
  v25 = sub_100005974(kCFAllocatorDefault, v19, a9, a10, a2, 0, 0, 0);
  v26 = a11[1];
  *(_OWORD *)atoken.val = *a11;
  *(_OWORD *)&atoken.val[4] = v26;
  v27 = audit_token_to_euid(&atoken);
  v28 = a11[1];
  *(_OWORD *)atoken.val = *a11;
  *(_OWORD *)&atoken.val[4] = v28;
  v29 = audit_token_to_egid(&atoken);
  v30 = v20;
  v31 = sub_10000EBE0((uint64_t)kCFAllocatorDefault, a2, v58, (int)a4, v20, v24, v27, v29, v25);
  v32 = v24;
  if (v31)
  {
    v33 = v31;
    switch(a2)
    {
      case 5u:
      case 0xCu:
      case 0xDu:
        v48 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v48;
        audit_token_to_euid(&atoken);
        v49 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v49;
        audit_token_to_egid(&atoken);
        v21 = sub_1000155E0();
        goto LABEL_31;
      case 7u:
        v34 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v34;
        audit_token_to_euid(&atoken);
        v35 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v35;
        audit_token_to_egid(&atoken);
        v21 = sub_1000155E0();
        if ((_DWORD)v21)
          goto LABEL_35;
        v36 = sub_100007790((uint64_t)v58, CFSTR("DAMediaContent"));
        if (CFEqual(v36, CFSTR("C12A7328-F81F-11D2-BA4B-00A0C93EC93B")))
        {
          v37 = a11[1];
          *(_OWORD *)atoken.val = *a11;
          *(_OWORD *)&atoken.val[4] = v37;
          if (audit_token_to_euid(&atoken))
          {
            v38 = a11[1];
            *(_OWORD *)atoken.val = *a11;
            *(_OWORD *)&atoken.val[4] = v38;
            v39 = audit_token_to_euid(&atoken);
            if (v39 != sub_1000078C4((uint64_t)v58))
            {
              v21 = 4175036424;
              goto LABEL_35;
            }
          }
        }
        if (!v30)
          goto LABEL_34;
        v40 = CFURLCreateWithString(kCFAllocatorDefault, v30, 0);
        if (!v40)
          goto LABEL_34;
        v41 = v40;
        v42 = sub_100009CC0(v40);
        if (!v42)
        {
          v21 = 4175036419;
          goto LABEL_52;
        }
        v21 = 4175036419;
        if ((a4 & 2) != 0)
        {
          __strlcpy_chk(&atoken, v42, 1024, 1024);
          goto LABEL_51;
        }
        if (realpath_DARWIN_EXTSN((const char *)v42, (char *)&atoken))
        {
          v43 = strlen((const char *)&atoken);
          v44 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)&atoken, v43, 1u);
          v21 = (uint64_t)v44;
          if (v44)
          {
            v45 = (__CFString *)CFURLGetString(v44);
            sub_100010018(v33, v45);
            CFRelease((CFTypeRef)v21);
LABEL_51:
            v21 = 0;
          }
        }
LABEL_52:
        v54 = a11[1];
        *(_OWORD *)v61.val = *a11;
        *(_OWORD *)&v61.val[4] = v54;
        if (audit_token_to_euid(&v61))
        {
          v55 = a11[1];
          *(_OWORD *)v61.val = *a11;
          *(_OWORD *)&v61.val[4] = v55;
          v56 = v21;
          v57 = audit_token_to_euid(&v61);
          if (v57 == sub_1000078C4((uint64_t)v58))
            v21 = v56;
          else
            v21 = 4175036425;
        }
        CFRelease(v41);
LABEL_31:
        if (!(_DWORD)v21)
        {
LABEL_34:
          sub_10000E71C(v33);
          v50 = sub_100009D08(a2);
          sub_10000A61C("  queued solicitation, id = %016llX:%016llX, kind = %s, disk = %@, options = 0x%08X.", a9, a10, v50, v58, a4);
          v21 = 0;
        }
LABEL_35:
        CFRelease(v33);
        if (v25)
          goto LABEL_36;
        goto LABEL_37;
      case 0xAu:
        v46 = a11[1];
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v46;
        v47 = audit_token_to_pid(&atoken);
        if (v47 == getpid())
        {
          sub_10000A3F0("_kDADiskProbe authorized ourself");
          goto LABEL_34;
        }
        v51 = sub_100013DA8((uint64_t)v19);
        v52 = a11[1];
        if (v51)
          v21 = 0;
        else
          v21 = 4175036425;
        *(_OWORD *)atoken.val = *a11;
        *(_OWORD *)&atoken.val[4] = v52;
        v53 = audit_token_to_pid(&atoken);
        sub_10000A3F0("_kDADiskProbe checking request from pid %u, replying %d", v53, v21);
        goto LABEL_31;
      case 0x11u:
        if (sub_100013DA8((uint64_t)v19))
          goto LABEL_34;
        v21 = 4175036425;
        goto LABEL_35;
      default:
        goto LABEL_34;
    }
  }
  v21 = 4175036419;
  if (v25)
LABEL_36:
    CFRelease(v25);
LABEL_37:
  if (v30)
    CFRelease(v30);
  v17 = a10;
  if (v32)
    CFRelease(v32);
  if ((_DWORD)v21)
    goto LABEL_7;
  return v21;
}

uint64_t sub_10001325C(int a1, uint64_t a2, uint64_t a3, unsigned int a4, const char *a5, const UInt8 *a6, unsigned int a7, int a8)
{
  const void *v16;
  const char *v17;
  uint64_t v18;

  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (a1 && (v16 = sub_1000122A0(a1)) != 0)
  {
    sub_10000A6B4("%@ -> %s", v16, qword_1000252F0);
    if (a6)
      a6 = (const UInt8 *)sub_10000A024(kCFAllocatorDefault, a6, a7);
    if (!sub_10000D788(a6, a8))
    {
      v17 = sub_100009D08(a4);
      sub_10000A61C("  dispatched response, id = %016llX:%016llX, kind = %s, disk = %s, orphaned.", a2, a3, v17, a5);
    }
    if (a6)
      CFRelease(a6);
    return 0;
  }
  else
  {
    v18 = 4175036419;
    sub_10000A61C("unable to dispatch response, id = %016llX:%016llX, disk = %s (status code 0x%08X).", a2, a3, a5, -119930877);
  }
  return v18;
}

uint64_t sub_10001337C(int a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, __CFDictionary *a6, unsigned int a7, const UInt8 *a8, unsigned int a9)
{
  uint64_t v17;
  const void *v18;
  const void *v19;
  __CFDictionary *v20;
  const char *v21;
  CFIndex Count;
  CFIndex v23;
  CFIndex i;
  void *ValueAtIndex;
  int v26;
  const char *v27;

  v17 = 4175036419;
  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (!a1
    || (v18 = sub_1000122A0(a1)) == 0
    || (v19 = v18, sub_10000A6B4("%@ -> %s", v18, qword_1000252F0), a4 > 0x11))
  {
LABEL_30:
    v27 = sub_100009D08(a4);
    sub_10000A61C("unable to register callback, id = %016llX:%016llX, kind = %s (status code 0x%08X).", a2, a3, v27, v17);
    return v17;
  }
  if (a6)
    a6 = sub_100009FC8(kCFAllocatorDefault, (const UInt8 *)a6, a7);
  if (a8)
    a8 = (const UInt8 *)sub_10000A024(kCFAllocatorDefault, a8, a9);
  v20 = sub_100005974(kCFAllocatorDefault, v19, a2, a3, a4, a5, a6, a8);
  if (v20)
  {
    sub_100013EAC((uint64_t)v19, v20);
    v21 = sub_100009D08(a4);
    sub_10000A61C("  registered callback, id = %016llX:%016llX, kind = %s.", a2, a3, v21);
    if (sub_100005AC0(v20))
    {
      if (sub_100005AC0(v20) != 15)
      {
LABEL_23:
        CFRelease(v20);
        v17 = 0;
        goto LABEL_24;
      }
      if (!byte_100024418)
      {
        v26 = 0;
        goto LABEL_22;
      }
      sub_10000DCD4(v20, 0, 0);
    }
    else
    {
      Count = CFArrayGetCount((CFArrayRef)qword_100025288);
      if (Count >= 1)
      {
        v23 = Count;
        for (i = 0; i != v23; ++i)
        {
          ValueAtIndex = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, i);
          if (sub_1000078A0((uint64_t)ValueAtIndex, 0x80000))
            sub_10000DCD4(v20, ValueAtIndex, 0);
        }
      }
      sub_10000E454((uint64_t)v19, 16, 0, 0);
      if (!byte_100024418)
        goto LABEL_23;
      sub_10000E454((uint64_t)v19, 15, 0, 0);
    }
    v26 = 1;
LABEL_22:
    sub_100013FD0((uint64_t)v19, 1, v26);
    goto LABEL_23;
  }
LABEL_24:
  if (a6)
    CFRelease(a6);
  if (a8)
    CFRelease(a8);
  if (!v20)
    goto LABEL_30;
  return 0;
}

uint64_t sub_100013600(int a1)
{
  const void *v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (a1 && (v2 = sub_1000122A0(a1)) != 0)
  {
    v3 = (uint64_t)v2;
    sub_10000A6B4("%@ -> %s", v2, qword_1000252F0);
    sub_10000A61C("  set keepalive, id = %@.", v3);
    sub_100013FEC(v3, 1);
    sub_100004D80();
    sub_10001424C();
    return 0;
  }
  else
  {
    v4 = 4175036419;
    sub_10000A61C("unable to set keep alive,  (status code 0x%08X).", -119930877);
  }
  return v4;
}

uint64_t sub_1000136B0(int a1, int a2)
{
  const void *v4;
  uint64_t v5;

  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (a1 && (v4 = sub_1000122A0(a1)) != 0)
  {
    v5 = (uint64_t)v4;
    sub_10000A6B4("%@ -> %s", v4, qword_1000252F0);
    sub_100013F00(v5, a2);
    sub_10000A61C("  set client port, id = %@.", v5);
    return 0;
  }
  else
  {
    sub_10000A61C("unable to set client port, id = ? [?]:%d.", a1);
    return 4175036419;
  }
}

uint64_t sub_100013764(int a1, uint64_t a2, uint64_t a3)
{
  const void *v6;
  const void *v7;
  __CFDictionary *v8;
  const __CFDictionary *v9;
  uint64_t v10;

  sub_10000A6B4("? [?]:%d -> %s", a1, (const char *)qword_1000252F0);
  if (a1
    && (v6 = sub_1000122A0(a1)) != 0
    && (v7 = v6,
        sub_10000A6B4("%@ -> %s", v6, qword_1000252F0),
        (v8 = sub_100005974(kCFAllocatorDefault, v7, a2, a3, 0, 0, 0, 0)) != 0))
  {
    v9 = v8;
    sub_10000E9DC(v8);
    sub_100013FF4((uint64_t)v7, v9);
    sub_10000A61C("  unregistered callback, id = %016llX:%016llX.", a2, a3);
    CFRelease(v9);
    return 0;
  }
  else
  {
    v10 = 4175036419;
    sub_10000A61C("unable to unregister callback, id = %016llX:%016llX (status code 0x%08X).", a2, a3, -119930877);
  }
  return v10;
}

void sub_100013860(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const char *v4;
  const void *v5;

  v2 = sub_10000734C(kCFAllocatorDefault, a1);
  if (v2)
  {
    v3 = (const void *)v2;
    sub_10000A798("created disk, id = %@.", v2);
    if ((*(_BYTE *)(a1 + 67) & 0x40) != 0)
    {
      v4 = strrchr((char *)(a1 + 1112), 64) + 1;
      if (!strncmp(v4, "/dev/disk", 9uLL))
      {
        v5 = sub_100010ED0(v4);
        if (v5)
        {
          if (!sub_1000078A0((uint64_t)v5, 32))
            sub_100007DAC((uint64_t)v3, 32, 0);
        }
      }
    }
    CFArrayInsertValueAtIndex((CFMutableArrayRef)qword_100025288, 0, v3);
    CFRelease(v3);
  }
}

void sub_100013938()
{
  int v0;
  unint64_t v1;
  uint64_t v2;
  char *v3;
  const void *v4;
  const void *v5;
  statfs *v6;
  statfs *v7;
  statfs *v8;

  v8 = 0;
  v0 = getmntinfo(&v8, 2);
  if (v0 >= 1)
  {
    v1 = 0;
    v2 = 2168 * v0;
    do
    {
      v3 = sub_10000A210((uint64_t)&v8[v1 / 0x878]);
      v4 = sub_100010ED0(v3);
      if (v4)
      {
        v5 = v4;
        if (!sub_100007790((uint64_t)v4, CFSTR("DAVolumePath")))
        {
          if (sub_100007790((uint64_t)v5, CFSTR("DAVolumeMountable")) == kCFBooleanFalse)
            sub_10000E3A8(v5, 0);
          sub_10000E3C4(v5, 0);
        }
      }
      else
      {
        v6 = v8;
        v7 = &v8[v1 / 0x878];
        if (strncmp(v8[v1 / 0x878].f_mntfromname, "/dev/disk", 9uLL)
          && (v7->f_flags & 0x20) == 0
          && strcmp(v6[v1 / 0x878].f_fstypename, "devfs"))
        {
          sub_100013860((uint64_t)v7);
          sub_10001439C();
        }
      }
      v1 += 2168;
    }
    while (v2 != v1);
  }
}

void sub_100013A74()
{
  CFIndex Count;
  CFIndex v1;
  CFIndex i;
  const void *ValueAtIndex;

  Count = CFArrayGetCount((CFArrayRef)qword_100025288);
  if (Count >= 1)
  {
    v1 = Count;
    for (i = 0; i != v1; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, i);
      if (sub_100007790((uint64_t)ValueAtIndex, CFSTR("DAVolumePath")))
        sub_10000E3C4(ValueAtIndex, 0);
    }
  }
}

uint64_t sub_100013AFC()
{
  if (qword_1000251A0 != -1)
    dispatch_once(&qword_1000251A0, &stru_100021150);
  return qword_1000251A8;
}

void sub_100013B3C(id a1)
{
  qword_1000251A8 = (uint64_t)dispatch_workloop_create_inactive("DAServer");
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)qword_1000251A8);
}

uint64_t sub_100013B74()
{
  uint64_t result;

  if (dword_1000251B0
    || (result = bootstrap_check_in(bootstrap_port, "com.apple.DiskArbitration.diskarbitrationd", (mach_port_t *)&dword_1000251B0), dword_1000251B0))
  {
    if (qword_1000251A0 != -1)
      dispatch_once(&qword_1000251A0, &stru_100021150);
    qword_1000251B8 = dispatch_mach_create_f("diskarbitrationd", qword_1000251A8, 0, sub_100011FC4);
    return dispatch_mach_connect(qword_1000251B8, dword_1000251B0, 0, 0);
  }
  return result;
}

uint64_t sub_100013C2C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t sub_100013C34(const __CFAllocator *a1, const char *a2, int a3)
{
  uint64_t Instance;
  uint64_t v7;
  CFMutableArrayRef Mutable;
  uint64_t v9;
  uint64_t f;
  uint64_t v11;
  mach_port_t previous;
  mach_port_name_t name;

  Instance = _CFRuntimeCreateInstance(a1, qword_1000251C0, 64, 0);
  v7 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = 0;
    *(_QWORD *)(Instance + 24) = 0;
    *(_QWORD *)(Instance + 32) = 0;
    *(_QWORD *)(Instance + 40) = CFArrayCreateMutable(a1, 0, &kCFTypeArrayCallBacks);
    Mutable = CFArrayCreateMutable(a1, 0, &kCFTypeArrayCallBacks);
    *(_QWORD *)(v7 + 48) = Mutable;
    *(_QWORD *)(v7 + 64) = 0;
    *(_WORD *)(v7 + 72) = 0;
    if (!*(_QWORD *)(v7 + 40))
      sub_10001B2B4();
    if (!Mutable)
      sub_10001B2DC();
    name = 0;
    if (mach_port_allocate(mach_task_self_, 1u, &name))
      goto LABEL_8;
    v9 = sub_100013AFC();
    f = dispatch_mach_create_f("diskarbitrationd/session", v9, name, sub_100011FC4);
    if (!f
      || (v11 = f, previous = 0, mach_port_request_notification(mach_task_self_, name, 70, 1u, name, 0x15u, &previous)))
    {
      mach_port_mod_refs(mach_task_self_, name, 1u, -1);
LABEL_8:
      CFRelease((CFTypeRef)v7);
      return 0;
    }
    if (previous)
      sub_10001B304();
    *(_QWORD *)(v7 + 24) = strdup(a2);
    *(_DWORD *)(v7 + 32) = a3;
    *(_QWORD *)(v7 + 56) = v11;
    *(_DWORD *)(v7 + 64) = name;
  }
  return v7;
}

uint64_t sub_100013DA0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

uint64_t sub_100013DA8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 73);
}

BOOL sub_100013DB0(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 36) & a2) != 0;
}

uint64_t sub_100013DC0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

BOOL sub_100013DC8(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 68) & a2) != 0;
}

uint64_t sub_100013DD8()
{
  return qword_1000251C0;
}

uint64_t sub_100013DE4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 72);
}

uint64_t sub_100013DEC()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass(&unk_100021170);
  qword_1000251C0 = result;
  return result;
}

void sub_100013E10(uint64_t a1, const void *a2)
{
  mach_port_t v3;
  mach_msg_header_t msg;

  *(_DWORD *)(a1 + 68) &= ~1u;
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), a2);
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 40)) == 1)
  {
    v3 = *(_DWORD *)(a1 + 16);
    if (v3)
    {
      *(_QWORD *)&msg.msgh_voucher_port = 0;
      msg.msgh_remote_port = v3;
      msg.msgh_local_port = 0;
      *(_QWORD *)&msg.msgh_bits = 0x1800000013;
      if (mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0) == 268435460)
        mach_msg_destroy(&msg);
    }
  }
}

void sub_100013EAC(uint64_t a1, const void *a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 48), a2);
}

void sub_100013EB4(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 56))
  {
    dispatch_mach_cancel();
    dispatch_release(*(dispatch_object_t *)(a1 + 56));
    *(_QWORD *)(a1 + 56) = 0;
  }
}

uint64_t sub_100013EE8(uint64_t a1)
{
  return dispatch_mach_connect(*(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), 0, 0);
}

void sub_100013F00(uint64_t a1, int a2)
{
  mach_port_name_t v4;
  mach_port_t v5;
  mach_msg_header_t msg;

  v4 = *(_DWORD *)(a1 + 16);
  if (v4)
    mach_port_deallocate(mach_task_self_, v4);
  *(_DWORD *)(a1 + 16) = a2;
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 40)))
  {
    v5 = *(_DWORD *)(a1 + 16);
    if (v5)
    {
      *(_QWORD *)&msg.msgh_voucher_port = 0;
      msg.msgh_remote_port = v5;
      msg.msgh_local_port = 0;
      *(_QWORD *)&msg.msgh_bits = 0x1800000013;
      if (mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0) == 268435460)
        mach_msg_destroy(&msg);
    }
  }
}

uint64_t sub_100013FA4(uint64_t result, int a2)
{
  *(_BYTE *)(result + 73) = a2 != 0;
  return result;
}

uint64_t sub_100013FB4(uint64_t result, int a2, int a3)
{
  int v3;

  if (a3)
    v3 = a2;
  else
    v3 = 0;
  *(_DWORD *)(result + 36) = *(_DWORD *)(result + 36) & ~a2 | v3;
  return result;
}

uint64_t sub_100013FD0(uint64_t result, int a2, int a3)
{
  int v3;

  if (a3)
    v3 = a2;
  else
    v3 = 0;
  *(_DWORD *)(result + 68) = *(_DWORD *)(result + 68) & ~a2 | v3;
  return result;
}

uint64_t sub_100013FEC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 72) = a2;
  return result;
}

void sub_100013FF4(uint64_t a1, const __CFDictionary *a2)
{
  CFIndex Count;
  unint64_t v5;
  const __CFDictionary *ValueAtIndex;
  const __CFNumber *v7;
  const __CFNumber *v8;
  CFIndex v9;
  unint64_t v10;
  const __CFDictionary *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;

  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 48));
  if (Count >= 1)
  {
    v5 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 48), v5 - 2);
      v7 = sub_100005A84(ValueAtIndex);
      if (v7 == sub_100005A84(a2))
      {
        v8 = sub_100005AA8(ValueAtIndex);
        if (v8 == sub_100005AA8(a2))
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 48), v5 - 2);
      }
      --v5;
    }
    while (v5 > 1);
  }
  v9 = CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
  if (v9 >= 1)
  {
    v10 = v9 + 1;
    do
    {
      v11 = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), v10 - 2);
      v12 = sub_100005A84(v11);
      if (v12 == sub_100005A84(a2))
      {
        v13 = sub_100005AA8(v11);
        if (v13 == sub_100005AA8(a2))
          CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 40), v10 - 2);
      }
      --v10;
    }
    while (v10 > 1);
  }
}

void sub_10001410C(uint64_t a1)
{
  mach_port_name_t v2;
  void *v3;
  const void *v4;
  const void *v5;
  mach_port_name_t v6;

  v2 = *(_DWORD *)(a1 + 16);
  if (v2)
    mach_port_deallocate(mach_task_self_, v2);
  v3 = *(void **)(a1 + 24);
  if (v3)
    free(v3);
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 48);
  if (v5)
    CFRelease(v5);
  v6 = *(_DWORD *)(a1 + 64);
  if (v6)
    mach_port_mod_refs(mach_task_self_, v6, 1u, -1);
}

BOOL sub_100014184(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 64) == *(_DWORD *)(a2 + 64);
}

uint64_t sub_100014198(uint64_t a1)
{
  return *(unsigned int *)(a1 + 64);
}

CFStringRef sub_1000141A0(uint64_t a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("%s [%d]:%d"), *(_QWORD *)(a1 + 24), *(unsigned int *)(a1 + 32), *(unsigned int *)(a1 + 64));
}

CFStringRef sub_1000141EC(uint64_t a1)
{
  const __CFAllocator *v2;
  CFAllocatorRef v3;

  v2 = CFGetAllocator((CFTypeRef)a1);
  v3 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<DASession %p [%p]>{id = %s [%d]:%d}"), a1, v3, *(_QWORD *)(a1 + 24), *(unsigned int *)(a1 + 32), *(unsigned int *)(a1 + 64));
}

void sub_10001424C()
{
  int v0;
  int v1;
  dispatch_time_t v2;
  NSObject *v3;

  v0 = byte_100024418;
  v1 = sub_100004DBC();
  sub_10000A798("__DASetIdleTimer %d %x", v0, v1);
  if (!sub_100004DBC() && byte_100024418 == 1)
  {
    qword_100025320 = CFAbsoluteTimeGetCurrent();
    if (!byte_1000252A8)
    {
      sub_10000A798("Idle timer started ");
      byte_1000252A8 = 1;
      v2 = dispatch_time(0, 20000000000);
      v3 = sub_100013AFC();
      dispatch_after(v2, v3, &stru_1000211F0);
    }
  }
}

void sub_100014310(id a1)
{
  CFAbsoluteTime v1;

  sub_10000A798("__DAIdleTimerCallback fired");
  byte_1000252A8 = 0;
  if (byte_100024418 == 1 && !sub_100004DBC())
  {
    v1 = *(double *)&qword_100025320 + 20.0;
    if (v1 < CFAbsoluteTimeGetCurrent())
    {
      sub_10000A798("__DAIdleTimerCallback exiting");
      exit(0);
    }
    sub_10001424C();
  }
}

void sub_10001439C()
{
  NSObject *v0;

  if (byte_100024418)
    sub_100004D3C();
  byte_100024418 = 0;
  v0 = sub_100013AFC();
  dispatch_async_f(v0, 0, (dispatch_function_t)sub_1000143DC);
}

void sub_1000143DC()
{
  CFIndex Count;
  CFIndex v1;
  CFIndex v2;
  int v3;
  double v4;
  const void *ValueAtIndex;
  uint64_t v6;
  double v7;
  double v8;
  CFAbsoluteTime Current;
  dispatch_time_t v10;
  NSObject *v11;
  CFIndex v12;
  CFIndex v13;
  CFIndex v14;
  _BYTE *v15;
  void *v16;
  const __CFNumber *v17;
  const char **v18;
  CFMutableArrayRef Mutable;
  __CFArray *v20;
  const __CFArray *v21;
  CFIndex v22;
  CFIndex v23;
  CFIndex i;
  const void *v25;
  const __CFArray *v26;
  CFIndex v27;
  CFIndex v28;
  CFIndex j;
  const void *v30;
  uint64_t v31;
  CFIndex v32;
  CFIndex v33;
  const void *v34;
  int v35;
  uint64_t v36;
  CFIndex v37;
  uint64_t v38;
  CFMutableSetRef v39;
  const __CFSet *v40;
  CFIndex v41;
  const __CFDictionary *v42;
  const __CFDictionary *v43;
  const void *v44;
  const __CFArray *v45;
  const __CFArray *v46;
  CFIndex v47;
  CFIndex v48;
  const __CFDictionary *v49;
  const void *v50;
  BOOL v51;
  CFIndex v52;
  CFIndex v53;
  const __CFDictionary *v54;
  const void *v55;
  int v56;
  int v57;
  const __CFArray *v58;
  const __CFArray *v59;
  CFIndex v60;
  CFIndex v61;
  CFIndex k;
  const __CFDictionary *v63;
  const void *v64;
  CFIndex v65;
  CFIndex v66;
  CFIndex m;
  const void *v68;
  CFIndex v69;
  CFRange v70;

  Count = CFArrayGetCount((CFArrayRef)qword_100025288);
  if (Count < 1)
  {
    v3 = 1;
  }
  else
  {
    v1 = Count;
    v2 = 0;
    v3 = 1;
    v4 = kCFAbsoluteTimeIntervalSince1904;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, v2);
      if (ValueAtIndex)
      {
        v6 = (uint64_t)ValueAtIndex;
        v7 = sub_100007798((uint64_t)ValueAtIndex);
        v8 = v7;
        if (v7 == 0.0)
        {
          if (sub_100007790(v6, CFSTR("DAMediaWhole")) == kCFBooleanTrue)
            sub_100017E38(v6, 4, 1);
        }
        else
        {
          v8 = v7 + 10.0;
        }
        if (v8 == 0.0 || v8 < CFAbsoluteTimeGetCurrent())
        {
          if (sub_100007790(v6, CFSTR("DAMediaWhole")) == kCFBooleanTrue)
            sub_100017E38(v6, 2, 1);
        }
        else
        {
          v3 = 0;
          if (v8 + 1.0 < v4)
            v4 = v8 + 1.0;
        }
      }
      ++v2;
    }
    while (v1 != v2);
    if (kCFAbsoluteTimeIntervalSince1904 > v4 && CFAbsoluteTimeGetCurrent() < v4)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v10 = dispatch_time(0, 1000000000 * (uint64_t)(v4 - Current));
      v11 = sub_100013AFC();
      dispatch_after(v10, v11, &stru_100021230);
    }
  }
  v12 = CFArrayGetCount((CFArrayRef)qword_100025288);
  if (v12 >= 1)
  {
    v13 = v12;
    v14 = 0;
    v69 = v12;
    v15 = &unk_100025000;
    do
    {
      v16 = (void *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, v14);
      if (!sub_1000078A0((uint64_t)v16, 1))
      {
        if (sub_1000078A0((uint64_t)v16, 0x10000))
        {
          if (sub_1000078A0((uint64_t)v16, 0x20000))
          {
            if (sub_1000078A0((uint64_t)v16, 0x40000))
            {
              if (sub_1000078A0((uint64_t)v16, 0x80000))
              {
                if (!qword_100025280)
                {
                  if (sub_100007790((uint64_t)v16, CFSTR("DAMediaType")))
                  {
                    v17 = (const __CFNumber *)sub_100007790((uint64_t)v16, CFSTR("DAMediaSize"));
                    if (v17)
                    {
                      if (!sub_100009B98(v17) && !sub_100017C24((uint64_t)v16, 0x10000))
                      {
                        if (sub_10000D0D0((uint64_t)v16))
                          sub_10000E278((uint64_t)v16, 0, 0);
                        sub_100017E38((uint64_t)v16, 0x10000, 1);
                      }
                    }
                  }
                }
                goto LABEL_23;
              }
              sub_100007DAC((uint64_t)v16, 0x80000, 1);
              sub_10000DB44(v16);
              sub_10001439C(v36);
            }
            else
            {
              if (byte_100025290)
                goto LABEL_23;
              if (sub_1000078A0((uint64_t)v16, 2))
              {
                v32 = CFArrayGetCount((CFArrayRef)qword_100025288);
                if (v32 < 1)
                {
                  v33 = 0;
                }
                else
                {
                  v33 = 0;
                  while (1)
                  {
                    v34 = CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, v33);
                    v35 = sub_1000077CC((uint64_t)v16);
                    if (v35 == sub_1000077CC((uint64_t)v34)
                      && (!sub_1000078A0((uint64_t)v34, 0x10000)
                       || !sub_1000078A0((uint64_t)v34, 0x40000) && !sub_1000078A0((uint64_t)v34, 2)))
                    {
                      break;
                    }
                    if (v32 == ++v33)
                      goto LABEL_66;
                  }
                }
                if (v33 == v32)
LABEL_66:
                  sub_100014CA4((uint64_t)v16);
                v3 = 0;
                goto LABEL_51;
              }
              sub_100014CA4((uint64_t)v16);
            }
          }
          else
          {
            Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
            if (Mutable)
            {
              v20 = Mutable;
              v21 = (const __CFArray *)qword_100025308;
              v22 = CFArrayGetCount((CFArrayRef)qword_100025308);
              if (v22 >= 1)
              {
                v23 = v22;
                for (i = 0; i != v23; ++i)
                {
                  v25 = CFArrayGetValueAtIndex(v21, i);
                  v26 = (const __CFArray *)sub_1000077DC((uint64_t)v25);
                  v27 = CFArrayGetCount(v26);
                  if (v27 >= 1)
                  {
                    v28 = v27;
                    for (j = 0; j != v28; ++j)
                    {
                      v30 = CFArrayGetValueAtIndex(v26, j);
                      if (sub_100005AC0((const __CFDictionary *)v30) == 9)
                        CFArrayAppendValue(v20, v30);
                    }
                  }
                }
              }
              v70.length = CFArrayGetCount(v20);
              v70.location = 0;
              CFArraySortValues(v20, v70, (CFComparatorFunction)sub_1000152B4, 0);
              CFRetain(v16);
              sub_100007AD4((uint64_t)v16, v20);
              sub_100007DAC((uint64_t)v16, 0x20000, 1);
              v31 = sub_100007DAC((uint64_t)v16, 1, 1);
              sub_1000152EC(v31, (uint64_t)v16);
              CFRelease(v20);
              v3 = 0;
              v13 = v69;
LABEL_51:
              v15 = (_BYTE *)&unk_100025000;
              goto LABEL_23;
            }
          }
        }
        else
        {
          if (v15[456] == 1)
          {
            sub_100016CB8();
            sub_100017070();
            sub_10001748C();
            v15[456] = 0;
          }
          if (!sub_100017C7C((uint64_t)v16, 1))
          {
            CFRetain(v16);
            sub_100007DAC((uint64_t)v16, 0x10000, 1);
            sub_100007DAC((uint64_t)v16, 1, 1);
            sub_100017E38((uint64_t)v16, 1, 1);
            v18 = sub_100007DF8((uint64_t)v16);
            sub_10000D274(v16, v18, (void (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))sub_100014CFC, (uint64_t)v16);
          }
        }
      }
      v3 = 0;
LABEL_23:
      ++v14;
    }
    while (v14 != v13);
  }
  v37 = CFArrayGetCount((CFArrayRef)qword_1000252F8);
  if (v37)
  {
    v38 = v37;
    v39 = CFSetCreateMutable(kCFAllocatorDefault, 0, &kCFTypeSetCallBacks);
    if (v39)
    {
      v40 = v39;
      if (v38 >= 1)
      {
        v41 = 0;
        while (1)
        {
          v42 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000252F8, v41);
          if (!v42)
            goto LABEL_100;
          v43 = v42;
          v44 = sub_10000EE24(v42);
          if (!v44)
            break;
          v45 = (const __CFArray *)sub_10000FF08(v43);
          if (!v45)
          {
            if (CFSetContainsValue(v40, v44))
              goto LABEL_95;
LABEL_89:
            if (sub_10000EE30(v43) == 7 && byte_1000251C8)
            {
              sub_100016CB8();
              sub_100017070();
              sub_10001748C();
              byte_1000251C8 = 0;
            }
            if (sub_10000ED14((uint64_t)v43))
            {
              CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_1000252F8, v41);
              --v38;
              --v41;
              goto LABEL_100;
            }
            goto LABEL_94;
          }
          v46 = v45;
          v47 = CFArrayGetCount(v45);
          if (v47 < 1)
          {
            v51 = 0;
          }
          else
          {
            v48 = v47;
            v49 = (const __CFDictionary *)CFArrayGetValueAtIndex(v46, 0);
            v50 = sub_10000EE24(v49);
            if (CFSetContainsValue(v40, v50))
            {
              v51 = 1;
            }
            else
            {
              v52 = 1;
              do
              {
                v53 = v52;
                if (v48 == v52)
                  break;
                v54 = (const __CFDictionary *)CFArrayGetValueAtIndex(v46, v52);
                v55 = sub_10000EE24(v54);
                v56 = CFSetContainsValue(v40, v55);
                v52 = v53 + 1;
              }
              while (!v56);
              v51 = v53 < v48;
            }
          }
          v57 = CFSetContainsValue(v40, v44);
          if (!v51 && !v57)
            goto LABEL_89;
LABEL_94:
          if (v44)
          {
LABEL_95:
            v58 = (const __CFArray *)sub_10000FF08(v43);
            if (v58)
            {
              v59 = v58;
              v60 = CFArrayGetCount(v58);
              if (v60 >= 1)
              {
                v61 = v60;
                for (k = 0; k != v61; ++k)
                {
                  v63 = (const __CFDictionary *)CFArrayGetValueAtIndex(v59, k);
                  v64 = sub_10000EE24(v63);
                  CFSetSetValue(v40, v64);
                }
              }
            }
            CFSetSetValue(v40, v44);
          }
LABEL_100:
          if (++v41 >= v38)
            goto LABEL_101;
        }
        if (v41)
          goto LABEL_101;
        goto LABEL_89;
      }
LABEL_101:
      CFRelease(v40);
    }
  }
  else if (v3)
  {
    byte_1000251C8 = 1;
    if (!byte_100024418)
    {
      sub_100004D80();
      byte_100024418 = 1;
      sub_10001424C();
    }
    sub_10000E434();
    if (qword_100025270)
    {
      v65 = CFArrayGetCount((CFArrayRef)qword_100025288);
      if (v65 >= 1)
      {
        v66 = v65;
        for (m = 0; m != v66; ++m)
        {
          v68 = CFArrayGetValueAtIndex((CFArrayRef)qword_100025288, m);
          if (sub_100007790((uint64_t)v68, CFSTR("DAMediaWhole")) == kCFBooleanTrue
            && !sub_100017C24((uint64_t)v68, 0x10000))
          {
            if (sub_10000D0D0((uint64_t)v68))
              sub_100006380((uint64_t)v68);
            sub_100017E38((uint64_t)v68, 0x10000, 1);
          }
          if (sub_100007790((uint64_t)v68, CFSTR("DAVolumePath")) && !sub_1000078A0((uint64_t)v68, 0x100000))
          {
            if (sub_1000078A0((uint64_t)v68, 2) && sub_1000078A0((uint64_t)v68, 16) && !sub_1000077D4((uint64_t)v68))
              sub_1000063A8((uint64_t)v68);
            sub_100007DAC((uint64_t)v68, 0x100000, 1);
          }
        }
      }
    }
  }
}

uint64_t sub_100014CA4(uint64_t a1)
{
  uint64_t v2;

  sub_100007DAC(a1, 0x40000, 1);
  v2 = sub_10000C0D8(a1, 2);
  if (!(_DWORD)v2)
    v2 = sub_10000E35C(a1, 0, 0, 0, (uint64_t)CFSTR("automatic"));
  return sub_10001439C(v2);
}

void sub_100014CFC(int a1, const void *a2, int a3, const void *a4, const void *a5, const void *a6, void *a7)
{
  const __CFString *v14;
  int v15;
  const void *v16;
  CFBooleanRef v17;
  BOOL v18;
  CFMutableArrayRef Mutable;
  __CFArray *v23;
  const void **v24;
  const void *v25;
  uint64_t v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  const char *v31;
  int v32;
  statfs *v33;
  int v34;
  const char *v35;
  uint64_t v36;
  const void *v37;
  size_t v38;
  CFURLRef v39;
  CFURLRef v40;
  const void *v41;
  const void *v42;
  statfs *v43;
  char __s2[1024];

  sub_100007B94((uint64_t)a7, a2);
  sub_100007DAC((uint64_t)a7, 2, 0);
  sub_100007DAC((uint64_t)a7, 4, 0);
  if (a1)
  {
    v14 = 0;
    v15 = 8;
LABEL_25:
    sub_100007DAC((uint64_t)a7, v15, 1);
    goto LABEL_26;
  }
  v14 = (const __CFString *)sub_1000084B0((uint64_t)a2);
  if (v14 && sub_1000084D4((uint64_t)a2))
  {
    sub_10000A798("staged fsmodule, id = %@, with %@, success.", a7, v14);
    v14 = sub_1000155E8(v14);
  }
  sub_100007DAC((uint64_t)a7, 8, 0);
  v16 = sub_100007790((uint64_t)a7, CFSTR("DAMediaContent"));
  if (v16
    && CFEqual(v16, CFSTR("7C3457EF-0000-11AA-AA11-00306543ECAC"))
    && sub_100007790((uint64_t)a7, CFSTR("DADeviceInternal")) == kCFBooleanFalse)
  {
    sub_100007DAC((uint64_t)a7, 128, 1);
  }
  v17 = (CFBooleanRef)sub_100007790((uint64_t)a7, CFSTR("DAMediaWritable"));
  if (sub_100017C24((uint64_t)a7, 16))
    v18 = a3 <= 63;
  else
    v18 = 1;
  if (v18 && v17 != kCFBooleanFalse && a3 != 0 || kCFBooleanTrue == kCFBooleanFalse)
  {
    v15 = 2;
    goto LABEL_25;
  }
LABEL_26:
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    v23 = Mutable;
    if (v14)
      v24 = (const void **)&kCFBooleanTrue;
    else
      v24 = (const void **)&kCFBooleanFalse;
    v25 = *v24;
    if (sub_1000063D0((uint64_t)a7, CFSTR("DAVolumeMountable"), *v24))
    {
      sub_100007B54((uint64_t)a7, CFSTR("DAVolumeMountable"), v25);
      CFArrayAppendValue(v23, CFSTR("DAVolumeMountable"));
    }
    if (sub_1000063D0((uint64_t)a7, CFSTR("DAVolumeKind"), v14))
    {
      sub_100007B54((uint64_t)a7, CFSTR("DAVolumeKind"), v14);
      CFArrayAppendValue(v23, CFSTR("DAVolumeKind"));
    }
    if (sub_1000063D0((uint64_t)a7, CFSTR("DAVolumeName"), a4))
    {
      sub_100007B54((uint64_t)a7, CFSTR("DAVolumeName"), a4);
      CFArrayAppendValue(v23, CFSTR("DAVolumeName"));
    }
    if (sub_1000063D0((uint64_t)a7, CFSTR("DAVolumeType"), a5))
    {
      sub_100007B54((uint64_t)a7, CFSTR("DAVolumeType"), a5);
      CFArrayAppendValue(v23, CFSTR("DAVolumeType"));
    }
    if (sub_1000063D0((uint64_t)a7, CFSTR("DAVolumeUUID"), a6))
    {
      sub_100007B54((uint64_t)a7, CFSTR("DAVolumeUUID"), a6);
      CFArrayAppendValue(v23, CFSTR("DAVolumeUUID"));
    }
    if (CFArrayGetCount(v23) && sub_1000078A0((uint64_t)a7, 0x80000))
      sub_10000E1D0(a7, v23);
    CFRelease(v23);
  }
  if (!sub_1000078A0((uint64_t)a7, 0x40000))
  {
    v43 = 0;
    v27 = getmntinfo(&v43, 2);
    if (v27 >= 1)
    {
      v28 = 0;
      v29 = 2168 * v27;
      while (1)
      {
        v30 = sub_10000A210((uint64_t)&v43[v28 / 0x878]);
        v31 = (const char *)sub_100007344((uint64_t)a7);
        v32 = strcmp(v30, v31);
        v33 = v43;
        if (!v32)
          break;
        if (!strcmp(v43[v28 / 0x878].f_fstypename, "lifs") && !strncmp(v33[v28 / 0x878].f_mntfromname, "apfs", 4uLL))
        {
          v34 = sub_10000A320((uint64_t)&v33[v28 / 0x878], __s2, 1024);
          v35 = (const char *)sub_100007774((uint64_t)a7, 0);
          if (!v34 && !strcmp(v35, __s2))
          {
            v36 = sub_10000734C(kCFAllocatorDefault, (uint64_t)&v43[v28 / 0x878]);
            if (v36)
            {
              v37 = (const void *)v36;
              sub_10000A798("created disk, id = %@.", v36);
              CFArrayInsertValueAtIndex((CFMutableArrayRef)qword_100025288, 0, v37);
              CFRelease(v37);
            }
            sub_100007DAC((uint64_t)a7, 2, 0);
            sub_100007DAC((uint64_t)a7, 4, 0);
            sub_100007DAC((uint64_t)a7, 0x40000, 1);
          }
        }
        v28 += 2168;
        if (v29 == v28)
          goto LABEL_45;
      }
      v38 = strlen(v43[v28 / 0x878].f_mntonname);
      v39 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v43[v28 / 0x878].f_mntonname, v38, 1u);
      if (v39)
      {
        v40 = v39;
        sub_100007A0C((uint64_t)a7, v39);
        sub_100007B54((uint64_t)a7, CFSTR("DAVolumePath"), v40);
        CFRelease(v40);
      }
      if (!strcmp(v43[v28 / 0x878].f_mntonname, "/"))
      {
        v41 = (const void *)sub_10000C0D0();
        if (v41)
        {
          v42 = v41;
          sub_100007A0C((uint64_t)a7, v41);
          CFRelease(v42);
        }
        sub_100007DAC((uint64_t)a7, 16, 1);
        sub_100007DAC((uint64_t)a7, 32, 1);
      }
      sub_100007DAC((uint64_t)a7, 2, 0);
      sub_100007DAC((uint64_t)a7, 4, 0);
    }
  }
LABEL_45:
  sub_100017E38((uint64_t)a7, 1, 0);
  v26 = sub_100007DAC((uint64_t)a7, 1, 0);
  sub_10001439C(v26);
  CFRelease(a7);
}

uint64_t sub_1000152B4(const __CFDictionary *a1, const __CFDictionary *a2)
{
  signed int v3;
  signed int v4;
  uint64_t v5;

  v3 = sub_100005AE8(a1);
  v4 = sub_100005AE8(a2);
  if (v3 >= v4)
    v5 = 0;
  else
    v5 = -1;
  if (v3 > v4)
    return 1;
  else
    return v5;
}

void sub_1000152EC(uint64_t a1, uint64_t a2)
{
  void *v2;
  const __CFArray *v3;
  const void *ValueAtIndex;
  uint64_t v5;

  v2 = (void *)a2;
  v3 = (const __CFArray *)sub_1000077DC(a2);
  if (CFArrayGetCount(v3))
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v3, 0);
    CFRetain(ValueAtIndex);
    CFArrayRemoveValueAtIndex(v3, 0);
    sub_10000DC20(v2, (const __CFDictionary *)ValueAtIndex, (uint64_t)sub_1000152EC, (uint64_t)v2);
    v2 = (void *)ValueAtIndex;
  }
  else
  {
    sub_100007DAC((uint64_t)v2, 1, 0);
    sub_100007AD4((uint64_t)v2, 0);
    sub_10001439C(v5);
  }
  CFRelease(v2);
}

uint64_t sub_1000155B4()
{
  uint64_t result;

  result = objc_opt_class(FSClient);
  if (result)
    byte_100024419 = 0;
  return result;
}

uint64_t sub_1000155E0()
{
  return 0;
}

CFStringRef sub_1000155E8(const __CFString *a1)
{
  const __CFCharacterSet *v2;
  CFStringRef v3;
  CFRange range;
  CFRange v6;
  CFRange v7;

  range.location = 0;
  range.length = 0;
  v2 = CFCharacterSetCreateWithCharactersInString(kCFAllocatorDefault, CFSTR("_"));
  v6.length = CFStringGetLength(a1);
  v6.location = 0;
  CFStringFindCharacterFromSet(a1, v2, v6, 0, &range);
  v7.length = range.location;
  v7.location = 0;
  v3 = CFStringCreateWithSubstring(kCFAllocatorDefault, a1, v7);
  CFRelease(v2);
  return v3;
}

CFStringRef sub_100015680(const __CFString *a1)
{
  CFStringRef v1;
  CFStringRef v2;

  v1 = sub_1000155E8(a1);
  v2 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("com.apple.fskit.%@"), v1);
  CFRelease(v1);
  return v2;
}

void sub_1000156D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[5];

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(id *)a2;
  *(_QWORD *)(v3 + 16) = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001579C;
  v5[3] = &unk_100021258;
  v5[4] = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  sub_1000158D0(0xFFFFFFFFLL, 0xFFFFFFFFLL, 0, 0, 0, v3);
  free((void *)a2);

}

void sub_10001579C(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v3;
  const void *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  int Count;
  const void **v8;
  uint64_t v9;
  CFDictionaryRef *v10;
  __CFDictionary *MutableCopy;
  __CFDictionary *v12;

  v3 = sub_100008428(kCFAllocatorDefault, a2);
  if (v3)
  {
    v4 = (const void *)v3;
    sub_10000A61C(" created filesystem, id = %@.", v3);
    v5 = (const __CFDictionary *)sub_1000084C4((uint64_t)v4);
    if (v5)
    {
      v6 = v5;
      Count = CFDictionaryGetCount(v5);
      v8 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(v6, 0, v8);
      if (Count >= 1)
      {
        v9 = Count;
        v10 = (CFDictionaryRef *)v8;
        do
        {
          MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, *v10);
          if (MutableCopy)
          {
            v12 = MutableCopy;
            CFDictionarySetValue(MutableCopy, CFSTR("DAFileSystem"), v4);
            CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 16), v12);
            CFRelease(v12);
          }
          ++v10;
          --v9;
        }
        while (v9);
      }
      free(v8);
    }
    CFRelease(v4);
  }
}

void sub_1000158D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  const __CFURL *v10;
  CFStringRef PathComponent;
  BOOL v12;
  uint64_t v13;
  const void *v14;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  const void *v17;
  const __CFDictionary *v18;
  const void *v19;
  io_service_t v20;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const __CFString *v25;
  CFStringRef v26;
  char v27;
  CFStringRef v28;
  BOOLean_t matches;

  v9 = *(_QWORD *)(a6 + 24);
  v10 = (const __CFURL *)sub_1000077EC(v9);
  PathComponent = CFURLCopyLastPathComponent(v10);
  v12 = (sub_100007790(v9, CFSTR("DAMediaRemovable")) != kCFBooleanTrue || sub_100007790(v9, CFSTR("DADeviceInternal")))
     && sub_100007790(v9, CFSTR("DADeviceInternal")) != kCFBooleanTrue;
  v13 = *(_QWORD *)(a6 + 40);
  if (!(_DWORD)a1)
  {
    v21 = sub_1000084B0(v13);
    sub_10000A798("probed disk, id = %@, with %@, success.", *(_QWORD *)(a6 + 24), v21);
LABEL_18:
    if (*(_QWORD *)a6)
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))a6)(a1, *(_QWORD *)(a6 + 40), a2, a3, a4, a5, *(_QWORD *)(a6 + 8));
    v22 = *(const void **)(a6 + 16);
    if (v22)
      CFRelease(v22);
    v23 = *(const void **)(a6 + 24);
    if (v23)
      CFRelease(v23);
    v24 = *(const void **)(a6 + 40);
    if (v24)
      CFRelease(v24);
    free((void *)a6);
    return;
  }
  v27 = v12;
  if (v13)
  {
    v14 = sub_1000084B0(v13);
    sub_10000A798("probed disk, id = %@, with %@, failure.", *(_QWORD *)(a6 + 24), v14);
    if ((_DWORD)a1 != -2)
      sub_10000A748("unable to probe %@ (status code 0x%08X).", *(_QWORD *)(a6 + 24), a1);
    CFRelease(*(CFTypeRef *)(a6 + 40));
    *(_QWORD *)(a6 + 40) = 0;
  }
  v28 = PathComponent;
  if (CFArrayGetCount(*(CFArrayRef *)(a6 + 16)) < 1)
    goto LABEL_18;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a6 + 16), 0);
    Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("DAFileSystem"));
    if (Value)
    {
      v17 = Value;
      v18 = (const __CFDictionary *)CFDictionaryGetValue(ValueAtIndex, CFSTR("FSMediaProperties"));
      v19 = sub_1000084B0((uint64_t)v17);
      CFRetain(v17);
      *(_QWORD *)(a6 + 40) = v17;
      if (v18)
      {
        matches = 0;
        v20 = sub_100007788(v9);
        IOServiceMatchPropertyTable(v20, v18, &matches);
        if (matches)
          break;
      }
    }
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a6 + 16), 0);
    if (CFArrayGetCount(*(CFArrayRef *)(a6 + 16)) <= 0)
      goto LABEL_18;
  }
  if (CFDictionaryGetValue(ValueAtIndex, CFSTR("autodiskmount")) == kCFBooleanFalse)
  {
    sub_100007DAC(v9, 16, 0);
    sub_100007DAC(v9, 32, 0);
  }
  CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a6 + 16), 0);
  sub_10000A798("probed disk, id = %@, with %@, ongoing.", v9, v19);
  v25 = (const __CFString *)sub_1000084B0((uint64_t)v17);
  v26 = sub_100015680(v25);
  sub_100016020(v28, v26, v27, (void (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))sub_1000158D0, a6);
}

uint64_t sub_100015B90(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  int v12;
  _BYTE v13[32];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  NSMutableArray *v19;

  v2 = (void *)objc_opt_new(FSClient);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100015D30;
  v18 = sub_100015D40;
  v19 = objc_opt_new(NSMutableArray);
  v3 = dispatch_group_create();
  v4 = *(_DWORD *)(a1 + 8);
  if (v4)
    v5 = v4;
  else
    v5 = 501;
  v6 = (void *)objc_opt_new(FSAuditToken);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tokenWithRuid:", v5));

  dispatch_group_enter(v3);
  if (v7 && v2)
  {
    objc_msgSend(v7, "audit_token");
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100015D48;
    v9[3] = &unk_1000212A8;
    v11 = &v14;
    v12 = v5;
    v10 = v3;
    objc_msgSend(v2, "installedExtensionsForUser:replyHandler:", v13, v9);

  }
  else
  {
    sub_10000A748("Unable to retrieve FSModules for uid %u: infrastructure issues", v5);
    dispatch_group_leave(v3);
  }
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  *(_QWORD *)a1 = CFRetain((CFTypeRef)v15[5]);

  _Block_object_dispose(&v14, 8);
  return 0;
}

void sub_100015D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015D30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100015D40(uint64_t a1)
{

}

void sub_100015D48(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD v4[5];

  if (a3)
  {
    sub_10000A748("Unable to retrieve FSModules for uid %u: %@", *(unsigned int *)(a1 + 48), a3);
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100015DCC;
    v4[3] = &unk_100021280;
    v4[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(a2, "enumerateObjectsUsingBlock:", v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100015DCC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "attributes"));
  v13 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FSShortName")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_fskit"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FSSupportsBlockResources")));
  if (v5)
    v7 = v13 == 0;
  else
    v7 = 1;
  if (!v7 && objc_msgSend(v6, "BOOLValue"))
  {
    objc_msgSend(v13, "setValue:forKey:", v5, kCFBundleNameKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    objc_msgSend(v13, "setValue:forKey:", v8, CFSTR("FSIsFSModule"));

    objc_msgSend(v13, "setValue:forKey:", &off_1000232E8, CFSTR("FSImplementation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FSMediaTypes")));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FSPersonalities")));
    v11 = (void *)v10;
    if (v9 && v10)
    {
      objc_msgSend(v13, "setValue:forKey:", v9, CFSTR("FSMediaTypes"));
      objc_msgSend(v13, "setValue:forKey:", v11, CFSTR("FSPersonalities"));
      sub_10000A3F0("Found FSModule: %@", v13);
    }
    else
    {
      sub_10000A748("FSModule missing information");

      v13 = 0;
    }

  }
  v12 = v13;
  if (v13)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:");
    v12 = v13;
  }

}

_DWORD *sub_100015FB4(int a1, uint64_t a2)
{
  _DWORD *result;

  result = malloc_type_malloc(0x18uLL, 0x10E0040F5622EBCuLL);
  if (result)
  {
    *(_QWORD *)result = 0;
    result[2] = a1;
    *((_QWORD *)result + 2) = a2;
    return (_DWORD *)sub_100018150((uint64_t)sub_100015B90, (uint64_t)result, (uint64_t (*)(uint64_t, uint64_t))sub_1000156D8, (uint64_t)result);
  }
  return result;
}

void sub_100016020(const void *a1, const void *a2, char a3, void (*a4)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;

  if (byte_100024419)
  {
    v9 = 2;
    v10 = 2;
LABEL_3:
    a4(v9, v10, 0, 0, 0, a5);
    CFRelease(a2);
    CFRelease(a1);
    return;
  }
  v12 = malloc_type_malloc(0x40uLL, 0x10E00405BC55978uLL);
  if (!v12)
  {
    v9 = 12;
    v10 = 12;
    goto LABEL_3;
  }
  *v12 = a1;
  v12[1] = a2;
  *((_BYTE *)v12 + 16) = a3;
  *(_QWORD *)((char *)v12 + 20) = 0;
  *(_QWORD *)((char *)v12 + 36) = 0;
  *(_QWORD *)((char *)v12 + 28) = 0;
  *((_DWORD *)v12 + 11) = 0;
  v12[6] = a4;
  v12[7] = a5;
  sub_100018150((uint64_t)sub_100016104, (uint64_t)v12, (uint64_t (*)(uint64_t, uint64_t))sub_1000164DC, (uint64_t)v12);
}

uint64_t sub_100016104(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  FSDATaskMessage *v14;
  FSDATaskMessage *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *group;
  void *v23;
  _QWORD v24[4];
  FSDATaskMessage *v25;
  NSObject *v26;
  _QWORD *v27;
  uint64_t *v28;
  _OWORD v29[2];
  _QWORD v30[4];
  NSObject *v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  _OWORD v36[2];
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;

  v2 = *a1;
  v3 = a1[1];
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v4 = dispatch_group_create();
  group = dispatch_group_create();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = sub_100015D30;
  v37[4] = sub_100015D40;
  v38 = 0;
  v23 = (void *)objc_opt_new(FSClient);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource proxyResourceForBSDName:](FSBlockDeviceResource, "proxyResourceForBSDName:", v2));
  v6 = (void *)objc_opt_new(FSAuditToken);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tokenWithRuid:", 501));

  dispatch_group_enter(v4);
  if (v7)
    objc_msgSend(v7, "audit_token");
  else
    memset(v36, 0, sizeof(v36));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10001654C;
  v30[3] = &unk_1000212D0;
  v33 = &v39;
  v34 = a1;
  v8 = v4;
  v31 = v8;
  v9 = v5;
  v32 = v9;
  v35 = v3;
  objc_msgSend(v23, "probeResource:usingBundle:auditToken:replyHandler:", v9, v3, v36, v30);
  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v10 = *((unsigned int *)v40 + 6);
  if ((_DWORD)v10)
    goto LABEL_5;
  if (!*((_BYTE *)a1 + 16))
  {
    v10 = 0;
LABEL_5:
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_14;
  }
  v15 = objc_opt_new(FSDATaskMessage);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FSMessageReceiver receiverWithDelegate:](FSMessageReceiver, "receiverWithDelegate:", v15));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getConnection"));
  v11 = (void *)objc_opt_new(FSTaskOptionsBundle);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOption optionWithoutValue:](FSTaskOption, "optionWithoutValue:", CFSTR("q")));
  objc_msgSend(v11, "addOption:", v16);

  dispatch_group_enter(group);
  -[FSDATaskMessage setDispatch_group:](v15, "setDispatch_group:", group);
  dispatch_group_enter(group);
  if (v7)
    objc_msgSend(v7, "audit_token");
  else
    memset(v29, 0, sizeof(v29));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100016788;
  v24[3] = &unk_100021338;
  v28 = a1;
  v14 = v15;
  v25 = v14;
  v27 = v37;
  v17 = group;
  v26 = v17;
  objc_msgSend(v23, "checkResource:usingBundle:options:auditToken:connection:replyHandler:", v9, v3, v11, v29, v13, v24);
  dispatch_group_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FSDATaskMessage exitError](v14, "exitError"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FSDATaskMessage exitError](v14, "exitError"));
    *((_DWORD *)a1 + 5) = objc_msgSend(v19, "code");

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FSDATaskMessage exitError](v14, "exitError"));
  sub_10000A798("FSKit check of resource %@ exited with error %@ %d", v9, v20, *((unsigned int *)a1 + 5));

  v10 = *((unsigned int *)v40 + 6);
LABEL_14:

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v39, 8);

  return v10;
}

void sub_1000164B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1000164DC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const void *v4;
  const void *v5;
  const void *v6;

  v3 = *(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a2 + 48);
  if (v3)
    v3(a1, *(unsigned int *)(a2 + 20), *(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32), *(_QWORD *)(a2 + 40), *(_QWORD *)(a2 + 56));
  CFRelease(*(CFTypeRef *)(a2 + 8));
  CFRelease(*(CFTypeRef *)a2);
  v4 = *(const void **)(a2 + 24);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a2 + 32);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a2 + 40);
  if (v6)
    CFRelease(v6);
  free((void *)a2);
}

void sub_10001654C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unsigned int v6;
  id v7;
  int v8;
  int v9;
  __CFString *v10;
  const __CFArray *v11;
  __CFString *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;

  v23 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = objc_msgSend(v5, "code");
  }
  else
  {
    v6 = 5;
    if (v23)
    {
      v7 = objc_msgSend(v23, "result");
      if (v7)
        v8 = 5;
      else
        v8 = 2;
      if (v7 == (id)3)
        v6 = 0;
      else
        v6 = v8;
    }
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
  v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v9)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 56) + 20) = v9;
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    goto LABEL_25;
  }
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "devicePath"));
  v11 = _FSCopyNameForVolumeFormatAtNode(v10);

  if (v11)
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 32) = v11;
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));
    v14 = objc_msgSend(v13, "hasPrefix:", &stru_100022D20);

    if ((v14 & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "name"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", &stru_100022D20));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16));

      if (v12)
      {
        v17 = -[__CFString length](v12, "length");
        v18 = v12;
        if (v17)
          goto LABEL_22;
      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 64), "hasSuffix:", CFSTR("msdos")))
    v18 = CFSTR("NO NAME");
  else
    v18 = CFSTR("Untitled");
LABEL_22:
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 24) = CFRetain(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "containerID"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "containerID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uuid"));
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "description"));
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 40) = CFUUIDCreateFromString(kCFAllocatorDefault, v22);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

LABEL_25:
}

void sub_100016788(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v8 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 56) + 20) = objc_msgSend(v6, "code");
    sub_10000A798("check resource handler called with error %@", v7, v8);
    objc_msgSend(*(id *)(a1 + 32), "completed:replyHandler:", v7, &stru_100021310);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 56) + 20) = 0;
    sub_10000A798("check resource handler called with error %@", 0, v8);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void sub_100016848(const void *a1, const void *a2, void (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  _QWORD *v8;

  v8 = malloc_type_malloc(0x20uLL, 0xE0040ED91EDF5uLL);
  if (v8)
  {
    *v8 = a1;
    v8[1] = a2;
    v8[2] = a3;
    v8[3] = a4;
    sub_100018150((uint64_t)sub_1000168DC, (uint64_t)v8, (uint64_t (*)(uint64_t, uint64_t))sub_100016BCC, (uint64_t)v8);
  }
  else
  {
    a3(12, a4);
    CFRelease(a2);
    CFRelease(a1);
  }
}

uint64_t sub_1000168DC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  FSDATaskMessage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FSDATaskMessage *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *);
  void *v24;
  FSDATaskMessage *v25;
  NSObject *v26;
  uint64_t *v27;
  _QWORD *v28;
  _OWORD v29[2];
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;

  v1 = *a1;
  v2 = a1[1];
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v3 = dispatch_group_create();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100015D30;
  v30[4] = sub_100015D40;
  v31 = 0;
  v4 = (void *)objc_opt_new(FSClient);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FSBlockDeviceResource proxyResourceForBSDName:writable:](FSBlockDeviceResource, "proxyResourceForBSDName:writable:", v1, 1));
  v6 = objc_opt_new(FSDATaskMessage);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FSMessageReceiver receiverWithDelegate:](FSMessageReceiver, "receiverWithDelegate:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getConnection"));
  v9 = (void *)objc_opt_new(FSTaskOptionsBundle);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[FSTaskOption optionWithoutValue:](FSTaskOption, "optionWithoutValue:", CFSTR("y")));
  objc_msgSend(v9, "addOption:", v10);

  v11 = (void *)objc_opt_new(FSAuditToken);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tokenWithRuid:", 501));

  dispatch_group_enter(v3);
  -[FSDATaskMessage setDispatch_group:](v6, "setDispatch_group:", v3);
  dispatch_group_enter(v3);
  if (v12)
    objc_msgSend(v12, "audit_token");
  else
    memset(v29, 0, sizeof(v29));
  v21 = _NSConcreteStackBlock;
  v22 = 3221225472;
  v23 = sub_100016C0C;
  v24 = &unk_100021380;
  v27 = &v32;
  v13 = v6;
  v25 = v13;
  v28 = v30;
  v14 = v3;
  v26 = v14;
  objc_msgSend(v4, "checkResource:usingBundle:options:auditToken:connection:replyHandler:", v5, v2, v9, v29, v8, &v21);
  dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FSDATaskMessage exitError](v13, "exitError"));
  sub_10000A798("FSKit check of resource %@ exited with error %@", v5, v15, v21, v22, v23, v24);

  if (!*((_DWORD *)v33 + 6))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FSDATaskMessage exitError](v13, "exitError"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[FSDATaskMessage exitError](v13, "exitError"));
      v18 = objc_msgSend(v17, "code");
      *((_DWORD *)v33 + 6) = v18;

    }
  }
  v19 = *((unsigned int *)v33 + 6);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

void sub_100016BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_100016BCC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t, _QWORD);

  v3 = *(void (**)(uint64_t, _QWORD))(a2 + 16);
  if (v3)
    v3(a1, *(_QWORD *)(a2 + 24));
  CFRelease(*(CFTypeRef *)(a2 + 8));
  CFRelease(*(CFTypeRef *)a2);
  free((void *)a2);
}

void sub_100016C0C(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  sub_10000A798("check resource handler called with error %@", v6);
  if (v6)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "code");
    objc_msgSend(*(id *)(a1 + 32), "completed:replyHandler:", v6, &stru_100021358);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void sub_100016CB8()
{
  uint64_t tv_nsec;
  __CFArray *v1;
  stat v2;
  stat v3;
  CFRange v4;

  memset(&v3, 0, sizeof(v3));
  memset(&v2, 0, sizeof(v2));
  if (stat("/System/Library/Filesystems", &v3))
  {
    qword_1000251D0 = 0;
    qword_1000251D8 = 0;
  }
  if (stat("/Library/Filesystems", &v2))
    xmmword_1000251E0 = 0uLL;
  if (qword_1000251D0 != v3.st_mtimespec.tv_sec)
  {
    tv_nsec = v3.st_mtimespec.tv_nsec;
    goto LABEL_12;
  }
  tv_nsec = v3.st_mtimespec.tv_nsec;
  if (qword_1000251D8 != v3.st_mtimespec.tv_nsec)
    goto LABEL_12;
  if ((_QWORD)xmmword_1000251E0 != v2.st_mtimespec.tv_sec)
  {
    tv_nsec = qword_1000251D8;
    goto LABEL_12;
  }
  tv_nsec = qword_1000251D8;
  if (*((_QWORD *)&xmmword_1000251E0 + 1) != v2.st_mtimespec.tv_nsec)
  {
LABEL_12:
    qword_1000251D0 = v3.st_mtimespec.tv_sec;
    qword_1000251D8 = tv_nsec;
    xmmword_1000251E0 = (__int128)v2.st_mtimespec;
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_100025298);
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_1000252A0);
    sub_100016E18("/System/Library/Filesystems");
    sub_100016E18("/Library/Filesystems");
    v1 = (__CFArray *)qword_1000252A0;
    v4.length = CFArrayGetCount((CFArrayRef)qword_1000252A0);
    v4.location = 0;
    CFArraySortValues(v1, v4, (CFComparatorFunction)sub_100016FFC, 0);
  }
}

void sub_100016E18(const char *a1)
{
  size_t v2;
  CFURLRef v3;
  const __CFURL *v4;
  DIR *v5;
  DIR *v6;
  dirent *i;
  const char *d_name;
  const char *v9;
  size_t v10;
  const __CFURL *v11;
  const __CFURL *v12;
  uint64_t v13;
  void *v14;
  const __CFDictionary *v15;

  v2 = strlen(a1);
  v3 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)a1, v2, 1u);
  if (v3)
  {
    v4 = v3;
    v5 = opendir(a1);
    if (v5)
    {
      v6 = v5;
      sub_10000A6B4("filesystems have been refreshed.");
      for (i = readdir(v6); i; i = readdir(v6))
      {
        d_name = i->d_name;
        v9 = (char *)&i->d_namlen + strlen(i->d_name);
        if (v9 > d_name && !strcmp(v9, ".fs"))
        {
          if (!byte_100024419
            && _os_feature_enabled_impl("FSKit", "msdosUseFSKitModule")
            && !strcmp(d_name, "msdos.fs"))
          {
            sub_10000A798("Skipping msdos.fs as msdosUseFSKitModule pref is on");
          }
          else
          {
            v10 = strlen(d_name);
            v11 = CFURLCreateFromFileSystemRepresentationRelativeToBase(kCFAllocatorDefault, (const UInt8 *)d_name, v10, 1u, v4);
            if (v11)
            {
              v12 = v11;
              v13 = sub_100008348((uint64_t)kCFAllocatorDefault, v11);
              if (v13)
              {
                v14 = (void *)v13;
                sub_10000A61C("  created filesystem, id = %@.", v13);
                CFArrayAppendValue((CFMutableArrayRef)qword_100025298, v14);
                v15 = (const __CFDictionary *)sub_1000084C4((uint64_t)v14);
                if (v15)
                  CFDictionaryApplyFunction(v15, (CFDictionaryApplierFunction)sub_100017F08, v14);
                CFRelease(v14);
              }
              CFRelease(v12);
            }
          }
        }
      }
      closedir(v6);
    }
    CFRelease(v4);
  }
}

CFComparisonResult sub_100016FFC(const __CFDictionary *a1, const __CFDictionary *a2)
{
  const __CFNumber *Value;
  const __CFNumber *v4;

  Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("FSProbeOrder"));
  v4 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("FSProbeOrder"));
  if (!Value)
    return 1;
  if (v4)
    return CFNumberCompare(Value, v4, 0);
  return -1;
}

uint64_t sub_100017070()
{
  uint64_t result;
  uint64_t v1;
  uint64_t tv_nsec;
  uint64_t *v3;
  uint64_t *v4;
  CFStringRef v5;
  const __CFString *v6;
  const char *v7;
  void *v8;
  const void *v9;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v11;
  CFMutableStringRef v12;
  __CFString *v13;
  char *v14;
  char *v15;
  CFBooleanRef v16;
  const __CFBoolean *v17;
  const char *v18;
  size_t v19;
  CFURLRef v20;
  CFURLRef v21;
  const char *v22;
  CFStringRef v23;
  CFStringRef v24;
  const void *v25;
  stat v26;
  char *v27;
  char *__stringp;

  memset(&v26, 0, sizeof(v26));
  result = stat("/etc/fstab", &v26);
  if ((_DWORD)result)
  {
    v1 = 0;
    qword_1000251F0 = 0;
    qword_1000251F8 = 0;
  }
  else
  {
    v1 = qword_1000251F0;
  }
  if (v1 != v26.st_mtimespec.tv_sec)
  {
    tv_nsec = v26.st_mtimespec.tv_nsec;
    goto LABEL_8;
  }
  tv_nsec = v26.st_mtimespec.tv_nsec;
  if (qword_1000251F8 != v26.st_mtimespec.tv_nsec)
  {
LABEL_8:
    qword_1000251F0 = v26.st_mtimespec.tv_sec;
    qword_1000251F8 = tv_nsec;
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_1000252C0);
    result = sub_1000043F4();
    if (!(_DWORD)result)
      return result;
    v3 = sub_1000043B4();
    if (!v3)
      return sub_100004904();
    v4 = v3;
    while (1)
    {
      if (!strcmp((const char *)v4[4], "sw"))
        goto LABEL_44;
      __stringp = (char *)*v4;
      strsep(&__stringp, "=");
      if (!__stringp)
        goto LABEL_44;
      v5 = CFStringCreateWithCString(kCFAllocatorDefault, __stringp, 0x8000100u);
      if (!v5)
        goto LABEL_44;
      v6 = v5;
      v7 = (const char *)*v4;
      if (!strcmp((const char *)*v4, "UUID"))
        break;
      if (!strcmp(v7, "LABEL"))
      {
        v8 = (void *)CFRetain(v6);
LABEL_20:
        v9 = v8;
        if (v8)
        {
          Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (Mutable)
          {
            v11 = Mutable;
            v12 = CFStringCreateMutable(kCFAllocatorDefault, 0);
            if (v12)
            {
              v13 = v12;
              v27 = (char *)v4[3];
              v14 = strsep(&v27, ",");
              if (v14)
              {
                v15 = v14;
                v16 = 0;
                do
                {
                  v17 = v16;
                  v16 = kCFBooleanTrue;
                  if (strcmp(v15, "auto"))
                  {
                    v16 = kCFBooleanFalse;
                    if (strcmp(v15, "noauto"))
                    {
                      CFStringAppendCString(v13, v15, 0x8000100u);
                      CFStringAppendCString(v13, ",", 0x8000100u);
                      v16 = v17;
                    }
                  }
                  v15 = strsep(&v27, ",");
                }
                while (v15);
                if (v16)
                  CFDictionarySetValue(v11, CFSTR("DAMountAutomatic"), v16);
              }
              if (CFStringGetLength(v13))
              {
                CFStringTrim(v13, CFSTR(","));
                CFDictionarySetValue(v11, CFSTR("DAMountOptions"), v13);
              }
              CFRelease(v13);
            }
            v18 = (const char *)v4[1];
            if (strcmp(v18, "none"))
            {
              v19 = strlen(v18);
              v20 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v18, v19, 1u);
              if (v20)
              {
                v21 = v20;
                CFDictionarySetValue(v11, CFSTR("DAMountPath"), v20);
                CFRelease(v21);
              }
            }
            v22 = (const char *)v4[2];
            if (strcmp(v22, "auto"))
            {
              v23 = CFStringCreateWithCString(kCFAllocatorDefault, v22, 0x8000100u);
              if (v23)
              {
                v24 = v23;
                CFDictionarySetValue(v11, CFSTR("DAProbeKind"), v23);
                CFRelease(v24);
              }
            }
            CFDictionarySetValue(v11, CFSTR("DAProbeID"), v9);
            CFRelease(v9);
            CFRelease(v6);
            CFArrayAppendValue((CFMutableArrayRef)qword_1000252C0, v11);
            v25 = v11;
          }
          else
          {
            CFRelease(v9);
            v25 = v6;
          }
          CFRelease(v25);
          goto LABEL_44;
        }
        goto LABEL_41;
      }
      if (!strcmp(v7, "DEVICE"))
      {
        v8 = (void *)sub_100005194((uint64_t)kCFAllocatorDefault, v6);
        goto LABEL_20;
      }
LABEL_41:
      CFRelease(v6);
LABEL_44:
      v4 = sub_1000043B4();
      if (!v4)
        return sub_100004904();
    }
    v8 = sub_100005608(kCFAllocatorDefault, v6);
    goto LABEL_20;
  }
  return result;
}

uint64_t sub_10001748C()
{
  uint64_t result;
  uint64_t v1;
  uint64_t tv_nsec;
  uint64_t *v3;
  uint64_t *v4;
  const __CFString *v5;
  __CFString *v6;
  CFUUIDRef v7;
  CFUUIDRef v8;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v10;
  __CFString *v11;
  __CFString *v12;
  const __CFString *v13;
  stat v14;

  memset(&v14, 0, sizeof(v14));
  result = stat("/var/db/volinfo.database", &v14);
  if ((_DWORD)result)
  {
    v1 = 0;
    qword_100025200 = 0;
    qword_100025208 = 0;
  }
  else
  {
    v1 = qword_100025200;
  }
  if (v1 != v14.st_mtimespec.tv_sec)
  {
    tv_nsec = v14.st_mtimespec.tv_nsec;
    goto LABEL_8;
  }
  tv_nsec = v14.st_mtimespec.tv_nsec;
  if (qword_100025208 != v14.st_mtimespec.tv_nsec)
  {
LABEL_8:
    qword_100025200 = v14.st_mtimespec.tv_sec;
    qword_100025208 = tv_nsec;
    CFArrayRemoveAllValues((CFMutableArrayRef)qword_1000252C8);
    result = sub_1000049EC();
    if (!(_DWORD)result)
      return result;
    v3 = sub_1000049AC();
    if (!v3)
      return sub_100004A8C();
    v4 = v3;
    while (1)
    {
      v5 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)*v4, 0x8000100u);
      if (v5)
        break;
LABEL_25:
      v4 = sub_1000049AC();
      if (!v4)
        return sub_100004A8C();
    }
    v6 = (__CFString *)v5;
    v7 = sub_100008230(kCFAllocatorDefault, v5);
    if (v7)
    {
      v8 = v7;
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        v10 = Mutable;
        v11 = CFStringCreateMutable(kCFAllocatorDefault, 0);
        if (v11)
        {
          v12 = v11;
          if ((v4[1] & 1) != 0)
            v13 = CFSTR("owners");
          else
            v13 = CFSTR("noowners");
          CFStringAppend(v11, v13);
          CFStringAppend(v12, CFSTR(","));
          if (CFStringGetLength(v12))
          {
            CFStringTrim(v12, CFSTR(","));
            CFDictionarySetValue(v10, CFSTR("DAMountOptions"), v12);
          }
          CFRelease(v12);
        }
        CFDictionarySetValue(v10, CFSTR("DAProbeID"), v8);
        CFRelease(v8);
        CFRelease(v6);
        CFArrayAppendValue((CFMutableArrayRef)qword_1000252C8, v10);
        goto LABEL_24;
      }
      CFRelease(v8);
    }
    v10 = (__CFDictionary *)v6;
LABEL_24:
    CFRelease(v10);
    goto LABEL_25;
  }
  return result;
}

void sub_1000176A0()
{
  uint64_t tv_nsec;
  const __SCPreferences *v1;
  const __SCPreferences *v2;
  const __CFBoolean *Value;
  CFBooleanRef v4;
  CFBooleanRef v5;
  const __SCPreferences *v6;
  const __SCPreferences *v7;
  CFPropertyListRef v8;
  const void *v9;
  CFTypeID v10;
  CFPropertyListRef v11;
  const void *v12;
  CFTypeID v13;
  CFPropertyListRef v14;
  const void *v15;
  CFTypeID v16;
  CFPropertyListRef v17;
  const void *v18;
  CFTypeID v19;
  CFPropertyListRef v20;
  const void *v21;
  CFTypeID v22;
  CFPropertyListRef v23;
  const void *v24;
  CFTypeID v25;
  CFPropertyListRef v26;
  const void *v27;
  CFTypeID v28;
  CFPropertyListRef v29;
  const void *v30;
  CFTypeID v31;
  CFPropertyListRef v32;
  const void *v33;
  CFTypeID v34;
  CFPropertyListRef v35;
  const void *v36;
  CFTypeID v37;
  CFPropertyListRef v38;
  const void *v39;
  CFTypeID v40;
  CFPropertyListRef v41;
  const void *v42;
  CFTypeID v43;
  CFPropertyListRef v44;
  const void *v45;
  CFTypeID v46;
  CFPropertyListRef v47;
  const void *v48;
  CFTypeID v49;
  stat v50;
  stat v51;

  memset(&v51, 0, sizeof(v51));
  memset(&v50, 0, sizeof(v50));
  if (stat("/Library/Preferences/SystemConfiguration/autodiskmount.plist", &v51))
  {
    qword_100025210 = 0;
    qword_100025218 = 0;
  }
  if (stat("/Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist", &v50))
    xmmword_100025220 = 0uLL;
  if (qword_100025210 == v51.st_mtimespec.tv_sec)
  {
    tv_nsec = v51.st_mtimespec.tv_nsec;
    if (qword_100025218 == v51.st_mtimespec.tv_nsec)
    {
      if ((_QWORD)xmmword_100025220 == v50.st_mtimespec.tv_sec)
      {
        tv_nsec = qword_100025218;
        if (*((_QWORD *)&xmmword_100025220 + 1) == v50.st_mtimespec.tv_nsec)
          return;
      }
      else
      {
        tv_nsec = qword_100025218;
      }
    }
  }
  else
  {
    tv_nsec = v51.st_mtimespec.tv_nsec;
  }
  qword_100025210 = v51.st_mtimespec.tv_sec;
  qword_100025218 = tv_nsec;
  xmmword_100025220 = (__int128)v50.st_mtimespec;
  CFDictionaryRemoveAllValues((CFMutableDictionaryRef)qword_1000252D0);
  v1 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("autodiskmount"), CFSTR("autodiskmount.plist"));
  if (v1)
  {
    v2 = v1;
    Value = (const __CFBoolean *)SCPreferencesGetValue(v1, CFSTR("AutomountDisksWithoutUserLogin"));
    v4 = Value;
    v5 = kCFBooleanTrue;
    if (Value == kCFBooleanTrue)
    {
      v5 = kCFBooleanFalse;
      CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAMountDeferExternal"), kCFBooleanFalse);
    }
    else
    {
      if (Value != kCFBooleanFalse)
      {
LABEL_18:
        CFRelease(v2);
        goto LABEL_19;
      }
      CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAMountDeferExternal"), Value);
      v4 = kCFBooleanTrue;
    }
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAMountDeferRemovable"), v5);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAMountTrustExternal"), v4);
    goto LABEL_18;
  }
LABEL_19:
  v6 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("com.apple.DiskArbitration.diskarbitrationd"), CFSTR("com.apple.DiskArbitration.diskarbitrationd.plist"));
  if (v6)
  {
    v7 = v6;
    v8 = SCPreferencesGetValue(v6, CFSTR("DAMountDeferExternal"));
    if (v8)
    {
      v9 = v8;
      v10 = CFGetTypeID(v8);
      if (v10 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAMountDeferExternal"), v9);
    }
    v11 = SCPreferencesGetValue(v7, CFSTR("DAMountDeferInternal"));
    if (v11)
    {
      v12 = v11;
      v13 = CFGetTypeID(v11);
      if (v13 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAMountDeferInternal"), v12);
    }
    v14 = SCPreferencesGetValue(v7, CFSTR("DAMountDeferRemovable"));
    if (v14)
    {
      v15 = v14;
      v16 = CFGetTypeID(v14);
      if (v16 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAMountDeferRemovable"), v15);
    }
    v17 = SCPreferencesGetValue(v7, CFSTR("DAMountTrustExternal"));
    if (v17)
    {
      v18 = v17;
      v19 = CFGetTypeID(v17);
      if (v19 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAMountTrustExternal"), v18);
    }
    v20 = SCPreferencesGetValue(v7, CFSTR("DAMountTrustInternal"));
    if (v20)
    {
      v21 = v20;
      v22 = CFGetTypeID(v20);
      if (v22 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAMountTrustInternal"), v21);
    }
    v23 = SCPreferencesGetValue(v7, CFSTR("DAMountTrustRemovable"));
    if (v23)
    {
      v24 = v23;
      v25 = CFGetTypeID(v23);
      if (v25 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAMountTrustRemovable"), v24);
    }
    v26 = SCPreferencesGetValue(v7, CFSTR("DAAutoMountDisable"));
    if (v26)
    {
      v27 = v26;
      v28 = CFGetTypeID(v26);
      if (v28 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAAutoMountDisable"), v27);
    }
    v29 = SCPreferencesGetValue(v7, CFSTR("DAEnableUserFSMountExternal"));
    if (v29)
    {
      v30 = v29;
      v31 = CFGetTypeID(v29);
      if (v31 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAEnableUserFSMountExternal"), v30);
    }
    v32 = SCPreferencesGetValue(v7, CFSTR("DAEnableUserFSMountInternal"));
    if (v32)
    {
      v33 = v32;
      v34 = CFGetTypeID(v32);
      if (v34 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAEnableUserFSMountInternal"), v33);
    }
    v35 = SCPreferencesGetValue(v7, CFSTR("DAEnableUserFSMountRemovable"));
    if (v35)
    {
      v36 = v35;
      v37 = CFGetTypeID(v35);
      if (v37 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAEnableUserFSMountRemovable"), v36);
    }
    v38 = SCPreferencesGetValue(v7, CFSTR("DAMountMethod"));
    if (v38)
    {
      v39 = v38;
      v40 = CFGetTypeID(v38);
      if (v40 == CFStringGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DAMountMethod"), v39);
    }
    v41 = SCPreferencesGetValue(v7, CFSTR("DADisableEjectNotification"));
    if (v41)
    {
      v42 = v41;
      v43 = CFGetTypeID(v41);
      if (v43 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DADisableEjectNotification"), v42);
    }
    v44 = SCPreferencesGetValue(v7, CFSTR("DADisableUnreadableNotification"));
    if (v44)
    {
      v45 = v44;
      v46 = CFGetTypeID(v44);
      if (v46 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DADisableUnreadableNotification"), v45);
    }
    v47 = SCPreferencesGetValue(v7, CFSTR("DADisableUnrepairableNotification"));
    if (v47)
    {
      v48 = v47;
      v49 = CFGetTypeID(v47);
      if (v49 == CFBooleanGetTypeID())
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000252D0, CFSTR("DADisableUnrepairableNotification"), v48);
    }
    CFRelease(v7);
  }
}

void *sub_100017C24(uint64_t a1, int a2)
{
  void *result;

  result = (void *)sub_100007790(a1, CFSTR("DAMediaBSDUnit"));
  if (result)
  {
    result = (void *)CFDictionaryGetValue((CFDictionaryRef)qword_100025310, result);
    if (result)
      return (void *)((*(_DWORD *)CFDataGetMutableBytePtr((CFMutableDataRef)result) & a2) != 0);
  }
  return result;
}

uint64_t sub_100017C7C(uint64_t a1, int a2)
{
  uint64_t result;
  char v5;
  IOOptionBits v6;
  char v7;
  io_object_t v8;
  io_object_t v9;
  io_object_t v10;
  CFTypeRef CFProperty;
  const void *v12;
  __CFData *Value;
  char IsValid;
  char v15;
  io_registry_entry_t entry;
  io_iterator_t iterator;

  if (sub_100017C24(a1, a2))
    return 1;
  result = sub_100007788(a1);
  entry = result;
  if ((_DWORD)result)
  {
    v5 = 0;
    v6 = 3;
    v7 = 1;
    do
    {
      v15 = v7;
      do
      {
        iterator = 0;
        IORegistryEntryCreateIterator(entry, "IOService", v6, &iterator);
        if (!iterator)
          break;
        v8 = IOIteratorNext(iterator);
        if (v8)
          IOObjectRelease(v8);
        v9 = IOIteratorNext(iterator);
        if (v9)
        {
          v10 = v9;
          do
          {
            if (IOObjectConformsTo(v10, "IOMedia"))
            {
              CFProperty = IORegistryEntryCreateCFProperty(v10, CFSTR("BSD Unit"), kCFAllocatorDefault, 0);
              if (CFProperty)
              {
                v12 = CFProperty;
                Value = (__CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_100025310, CFProperty);
                if (Value && (*(_DWORD *)CFDataGetMutableBytePtr(Value) & a2) != 0)
                {
                  CFRelease(v12);
                  IOObjectRelease(v10);
                  IOObjectRelease(iterator);
                  return 1;
                }
                CFRelease(v12);
              }
            }
            else if ((v5 & 1) == 0 && IOObjectConformsTo(v10, "IOBlockStorageDevice"))
            {
              IORegistryIteratorExitEntry(iterator);
            }
            IOObjectRelease(v10);
            v10 = IOIteratorNext(iterator);
          }
          while (v10);
        }
        IsValid = IOIteratorIsValid(iterator);
        IOObjectRelease(iterator);
      }
      while (!IsValid);
      v7 = 0;
      result = 0;
      v5 = 1;
      v6 = 1;
    }
    while ((v15 & 1) != 0);
  }
  return result;
}

void sub_100017E38(uint64_t a1, int a2, int a3)
{
  const void *v5;
  const void *v6;
  __CFData *Value;
  UInt8 *MutableBytePtr;
  int v9;
  __CFData *Mutable;
  __CFData *v11;
  UInt8 *v12;
  int v13;

  v5 = sub_100007790(a1, CFSTR("DAMediaBSDUnit"));
  if (v5)
  {
    v6 = v5;
    Value = (__CFData *)CFDictionaryGetValue((CFDictionaryRef)qword_100025310, v5);
    if (Value)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(Value);
      if (a3)
        v9 = a2;
      else
        v9 = 0;
      *(_DWORD *)MutableBytePtr = *(_DWORD *)MutableBytePtr & ~a2 | v9;
    }
    else
    {
      Mutable = CFDataCreateMutable(kCFAllocatorDefault, 4);
      if (Mutable)
      {
        v11 = Mutable;
        v12 = CFDataGetMutableBytePtr(Mutable);
        if (a3)
          v13 = a2;
        else
          v13 = 0;
        *(_DWORD *)v12 = v13;
        CFDictionarySetValue((CFMutableDictionaryRef)qword_100025310, v6, v11);
        CFRelease(v11);
      }
    }
  }
}

void sub_100017F08(int a1, CFDictionaryRef theDict, const void *a3)
{
  __CFDictionary *MutableCopy;
  __CFDictionary *v5;

  MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, theDict);
  if (MutableCopy)
  {
    v5 = MutableCopy;
    CFDictionarySetValue(MutableCopy, CFSTR("DAFileSystem"), a3);
    CFArrayAppendValue((CFMutableArrayRef)qword_1000252A0, v5);
    CFRelease(v5);
  }
}

uint64_t sub_100017F78()
{
  uint64_t v0;
  integer_t port_info;

  if (dword_100025230)
    goto LABEL_6;
  if (!mach_port_allocate(mach_task_self_, 1u, (mach_port_name_t *)&dword_100025230)
    && !mach_port_insert_right(mach_task_self_, dword_100025230, dword_100025230, 0x14u))
  {
    port_info = 1;
    mach_port_set_attributes(mach_task_self_, dword_100025230, 1, &port_info, 1u);
  }
  if (dword_100025230)
  {
LABEL_6:
    v0 = sub_100013AFC();
    qword_100025238 = dispatch_mach_create_f("diskarbitrationd/thread", v0, 0, sub_100018048);
    dispatch_mach_connect(qword_100025238, dword_100025230, dword_100025230, 0);
  }
  return qword_100025238;
}

void sub_100018048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_msg_header_t *msg;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  void (*v8)(_QWORD, _QWORD);

  if (a2 == 2)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0);
    pthread_mutex_lock(&stru_100024480);
    v4 = qword_100025240;
    if (qword_100025240)
    {
      v5 = 0;
      do
      {
        while (1)
        {
          v6 = v4;
          if (*(_DWORD *)v4 != 1)
            sub_10001B32C();
          if (*(_BYTE *)(v4 + 16))
            break;
          v4 = *(_QWORD *)(v4 + 8);
          v5 = v6;
          if (!v4)
            goto LABEL_14;
        }
        if (v5)
          v7 = (uint64_t *)(v5 + 8);
        else
          v7 = &qword_100025240;
        *v7 = *(_QWORD *)(v4 + 8);
        pthread_mutex_unlock(&stru_100024480);
        v8 = *(void (**)(_QWORD, _QWORD))(v6 + 32);
        if (v8)
          v8(*(unsigned int *)(v6 + 20), *(_QWORD *)(v6 + 40));
        free((void *)v6);
        pthread_mutex_lock(&stru_100024480);
        v5 = 0;
        v4 = qword_100025240;
      }
      while (qword_100025240);
    }
LABEL_14:
    pthread_mutex_unlock(&stru_100024480);
    mach_msg_destroy(msg);
  }
}

uint64_t sub_100018150(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  int v8;
  _QWORD *v9;
  uint64_t result;
  pthread_t v11;

  if (!dword_100025230)
    sub_10001B354();
  v11 = 0;
  pthread_mutex_lock(&stru_100024480);
  v8 = pthread_create(&v11, 0, (void *(__cdecl *)(void *))sub_10001823C, 0);
  if (!v8)
  {
    v9 = malloc_type_malloc(0x40uLL, 0x10A0040B699CF8BuLL);
    if (v9)
    {
      *(_DWORD *)v9 = 1;
      v9[1] = qword_100025240;
      *((_BYTE *)v9 + 16) = 0;
      *((_DWORD *)v9 + 5) = 0;
      v9[3] = v11;
      v9[4] = a3;
      v9[5] = a4;
      v9[6] = a1;
      v9[7] = a2;
      qword_100025240 = (uint64_t)v9;
    }
  }
  result = pthread_mutex_unlock(&stru_100024480);
  if (a3)
  {
    if (v8)
      return a3(71, a4);
  }
  return result;
}

uint64_t sub_10001823C()
{
  uint64_t v0;
  _opaque_pthread_t *v1;
  _opaque_pthread_t *v2;
  NSObject *v3;
  _opaque_pthread_t *v4;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;

  pthread_mutex_lock(&stru_100024480);
  v0 = qword_100025240;
  if (qword_100025240)
  {
    while (1)
    {
      if (*(_DWORD *)v0 != 1)
        sub_10001B37C();
      v1 = *(_opaque_pthread_t **)(v0 + 24);
      v2 = pthread_self();
      if (pthread_equal(v1, v2))
        break;
      v0 = *(_QWORD *)(v0 + 8);
      if (!v0)
        goto LABEL_5;
    }
    pthread_mutex_unlock(&stru_100024480);
    *(_DWORD *)(v0 + 20) = (*(uint64_t (**)(_QWORD))(v0 + 48))(*(_QWORD *)(v0 + 56));
    pthread_mutex_lock(&stru_100024480);
    *(_BYTE *)(v0 + 16) = 1;
    pthread_mutex_unlock(&stru_100024480);
    v9 = 0;
    v7 = dword_100025230;
    v8 = 0;
    v6 = 0x1800000013;
    v3 = dispatch_mach_msg_create(&v6, 24, 0, 0);
    dispatch_mach_send(qword_100025238, v3, 0);
    dispatch_release(v3);
  }
  else
  {
LABEL_5:
    pthread_mutex_unlock(&stru_100024480);
  }
  v4 = pthread_self();
  pthread_detach(v4);
  return 0;
}

uint64_t sub_100018344(uint64_t a1)
{
  unsigned int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if (v1 <= 0x10)
    return (uint64_t)*(&off_100021438 + 5 * v1 + 5);
  else
    return 0;
}

const char *sub_100018370(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;

  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777473;
  result = (const char *)sub_1000121C4(*((_DWORD *)v3 + 3), v3 + 40, (vm_address_t *)(a2 + 28), (unsigned int *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    goto LABEL_12;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

const char *sub_10001846C(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  NDR_record_t v9;

  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
    v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }
  result = (const char *)sub_10001231C(*((_DWORD *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v9 = NDR_record;
  if ((_DWORD)result)
    goto LABEL_12;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

const char *sub_100018538(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  NDR_record_t v9;

  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
    v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }
  result = (const char *)sub_1000123DC(*((_DWORD *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v9 = NDR_record;
  if ((_DWORD)result)
    goto LABEL_12;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

const char *sub_100018604(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  NDR_record_t v9;

  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    *(_DWORD *)(a2 + 32) = -304;
    v9 = NDR_record;
LABEL_12:
    *(NDR_record_t *)(a2 + 24) = v9;
    return result;
  }
  result = (const char *)sub_100012434(*((_DWORD *)v3 + 3), v3 + 40, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v9 = NDR_record;
  if ((_DWORD)result)
    goto LABEL_12;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

const char *sub_1000186D0(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  const char *v9;
  int v10;
  int v11;
  int v12;
  __int128 v13;
  _OWORD v14[2];

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C)
    goto LABEL_16;
  if (v4 > 0x42C)
    goto LABEL_16;
  v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_16;
  v8 = 1064;
  if (*((unsigned int *)result + 1) < 0x428uLL)
    v8 = *((unsigned int *)result + 1);
  result = (const char *)memchr((void *)(result + 40), 0, v8 - 40);
  if (result)
  {
    v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      v11 = *((_DWORD *)v3 + 3);
      v12 = *(_DWORD *)&v3[v6 + 40];
      v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      result = (const char *)sub_100012510(v11, v3 + 40, v12, v14);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_18;
    }
    v10 = -309;
  }
  else
  {
LABEL_16:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
LABEL_18:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_1000187E0(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  const char *v9;
  int v10;
  int v11;
  uint64_t v12;
  __int128 v13;
  _OWORD v14[2];

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x2C)
    goto LABEL_16;
  if (v4 > 0x42C)
    goto LABEL_16;
  v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 44 < v5 || (_DWORD)v4 != v6 + 44)
    goto LABEL_16;
  v8 = 1064;
  if (*((unsigned int *)result + 1) < 0x428uLL)
    v8 = *((unsigned int *)result + 1);
  result = (const char *)memchr((void *)(result + 40), 0, v8 - 40);
  if (result)
  {
    v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      v11 = *((_DWORD *)v3 + 3);
      v12 = *(unsigned int *)&v3[v6 + 40];
      v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      result = (const char *)sub_100012650(v11, v3 + 40, v12, v14);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_18;
    }
    v10 = -309;
  }
  else
  {
LABEL_16:
    v10 = -304;
  }
  *(_DWORD *)(a2 + 32) = v10;
LABEL_18:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_1000188F0(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_14;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x30)
    goto LABEL_14;
  if (v4 > 0x430)
    goto LABEL_14;
  v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400)
    goto LABEL_14;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 48 < v5 || (_DWORD)v4 != v6 + 48)
    goto LABEL_14;
  if (*((unsigned int *)result + 1) >= 0x428uLL)
    v4 = 1064;
  result = (const char *)memchr((void *)(result + 40), 0, v4 - 40);
  if (result)
  {
    result = (const char *)sub_100012778(*((_DWORD *)v3 + 3), v3 + 40, *(unsigned int *)&v3[v6 + 40], *(_DWORD *)&v3[v6 + 44]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  else
  {
LABEL_14:
    *(_DWORD *)(a2 + 32) = -304;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_1000189B4(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;

  if ((*(_DWORD *)result & 0x80000000) == 0
    && (v3 = result, v4 = *((unsigned int *)result + 1), v4 >= 0x28)
    && v4 <= 0x428
    && ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && (result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) != 0))
  {
    result = (const char *)sub_100012868(*((_DWORD *)v3 + 3), v3 + 40);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  return result;
}

_DWORD *sub_100018A60(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777473;
  result = (_DWORD *)sub_100012940(result[3], (vm_address_t *)(a2 + 28), (unsigned int *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

const char *sub_100018B08(const char *result, _DWORD *a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  const char *v10;
  int v11;
  __int128 v12;
  _OWORD v13[2];

  if ((*(_DWORD *)result & 0x80000000) != 0
    || (v3 = result, v4 = *((unsigned int *)result + 1), v4 < 0x28)
    || v4 > 0x428
    || ((v5 = *((_DWORD *)result + 9), v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
    v9 = -304;
LABEL_12:
    a2[8] = v9;
    goto LABEL_13;
  }
  v10 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v10 || *((_DWORD *)v10 + 1) <= 0x1Fu)
  {
    v9 = -309;
    goto LABEL_12;
  }
  *((_QWORD *)a2 + 4) = 0x14000000000000;
  v11 = *((_DWORD *)v3 + 3);
  v12 = *(_OWORD *)(v10 + 36);
  v13[0] = *(_OWORD *)(v10 + 20);
  v13[1] = v12;
  result = (const char *)sub_100012B5C(v11, v3 + 40, v13, a2 + 7);
  if (!(_DWORD)result)
  {
    *a2 |= 0x80000000;
    a2[1] = 40;
    a2[6] = 1;
    return result;
  }
  a2[8] = (_DWORD)result;
LABEL_13:
  *((NDR_record_t *)a2 + 3) = NDR_record;
  return result;
}

void sub_100018C24(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  const UInt8 *v17;
  const UInt8 *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  _OWORD v22[2];

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 2)
    goto LABEL_3;
  v5 = *(unsigned int *)(a1 + 4);
  if (v5 < 0x6C || v5 > 0x46C)
    goto LABEL_3;
  if (*(_BYTE *)(a1 + 39) != 1 || *(_BYTE *)(a1 + 55) != 1)
    goto LABEL_21;
  v6 = *(_DWORD *)(a1 + 76);
  if (v6 > 0x400)
  {
LABEL_2:
    v3 = -304;
    goto LABEL_3;
  }
  v3 = -304;
  if ((int)v5 - 108 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v5 != v7 + 108)
    goto LABEL_3;
  v8 = a1 + v7;
  v9 = *(_DWORD *)(a1 + 40);
  if (v9 != *(_DWORD *)(v8 + 84) || (v10 = v8 - 1024, v11 = *(_DWORD *)(a1 + 56), v11 != *(_DWORD *)(v8 + 88)))
  {
LABEL_21:
    v3 = -300;
    goto LABEL_3;
  }
  v12 = 1104;
  if (*(unsigned int *)(a1 + 4) < 0x450uLL)
    v12 = *(unsigned int *)(a1 + 4);
  if (!memchr((void *)(a1 + 80), 0, v12 - 80))
    goto LABEL_2;
  v13 = ((v5 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v13 && *(_DWORD *)(v13 + 4) > 0x1Fu)
  {
    v14 = *(_DWORD *)(a1 + 12);
    v15 = *(_DWORD *)(a1 + 68);
    v16 = *(unsigned int *)(v10 + 1104);
    v17 = *(const UInt8 **)(a1 + 28);
    v18 = *(const UInt8 **)(a1 + 44);
    v19 = *(_QWORD *)(v10 + 1116);
    v20 = *(_QWORD *)(v10 + 1124);
    v21 = *(_OWORD *)(v13 + 36);
    v22[0] = *(_OWORD *)(v13 + 20);
    v22[1] = v21;
    *(_DWORD *)(a2 + 32) = sub_100012CDC(v14, v15, (const char *)(a1 + 80), v16, v17, v9, v18, v11, v19, v20, v22);
    mig_deallocate(*(_QWORD *)(a1 + 44), *(unsigned int *)(a1 + 56));
    *(_QWORD *)(a1 + 44) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
    *(_QWORD *)(a1 + 28) = 0;
    *(_DWORD *)(a1 + 40) = 0;
    goto LABEL_4;
  }
  v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
LABEL_4:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100018DE8(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  if ((*(_DWORD *)a1 & 0x80000000) == 0)
    goto LABEL_2;
  v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1)
    goto LABEL_3;
  v5 = *(_DWORD *)(a1 + 4);
  if (v5 < 0x58 || v5 > 0x458)
    goto LABEL_3;
  if (*(_BYTE *)(a1 + 39) != 1)
    goto LABEL_16;
  v6 = *(_DWORD *)(a1 + 76);
  if (v6 > 0x400)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }
  v3 = -304;
  if (v5 - 88 < v6)
    goto LABEL_3;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v5 != v7 + 88)
    goto LABEL_3;
  v8 = a1 + v7;
  v9 = *(_DWORD *)(a1 + 40);
  if (v9 != *(_DWORD *)(v8 + 80))
  {
LABEL_16:
    v3 = -300;
    goto LABEL_3;
  }
  v10 = 1104;
  if (*(unsigned int *)(a1 + 4) < 0x450uLL)
    v10 = *(unsigned int *)(a1 + 4);
  if (!memchr((void *)(a1 + 80), 0, v10 - 80))
    goto LABEL_2;
  *(_DWORD *)(a2 + 32) = sub_10001325C(*(_DWORD *)(a1 + 12), *(_QWORD *)(a1 + 52), *(_QWORD *)(a1 + 60), *(_DWORD *)(a1 + 68), (const char *)(a1 + 80), *(const UInt8 **)(a1 + 28), v9, *(_DWORD *)(v8 + 84));
  mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(_QWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
}

void sub_100018F1C(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  int v5;

  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 2 || *(_DWORD *)(a1 + 4) != 100)
  {
    v5 = -304;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v5;
    goto LABEL_11;
  }
  if (*(_BYTE *)(a1 + 39) != 1
    || *(_BYTE *)(a1 + 55) != 1
    || (v4 = *(_DWORD *)(a1 + 40), v4 != *(_DWORD *)(a1 + 92))
    || *(_DWORD *)(a1 + 56) != *(_DWORD *)(a1 + 96))
  {
    v5 = -300;
    goto LABEL_10;
  }
  *(_DWORD *)(a2 + 32) = sub_10001337C(*(_DWORD *)(a1 + 12), *(_QWORD *)(a1 + 68), *(_QWORD *)(a1 + 76), *(_DWORD *)(a1 + 84), *(_DWORD *)(a1 + 88), *(__CFDictionary **)(a1 + 28), v4, *(const UInt8 **)(a1 + 44), *(_DWORD *)(a1 + 56));
  mig_deallocate(*(_QWORD *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(_QWORD *)(a1 + 44) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(_QWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

_DWORD *sub_10001900C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_1000120C0(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

_DWORD *sub_100019064(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    result = (_DWORD *)sub_100013600(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000190BC(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112)
    {
      result = sub_1000136B0(*(_DWORD *)(result + 12), *(_DWORD *)(result + 28));
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
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100019140(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 48)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    result = sub_100013764(*(_DWORD *)(result + 12), *(_QWORD *)(result + 32), *(_QWORD *)(result + 40));
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t sub_1000191A0(_DWORD *a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_QWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if (v4 <= 0x10 && (v5 = (void (*)(void))*(&off_100021438 + 5 * v4 + 5)) != 0)
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

uint64_t _FSGetTypeInfoFromStatfs(uint64_t a1, char *a2, size_t a3, _DWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  char __source[16];

  v8 = a1 + 72;
  if (!sub_100019330((const char *)(a1 + 72)))
  {
    __strlcpy_chk(__source, v8, 16, 16);
    if (!a2)
      goto LABEL_10;
    goto LABEL_9;
  }
  v9 = a1 + 1112;
  v10 = strstr((char *)(a1 + 1112), "://");
  if (!v10)
    return 22;
  if ((unint64_t)&v10[-v9] >= 0xF)
    v11 = 15;
  else
    v11 = (uint64_t)&v10[-v9];
  __memcpy_chk(__source, a1 + 1112, v11, 16);
  __source[v11] = 0;
  if (a2)
LABEL_9:
    strlcpy(a2, __source, a3);
LABEL_10:
  result = 0;
  if (a4)
    *a4 = *(_DWORD *)(a1 + 68);
  return result;
}

BOOL sub_100019330(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t _FSGetTypeInfoForPath(const char *a1, char *a2, size_t a3, _DWORD *a4)
{
  statfs v8;

  memset(&v8, 0, 512);
  if (statfs(a1, &v8) == -1)
    return *__error();
  else
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
}

uint64_t _FSGetTypeInfoForFileDescriptor(int a1, char *a2, size_t a3, _DWORD *a4)
{
  statfs v8;

  memset(&v8, 0, 512);
  if (fstatfs(a1, &v8) == -1)
    return *__error();
  else
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
}

uint64_t _FSGetLocationFromStatfs(uint64_t a1, char *a2, size_t a3)
{
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = malloc_type_calloc(1uLL, 0x400uLL, 0x1359B406uLL);
  if (v6)
  {
    v7 = v6;
    if (sub_100019330((const char *)(a1 + 72)))
    {
      v8 = strstr((char *)(a1 + 1112), "://");
      if (!v8 || (v9 = v8 + 3, (v10 = strchr(v8 + 3, 47)) == 0))
      {
        v12 = 22;
LABEL_20:
        free(v7);
        return v12;
      }
      if (v10 - v9 >= 1023)
        v11 = 1023;
      else
        v11 = v10 - v9;
      __memcpy_chk(v7, v9, v11, 1024);
      *((_BYTE *)v7 + v11) = 0;
      if (!a2)
      {
LABEL_19:
        v12 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      if (!strncmp((const char *)(a1 + 1112), "/dev/disk", 9uLL))
      {
        v13 = a1 + 1117;
      }
      else if (!strncmp((const char *)(a1 + 1112), "/dev/rdisk", 0xAuLL))
      {
        v13 = a1 + 1118;
      }
      else
      {
        v13 = a1 + 1112;
      }
      __strlcpy_chk(v7, v13, 1024, 1024);
      if (!a2)
        goto LABEL_19;
    }
    strlcpy(a2, (const char *)v7, a3);
    goto LABEL_19;
  }
  return 12;
}

uint64_t _FSGetLocationForPath(const char *a1, char *a2, size_t a3)
{
  statfs v6;

  memset(&v6, 0, 512);
  if (statfs(a1, &v6) == -1)
    return *__error();
  else
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
}

uint64_t _FSGetLocationForFileDescriptor(int a1, char *a2, size_t a3)
{
  statfs v6;

  memset(&v6, 0, 512);
  if (fstatfs(a1, &v6) == -1)
    return *__error();
  else
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
}

const __CFArray *FSCopyFormatNameForFSType(const __CFArray *result, int a2, unsigned int a3, int a4)
{
  const __CFArray *v6;
  CFStringRef v7;
  void *v8;
  const void *Value;
  CFIndex v10;
  const __CFURL *v11;
  const __CFString *v12;
  const __CFURL *v13;
  CFBundleRef v14;
  char v15;
  const __CFArray *v16;
  CFIndex Count;
  const __CFArray *Mutable;
  CFIndex v19;
  const __CFString *ValueAtIndex;
  CFTypeID v21;
  CFTypeID v22;
  const __CFString *v23;
  const __CFString *v24;
  CFURLRef v25;
  const __CFDictionary *InfoDictionary;
  const __CFDictionary *v27;
  const __CFDictionary *ValueForInfoDictionaryKey;
  const __CFDictionary *v29;
  BOOL v30;
  const __CFDictionary *v31;
  CFIndex v32;
  CFIndex v33;
  const void **v34;
  const void **v35;
  CFNumberRef v36;
  uint64_t v37;
  const void **v38;
  const void *v39;
  const __CFDictionary *v40;
  const __CFDictionary *v41;
  const void *v42;
  const void *v43;
  __CFDictionary *v44;
  __CFDictionary *v45;
  CFStringRef v46;
  __CFBundle *MainBundle;
  __CFDictionary *v48;
  CFTypeID v49;
  CFTypeID v50;
  unint64_t v51;
  unint64_t v52;
  size_t v53;
  const void **v54;
  const __CFString *v55;
  const __CFNumber *v56;
  __int16 v57;
  _BYTE v58[32];
  uint64_t v59;
  char v60[32];
  uint64_t v61;

  v57 = a2;
  if (!result)
    return result;
  v6 = result;
  v7 = CFStringCreateWithFormat(0, 0, CFSTR("%d%@%d"), a3, result, a2);
  _os_nospin_lock_lock(&unk_100025248);
  v8 = &unk_100025000;
  if (qword_100025250)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_100025250, v7);
    _os_nospin_lock_unlock(&unk_100025248);
    if (Value)
    {
LABEL_70:
      CFRelease(v7);
      v49 = CFGetTypeID(Value);
      if (v49 == CFStringGetTypeID())
        return (const __CFArray *)CFRetain(Value);
      v50 = CFGetTypeID(Value);
      if (v50 != CFDictionaryGetTypeID())
        return (const __CFArray *)CFRetain(Value);
      v51 = 8 * CFDictionaryGetCount((CFDictionaryRef)Value);
      __chkstk_darwin();
      v52 = (v51 + 15) & 0xFFFFFFFFFFFFFFF0;
      if (v51 >= 0x200)
        v53 = 512;
      else
        v53 = v51;
      bzero((char *)&v54 - v52, v53);
      __chkstk_darwin();
      bzero((char *)&v54 - v52, v53);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)Value, (const void **)((char *)&v54 - v52), (const void **)((char *)&v54 - v52));
      return (const __CFArray *)CFRetain(*(const void ***)((char *)&v54 - v52));
    }
  }
  else
  {
    _os_nospin_lock_unlock(&unk_100025248);
  }
  result = (const __CFArray *)qword_100025258;
  if (qword_100025258)
    goto LABEL_7;
  result = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains(5, 14, 1);
  if (result)
  {
    v16 = result;
    Count = CFArrayGetCount(result);
    Mutable = CFArrayCreateMutable(0, Count, 0);
    if (Mutable)
    {
      v55 = v7;
      LODWORD(v54) = a4;
      if (CFArrayGetCount(v16) < 1)
      {
LABEL_25:
        qword_100025258 = (uint64_t)CFArrayCreateCopy(0, Mutable);
      }
      else
      {
        v19 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v16, v19);
          v21 = CFGetTypeID(ValueAtIndex);
          if (v21 == CFURLGetTypeID())
          {
            if (!CFURLGetFileSystemRepresentation((CFURLRef)ValueAtIndex, 0, (UInt8 *)v60, 1025))
              break;
          }
          else
          {
            v22 = CFGetTypeID(ValueAtIndex);
            if (v22 != CFStringGetTypeID())
              break;
            CFStringGetCString(ValueAtIndex, v60, 1025, 0x8000100u);
          }
          __strlcat_chk(v60, "/Filesystems", 1025, 1025);
          v23 = CFStringCreateWithCString(0, v60, 0x8000100u);
          if (!v23)
            break;
          v24 = v23;
          v25 = CFURLCreateWithFileSystemPath(0, v23, kCFURLPOSIXPathStyle, 1u);
          if (v25)
            CFArrayAppendValue(Mutable, v25);
          CFRelease(v24);
          if (++v19 >= CFArrayGetCount(v16))
            goto LABEL_25;
        }
      }
      v7 = v55;
      v8 = &unk_100025000;
    }
    CFRelease(Mutable);
    CFRelease(v16);
    result = (const __CFArray *)qword_100025258;
    if (qword_100025258)
    {
LABEL_7:
      if (CFArrayGetCount(result) < 1)
      {
        v14 = 0;
        v15 = 1;
LABEL_63:
        v46 = (CFStringRef)qword_100025260;
        if (!qword_100025260)
        {
          MainBundle = CFBundleGetMainBundle();
          v46 = CFBundleCopyLocalizedString(MainBundle, CFSTR("Unknown"), CFSTR("Unknown"), 0);
          qword_100025260 = (uint64_t)v46;
        }
        Value = CFStringCreateWithFormat(0, 0, CFSTR("%@ (%@)"), v46, v6);
LABEL_66:
        _os_nospin_lock_lock(&unk_100025248);
        v48 = (__CFDictionary *)*((_QWORD *)v8 + 74);
        if (!v48)
        {
          v48 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          *((_QWORD *)v8 + 74) = v48;
        }
        CFDictionarySetValue(v48, v7, Value);
        _os_nospin_lock_unlock(&unk_100025248);
        if ((v15 & 1) == 0)
          CFRelease(v14);
        goto LABEL_70;
      }
      v55 = v7;
      v10 = 0;
      while (1)
      {
        v11 = (const __CFURL *)CFArrayGetValueAtIndex((CFArrayRef)qword_100025258, v10);
        v12 = CFStringCreateWithFormat(0, 0, CFSTR("%@.fs"), v6);
        v13 = CFURLCreateWithFileSystemPathRelativeToBase(0, v12, kCFURLPOSIXPathStyle, 1u, v11);
        v14 = CFBundleCreate(0, v13);
        CFRelease(v12);
        CFRelease(v13);
        if (v14)
          break;
        if (++v10 >= CFArrayGetCount((CFArrayRef)qword_100025258))
        {
          v14 = 0;
          v15 = 1;
LABEL_37:
          v7 = v55;
          v8 = &unk_100025000;
          goto LABEL_63;
        }
      }
      InfoDictionary = CFBundleGetInfoDictionary(v14);
      v27 = InfoDictionary;
      if (a3)
      {
        ValueForInfoDictionaryKey = (const __CFDictionary *)CFBundleGetValueForInfoDictionaryKey(v14, CFSTR("FSPersonalities"));
        v29 = (const __CFDictionary *)CFDictionaryGetValue(v27, CFSTR("FSPersonalities"));
        if (ValueForInfoDictionaryKey)
          v30 = v29 == 0;
        else
          v30 = 1;
        if (v30)
        {
          v15 = 0;
          goto LABEL_37;
        }
        v31 = v29;
        v8 = &unk_100025000;
      }
      else
      {
        ValueForInfoDictionaryKey = (const __CFDictionary *)CFDictionaryGetValue(InfoDictionary, CFSTR("FSPersonalities"));
        v31 = ValueForInfoDictionaryKey;
        v8 = &unk_100025000;
        if (!ValueForInfoDictionaryKey)
        {
LABEL_42:
          v15 = 0;
          v7 = v55;
          goto LABEL_63;
        }
      }
      v32 = CFDictionaryGetCount(v31);
      if (v32 >= 1)
      {
        v33 = v32;
        v61 = 0;
        memset(v60, 0, sizeof(v60));
        v59 = 0;
        memset(v58, 0, sizeof(v58));
        if ((unint64_t)v32 < 6)
        {
          v35 = (const void **)v58;
          v34 = (const void **)v60;
        }
        else
        {
          v34 = (const void **)malloc_type_malloc(8 * v32, 0x6004044C4A2DFuLL);
          v35 = (const void **)malloc_type_malloc(8 * v33, 0x6004044C4A2DFuLL);
        }
        v54 = v35;
        CFDictionaryGetKeysAndValues(v31, v35, v34);
        v36 = CFNumberCreate(0, kCFNumberSInt16Type, &v57);
        v37 = 0;
        v56 = 0;
        while (CFDictionaryGetValueIfPresent((CFDictionaryRef)v34[v37], CFSTR("FSSubType"), (const void **)&v56) != 1
             || CFNumberCompare(v36, v56, 0))
        {
          if (v33 == ++v37)
          {
            CFRelease(v36);
            v38 = v54;
LABEL_49:
            v39 = v38[v33 - 1];
            goto LABEL_51;
          }
        }
        v39 = v54[v37];
        v38 = v54;
        CFRelease(v36);
        if (!v39)
          goto LABEL_49;
LABEL_51:
        v40 = (const __CFDictionary *)CFDictionaryGetValue(ValueForInfoDictionaryKey, v39);
        if (!v40)
          goto LABEL_56;
        v41 = v40;
        Value = CFDictionaryGetValue(v40, CFSTR("FSName"));
        v42 = CFDictionaryGetValue(v41, CFSTR("FSEncryptionName"));
        v7 = v55;
        if (!Value || (v43 = v42) == 0)
        {
LABEL_58:
          if (v34 != (const void **)v60)
            free(v34);
          if (v38 != (const void **)v58)
            free(v38);
          v15 = 0;
          v8 = &unk_100025000;
          if (Value)
            goto LABEL_66;
          goto LABEL_63;
        }
        v44 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (v44)
        {
          v45 = v44;
          CFDictionarySetValue(v44, Value, v43);
          Value = v45;
        }
        else
        {
LABEL_56:
          Value = 0;
        }
        v7 = v55;
        goto LABEL_58;
      }
      goto LABEL_42;
    }
  }
  return result;
}

const __CFArray *_FSCopyLocalizedNameForVolumeFormatAtURL(const __CFURL *a1)
{
  return sub_100019F04(a1, 1u);
}

const __CFArray *sub_100019F04(const __CFURL *a1, unsigned int a2)
{
  const __CFArray *v3;
  const __CFArray *v5;
  int v6;
  unsigned __int8 v7;
  char cStr[16];
  statfs v9;
  UInt8 buffer[1025];

  if (!a1)
    return 0;
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
    return 0;
  memset(&v9, 0, 512);
  v6 = 0;
  if (statfs((const char *)buffer, &v9) || _FSGetTypeInfoFromStatfs((uint64_t)&v9, cStr, 0x10uLL, &v6))
    return 0;
  v5 = (const __CFArray *)CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x600u);
  if (_FSGetLocationFromStatfs((uint64_t)&v9, v9.f_mntfromname, 0x400uLL))
  {
    v3 = 0;
  }
  else
  {
    v7 = 0;
    GetFSEncryptionStatus(v9.f_mntfromname, (char *)&v7, 1, 0);
    v3 = FSCopyFormatNameForFSType(v5, (__int16)v6, a2, v7);
  }
  CFRelease(v5);
  return v3;
}

const __CFArray *_FSCopyNameForVolumeFormatAtURL(const __CFURL *a1)
{
  return sub_100019F04(a1, 0);
}

const __CFArray *_FSCopyLocalizedNameForVolumeFormatAtNode(const __CFString *a1)
{
  int v1;
  const __CFArray *v2;
  _BOOL4 v3;
  const __CFArray *v4;
  int v6;
  char cStr[8];
  __int16 v8;
  char buffer[1025];

  v6 = 0;
  if (CFStringGetCString(a1, buffer, 1025, 0x8000100u) != 1)
    return 0;
  cStr[0] = 0;
  GetFSEncryptionStatus(buffer, cStr, 1, 0);
  v1 = cStr[0];
  *(_QWORD *)cStr = 0;
  v8 = 0;
  v2 = 0;
  if (getfstype(buffer, (uint64_t)cStr, &v6))
  {
    v3 = v1 != 0;
    v4 = (const __CFArray *)CFStringCreateWithCString(0, cStr, 0x600u);
    v2 = FSCopyFormatNameForFSType(v4, (__int16)v6, 1u, v3);
    CFRelease(v4);
  }
  return v2;
}

uint64_t getfstype(const char *a1, uint64_t a2, int *a3)
{
  int v6;
  uint64_t result;

  if (is_apfs(a1, a3))
  {
    *(_BYTE *)(a2 + 4) = 0;
    v6 = 1936093281;
  }
  else if (is_hfs(a1, a3))
  {
    v6 = 7562856;
  }
  else
  {
    result = is_msdos(a1, a3);
    if (!(_DWORD)result)
      return result;
    *(_WORD *)(a2 + 4) = 115;
    v6 = 1868854125;
  }
  *(_DWORD *)a2 = v6;
  return 1;
}

const __CFArray *_FSCopyNameForVolumeFormatAtNode(const __CFString *a1)
{
  int v1;
  const __CFArray *v2;
  _BOOL4 v3;
  const __CFArray *v4;
  int v6;
  char cStr[8];
  __int16 v8;
  char buffer[1025];

  v6 = 0;
  if (CFStringGetCString(a1, buffer, 1025, 0x8000100u) != 1)
    return 0;
  cStr[0] = 0;
  GetFSEncryptionStatus(buffer, cStr, 1, 0);
  v1 = cStr[0];
  *(_QWORD *)cStr = 0;
  v8 = 0;
  v2 = 0;
  if (getfstype(buffer, (uint64_t)cStr, &v6))
  {
    v3 = v1 != 0;
    v4 = (const __CFArray *)CFStringCreateWithCString(0, cStr, 0x600u);
    v2 = FSCopyFormatNameForFSType(v4, (__int16)v6, 0, v3);
    CFRelease(v4);
  }
  return v2;
}

BOOL is_apfs(const char *a1, _DWORD *a2)
{
  uint64_t v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_registry_entry_t v7;
  BOOLean_t v8;
  _BOOL8 v9;
  CFTypeRef v10;
  const void *v11;
  int v12;

  v4 = 6;
  if (strncmp(a1, "/dev/r", 6uLL))
  {
    v4 = 5;
    if (strncmp(a1, "/dev/", 5uLL))
      v4 = 0;
  }
  v5 = IOBSDNameMatching(kIOMasterPortDefault, 0, &a1[v4]);
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  if (!MatchingService)
    return 0;
  v7 = MatchingService;
  v8 = IOObjectConformsTo(MatchingService, "AppleAPFSVolume");
  v9 = v8 != 0;
  if (v8)
  {
    if (a2)
      *a2 = 1;
    v10 = IORegistryEntrySearchCFProperty(v7, "IOService", CFSTR("CaseSensitive"), kCFAllocatorDefault, 0);
    if (v10)
    {
      v11 = v10;
      v12 = CFEqual(v10, kCFBooleanTrue);
      if (a2 && v12)
        *a2 = 0;
      CFRelease(v11);
    }
  }
  IOObjectRelease(v7);
  return v9;
}

uint64_t is_hfs(const char *a1, int *a2)
{
  int v3;
  int v4;
  size_t v5;
  uint64_t v6;
  unsigned __int16 *v7;
  unsigned __int16 *v8;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  int v13;
  size_t v14;

  *a2 = -1;
  v14 = 0;
  v3 = open(a1, 4, 0);
  if (v3 >= 1)
  {
    v4 = v3;
    if (ioctl(v3, 0x40046418uLL, &v14) == -1)
    {
      v5 = 512;
      v14 = 512;
    }
    else
    {
      v5 = v14;
      if (v14 > 0x10000)
        goto LABEL_11;
    }
    v7 = (unsigned __int16 *)malloc_type_malloc(v5, 0x4068C84FuLL);
    if (!v7)
    {
LABEL_11:
      v6 = 0;
      goto LABEL_12;
    }
    v8 = v7;
    if ((unint64_t)readdisk(v4, 0x400uLL, 0x200uLL, v14, v7) < 0x200)
      goto LABEL_9;
    v10 = *v8;
    if (v10 == 17474)
    {
      if (v8[62] == 11080)
      {
        v11 = ((unint64_t)(bswap32(v8[14]) >> 16) << 9)
            + bswap32(*((_DWORD *)v8 + 5)) * (unint64_t)(bswap32(v8[63]) >> 16);
        if ((unint64_t)readdisk(v4, v11 + 1024, 0x200uLL, v14, v8) < 0x200)
          goto LABEL_9;
        v10 = *v8;
      }
      else
      {
        v11 = 0;
        v10 = 17474;
      }
    }
    else
    {
      v11 = 0;
    }
    v12 = __rev16(v10);
    if (v12 == 16964)
    {
      v13 = 128;
      goto LABEL_39;
    }
    if (v12 == 18520)
    {
      if (v8[1] != 1280)
        goto LABEL_9;
    }
    else if (v12 != 18475 || v8[1] != 1024)
    {
      goto LABEL_9;
    }
    if (*((_DWORD *)v8 + 3) && (v8[3] & 0x20) != 0)
      *a2 = 1;
    if (v10 != 22600)
    {
LABEL_37:
      if ((*a2 & 0x80000000) == 0)
      {
LABEL_40:
        v6 = 1;
        goto LABEL_10;
      }
      v13 = 0;
LABEL_39:
      *a2 = v13;
      goto LABEL_40;
    }
    if ((unint64_t)readdisk(v4, v11 + bswap32(*((_DWORD *)v8 + 10)) * (unint64_t)bswap32(*((_DWORD *)v8 + 72)), 0x78uLL, v14, v8) >= 0x78)
    {
      if (v8[17] == 1026 && *((unsigned __int8 *)v8 + 51) == 188)
      {
        if (*a2 == 1)
          v13 = 3;
        else
          v13 = 2;
        goto LABEL_39;
      }
      goto LABEL_37;
    }
LABEL_9:
    v6 = 0;
LABEL_10:
    free(v8);
LABEL_12:
    close(v4);
    return v6;
  }
  return 0;
}

uint64_t is_msdos(const char *a1, int *a2)
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  int v6;
  int v7;
  size_t v8;
  uint64_t v9;
  int8x8_t v10;
  int v11;
  unsigned int v12;
  uint8x8_t v14;
  unsigned int v15;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  int v22;
  unint64_t v23;

  v23 = 0;
  *a2 = -1;
  v4 = (unsigned __int8 *)malloc_type_malloc(0x800uLL, 0x403E892CuLL);
  if (v4)
  {
    v5 = v4;
    v6 = open(a1, 4, 0);
    if (v6 >= 1)
    {
      v7 = v6;
      if (ioctl(v6, 0x40046418uLL, &v23) == -1)
      {
        v8 = 512;
        v23 = 512;
      }
      else
      {
        v8 = v23;
        if (v23 > 0x800)
          goto LABEL_14;
      }
      if ((unint64_t)readdisk(v7, 0, 0x200uLL, v8, v5) >= 0x200)
      {
        v11 = *v5;
        if (v11 == 233 || v11 == 235 && v5[2] == 144)
        {
          v12 = *(unsigned __int16 *)(v5 + 11);
          if (v12 >= 0x200)
          {
            v9 = 0;
            if (v12 > 0x800)
              goto LABEL_15;
            v10.i32[0] = *(unsigned __int16 *)(v5 + 11);
            v14 = (uint8x8_t)vcnt_s8(v10);
            v14.i16[0] = vaddlv_u8(v14);
            if (v14.i32[0] > 1u)
              goto LABEL_15;
            v15 = v5[13];
            if ((v15 & (v15 - 1)) == 0 && v15 != 0)
            {
              v17 = *((unsigned __int16 *)v5 + 11);
              if (!*((_WORD *)v5 + 11))
                v17 = *((_DWORD *)v5 + 9);
              v18 = *(unsigned __int16 *)(v5 + 19);
              v19 = (v12 - 1 + 32 * *(unsigned __int16 *)(v5 + 17)) / v12;
              if (!*(_WORD *)(v5 + 19))
                v18 = *((_DWORD *)v5 + 8);
              v20 = (v18 - (v19 + *((unsigned __int16 *)v5 + 7) + v17 * v5[16])) / v15;
              v9 = 1;
              if (v20 < 0xFFF5)
                v21 = 1;
              else
                v21 = 2;
              if (v20 >= 0xFF5)
                v22 = v21;
              else
                v22 = 0;
              *a2 = v22;
              goto LABEL_15;
            }
          }
        }
      }
LABEL_14:
      v9 = 0;
LABEL_15:
      free(v5);
      close(v7);
      return v9;
    }
    free(v5);
  }
  return 0;
}

uint64_t readdisk(int a1, unint64_t a2, size_t a3, size_t a4, void *a5)
{
  size_t v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;

  v10 = a2 / a4;
  v11 = (a3 + a2) / a4 - a2 / a4;
  v12 = (char *)malloc_type_malloc((v11 + 1) * a4, 0xC06106EuLL);
  if (v11 == -1)
  {
    v13 = 0;
LABEL_10:
    memcpy(a5, &v12[a2 - v10 * a4], a3);
  }
  else
  {
    v14 = 0;
    v13 = 0;
    v15 = v11 + 1;
    while (pread(a1, &v12[v13], a4, (v14 + v10) * a4) == a4 || a4 == -1)
    {
      v13 += a4;
      ++v14;
      if (!--v15)
        goto LABEL_10;
    }
  }
  free(v12);
  return v13;
}

uint64_t GetFSEncryptionStatus(char *a1, char *a2, char a3, _DWORD *a4)
{
  uint64_t v8;
  const __CFBoolean *v9;
  const __CFBoolean *v10;
  size_t v11;
  char *v12;
  char *v13;
  int v14;
  int v15;
  unint64_t v16;
  int v17;
  int v18;
  char v19;
  int v20;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v22;
  io_registry_entry_t entry[2];

  *(_QWORD *)entry = 0;
  if (!a2)
    return 22;
  v8 = sub_10001AB10(a1, &entry[1]);
  if (!(_DWORD)v8)
  {
    if (a4)
      *a4 = 0;
    if (is_apfs(a1, 0)
      && (v9 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry[1], CFSTR("Encrypted"), kCFAllocatorDefault, 0)) != 0)
    {
      v10 = v9;
      if (CFBooleanGetValue(v9) == 1)
      {
        v11 = strlen(a1);
        v12 = &a1[v11];
        v13 = &a1[v11 - 1];
        if (v13 < a1 || (v14 = *v13, (v14 - 48) > 9))
        {
          v18 = -1;
        }
        else
        {
          v15 = 0;
          v16 = (unint64_t)&a1[v11 - 2];
          v17 = 1;
          do
          {
            v13 = (char *)v16;
            v15 += (v14 - 48) * v17;
            if (v16 < (unint64_t)a1)
              break;
            v17 *= 10;
            --v16;
            v14 = *v13;
          }
          while ((v14 - 48) <= 9);
          v18 = v15 - 1;
          v12 = v13 + 1;
        }
        if (v13 > a1 && *v13 == 115)
        {
          if (*(v12 - 2) == 47)
            v20 = -1;
          else
            v20 = v18;
        }
        else
        {
          v20 = -1;
        }
        if (IORegistryEntryGetParentEntry(entry[1], "IOService", entry))
        {
          v19 = 0;
        }
        else
        {
          if (IOObjectConformsTo(entry[0], "AppleAPFSContainer"))
          {
            if (sub_10001ABDC(entry[0], v20))
            {
              if (a4)
                *a4 |= 2u;
              v19 = 1;
            }
            else
            {
              v19 = a3 ^ 1;
            }
          }
          else
          {
            v19 = 0;
          }
          IOObjectRelease(entry[0]);
        }
        if (a4)
        {
          CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry[1], CFSTR("EncryptionRolling"), kCFAllocatorDefault, 0);
          if (CFProperty)
          {
            v22 = CFProperty;
            if (CFBooleanGetValue(CFProperty) == 1)
            {
              *a4 |= 4u;
              CFRelease(v22);
            }
          }
        }
      }
      else
      {
        v19 = 0;
      }
      *a2 = v19;
      CFRelease(v10);
    }
    else
    {
      *a2 = 0;
    }
  }
  if (entry[1])
    IOObjectRelease(entry[1]);
  return v8;
}

uint64_t sub_10001AB10(char *__s1, io_service_t *a2)
{
  uint64_t result;
  uint64_t v5;
  const char *v6;
  const char *v7;
  __CFDictionary *v8;
  const __CFDictionary *v9;
  io_service_t MatchingService;

  result = 22;
  if (__s1 && a2)
  {
    *a2 = 0;
    if (!strncmp(__s1, "/dev/", 5uLL))
      v5 = 5;
    else
      v5 = 0;
    v6 = &__s1[v5];
    if (!strncmp(v6, "rdisk", 5uLL))
      v7 = v6 + 1;
    else
      v7 = v6;
    v8 = IOBSDNameMatching(kIOMasterPortDefault, 0, v7);
    if (v8)
    {
      v9 = v8;
      CFDictionarySetValue(v8, CFSTR("IOProviderClass"), CFSTR("IOMedia"));
      MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v9);
      result = 0;
      *a2 = MatchingService;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t sub_10001ABDC(io_service_t a1, int a2)
{
  kern_return_t v3;
  uint64_t result;
  size_t outputStructCnt;
  __int16 outputStruct;
  int inputStruct;
  io_connect_t connect;

  connect = 0;
  outputStruct = 0;
  outputStructCnt = 2;
  if (IOServiceOpen(a1, mach_task_self_, 0, &connect))
    return 1;
  inputStruct = a2;
  v3 = IOConnectCallStructMethod(connect, 0x13u, &inputStruct, 4uLL, &outputStruct, &outputStructCnt);
  IOServiceClose(connect);
  if (v3)
    return 1;
  result = 0;
  if ((_BYTE)outputStruct)
  {
    if (!HIBYTE(outputStruct))
      return 1;
  }
  return result;
}

uint64_t GetDiskImageEncryptionStatus(char *a1, BOOL *a2)
{
  uint64_t v2;
  CFBooleanRef v4;
  io_registry_entry_t entry;

  entry = 0;
  v2 = 22;
  if (a1 && a2)
  {
    v2 = sub_10001AB10(a1, &entry);
    if (!(_DWORD)v2)
    {
      v4 = (CFBooleanRef)IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("image-encrypted"), kCFAllocatorDefault, 3u);
      if (v4)
      {
        *a2 = v4 == kCFBooleanTrue;
        CFRelease(v4);
      }
      else
      {
        *a2 = 0;
      }
    }
    if (entry)
      IOObjectRelease(entry);
  }
  return v2;
}

uint64_t _FSGetMediaEncryptionStatusAtPath(char *a1, BOOL *a2, _DWORD *a3)
{
  uint64_t result;
  int v7;
  int DiskImageEncryptionStatus;
  __int16 v9;

  v9 = 0;
  result = 22;
  if (a1)
  {
    if (a2)
    {
      result = GetFSEncryptionStatus(a1, (char *)&v9 + 1, 0, a3);
      if (!(_DWORD)result)
      {
        if (a3 || !HIBYTE(v9))
        {
          DiskImageEncryptionStatus = GetDiskImageEncryptionStatus(a1, (BOOL *)&v9);
          v7 = v9;
          if (!DiskImageEncryptionStatus && a3)
          {
            if ((_BYTE)v9)
            {
              *a3 |= 1u;
              v7 = 1;
            }
          }
        }
        else
        {
          v7 = 0;
        }
        result = 0;
        *a2 = (HIBYTE(v9) | v7) != 0;
      }
    }
  }
  return result;
}

uint64_t _FSGetMediaEncryptionStatus(const __CFString *a1, BOOL *a2, _DWORD *a3)
{
  char buffer[1025];

  if (CFStringGetCString(a1, buffer, 1025, 0x8000100u))
    return _FSGetMediaEncryptionStatusAtPath(buffer, a2, a3);
  else
    return 22;
}

void sub_10001AE58()
{
  __assert_rtn("__DACommandMachChannelHandler", "DACommand.c", 269, "job->kind == __kDACommandMachChannelJobKindExecute");
}

void sub_10001AE80()
{
  __assert_rtn("__DACommandExecute", "DACommand.c", 96, "__gDACommandMachChannelPort");
}

void sub_10001AEA8()
{
  __assert_rtn("__DADiskCreate", "DADisk.c", 159, "disk->_description");
}

void sub_10001AED0()
{
  __assert_rtn("__DADiskCreate", "DADisk.c", 160, "disk->_id");
}

void sub_10001AEF8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 136446210;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s", (uint8_t *)&v2, 0xCu);
}

void sub_10001AF6C()
{
  __assert_rtn("DALogDebug", "DALog.c", 156, "__gDALogDebugHeaderNext");
}

void sub_10001AF94()
{
  __assert_rtn("DAUserFSOpen", "DAUserFSMount.m", 83, "server != NULL");
}

void sub_10001AFBC()
{
  __assert_rtn("DAUserFSOpen", "DAUserFSMount.m", 84, "xpc_get_type(server) == XPC_TYPE_CONNECTION");
}

void sub_10001AFE4()
{
  __assert_rtn("__DAMain", "DAMain.c", 346, "gDABundlePath");
}

void sub_10001B00C()
{
  __assert_rtn("__DAMain", "DAMain.c", 373, "gDAProcessNameID");
}

void sub_10001B034()
{
  __assert_rtn("__DAMain", "DAMain.c", 381, "gDADiskList");
}

void sub_10001B05C()
{
  __assert_rtn("__DAMain", "DAMain.c", 389, "gDAFileSystemList");
}

void sub_10001B084()
{
  __assert_rtn("__DAMain", "DAMain.c", 397, "gDAFileSystemProbeList");
}

void sub_10001B0AC()
{
  __assert_rtn("__DAMain", "DAMain.c", 405, "gDAMountMapList1");
}

void sub_10001B0D4()
{
  __assert_rtn("__DAMain", "DAMain.c", 413, "gDAMountMapList2");
}

void sub_10001B0FC()
{
  __assert_rtn("__DAMain", "DAMain.c", 421, "gDAPreferenceList");
}

void sub_10001B124()
{
  __assert_rtn("__DAMain", "DAMain.c", 429, "gDAMountPointList");
}

void sub_10001B14C()
{
  __assert_rtn("__DAMain", "DAMain.c", 437, "gDARequestList");
}

void sub_10001B174()
{
  __assert_rtn("__DAMain", "DAMain.c", 445, "gDAResponseList");
}

void sub_10001B19C()
{
  __assert_rtn("__DAMain", "DAMain.c", 453, "gDASessionList");
}

void sub_10001B1C4()
{
  __assert_rtn("__DAMain", "DAMain.c", 461, "gDAUnitList");
}

void sub_10001B1EC()
{
  __assert_rtn("DAMountGetPreference", "DAMount.c", 734, "value");
}

void sub_10001B214()
{
  __assert_rtn("DAQueueCallback", "DAQueue.c", 552, "argument1 == NULL");
}

void sub_10001B23C()
{
  __assert_rtn("DAQueueCallback", "DAQueue.c", 611, "argument1 == NULL");
}

void sub_10001B264()
{
  __assert_rtn("_DAMediaAppearedCallback", "DAServer.c", 1090, "___CFArrayContainsValue( gDADiskList, disk) == FALSE");
}

void sub_10001B28C()
{
  __assert_rtn("_DAMediaDisappearedCallback", "DAServer.c", 1328, "context == NULL");
}

void sub_10001B2B4()
{
  __assert_rtn("__DASessionCreate", "DASession.c", 129, "session->_queue");
}

void sub_10001B2DC()
{
  __assert_rtn("__DASessionCreate", "DASession.c", 130, "session->_register");
}

void sub_10001B304()
{
  __assert_rtn("DASessionCreate", "DASession.c", 218, "port == MACH_PORT_NULL");
}

void sub_10001B32C()
{
  __assert_rtn("__DAThreadMachChannelHandler", "DAThread.c", 143, "job->kind == __kDAThreadMachChannelJobKindExecute");
}

void sub_10001B354()
{
  __assert_rtn("DAThreadExecute", "DAThread.c", 257, "__gDAThreadMachChannelPort");
}

void sub_10001B37C()
{
  __assert_rtn("__DAThreadFunction", "DAThread.c", 77, "job->kind == __kDAThreadMachChannelJobKindExecute");
}

id objc_msgSend_DAMountUserFSVolume_deviceName_mountPoint_volumeName_auditToken_mountOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DAMountUserFSVolume:deviceName:mountPoint:volumeName:auditToken:mountOptions:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOption:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributes");
}

id objc_msgSend_audit_token(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audit_token");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_checkResource_usingBundle_options_auditToken_connection_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResource:usingBundle:options:auditToken:connection:replyHandler:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_completed_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completed:replyHandler:");
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerID");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_devicePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicePath");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_exitError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitError");
}

id objc_msgSend_getConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConnection");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_installedExtensionsForUser_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedExtensionsForUser:replyHandler:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_optionWithoutValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionWithoutValue:");
}

id objc_msgSend_probeResource_usingBundle_auditToken_replyHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "probeResource:usingBundle:auditToken:replyHandler:");
}

id objc_msgSend_proxyResourceForBSDName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyResourceForBSDName:");
}

id objc_msgSend_proxyResourceForBSDName_writable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyResourceForBSDName:writable:");
}

id objc_msgSend_receiverWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiverWithDelegate:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_setDispatch_group_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatch_group:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_tokenWithRuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tokenWithRuid:");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

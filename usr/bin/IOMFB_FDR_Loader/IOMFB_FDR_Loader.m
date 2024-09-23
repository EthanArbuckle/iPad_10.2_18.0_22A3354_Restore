uint64_t sub_100001D0C(io_registry_entry_t a1, const __CFString *a2, uint64_t a3)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v5;
  uint64_t valuePtr;

  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    valuePtr = a3;
    CFNumberGetValue(CFProperty, kCFNumberLongType, &valuePtr);
    CFRelease(v5);
    return valuePtr;
  }
  return a3;
}

BOOL sub_100001D70(io_registry_entry_t a1, const __CFString *a2)
{
  const __CFBoolean *CFProperty;
  const __CFBoolean *v3;
  _BOOL8 v4;

  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty)
    return 0;
  v3 = CFProperty;
  v4 = CFBooleanGetValue(CFProperty) != 0;
  CFRelease(v3);
  return v4;
}

BOOL sub_100001DC4(io_registry_entry_t a1, const __CFString *a2)
{
  const __CFBoolean *CFProperty;
  const __CFBoolean *v4;
  _BOOL8 v5;
  char CStringPtr;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    CStringPtr = CFStringGetCStringPtr(a2, 0x600u);
    sub_100001E38("can't read property '%s'", v8, v9, v10, v11, v12, v13, v14, CStringPtr);
  }
  v4 = CFProperty;
  v5 = CFBooleanGetValue(CFProperty) != 0;
  CFRelease(v4);
  return v5;
}

void sub_100001E38(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  fwrite("error: ", 7uLL, 1uLL, __stderrp);
  vfprintf(__stderrp, a1, &a9);
  v10 = fputc(10, __stderrp);
  if (!byte_10002C018)
    sub_100006EFC(v10, v11, v12, v13, v14, v15, v16, v17);
  exit(1);
}

CFTypeRef sub_100001EA8(io_registry_entry_t a1, const __CFString *a2)
{
  CFTypeRef CFProperty;
  char CStringPtr;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  CFProperty = IORegistryEntryCreateCFProperty(a1, a2, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    CStringPtr = CFStringGetCStringPtr(a2, 0x600u);
    sub_100001F08("can't read property '%s'", v5, v6, v7, v8, v9, v10, v11, CStringPtr);
  }
  return CFProperty;
}

uint64_t sub_100001F08(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  fwrite("warning: ", 9uLL, 1uLL, __stderrp);
  vfprintf(__stderrp, a1, &a9);
  return fputc(10, __stderrp);
}

BOOL sub_100001F70(io_registry_entry_t a1, const __CFString *a2, int a3)
{
  CFTypeRef *v3;

  v3 = (CFTypeRef *)&kCFBooleanTrue;
  if (!a3)
    v3 = (CFTypeRef *)&kCFBooleanFalse;
  return IORegistryEntrySetCFProperty(a1, a2, *v3) == 0;
}

__int16 *sub_100001FA8()
{
  return &word_100047918;
}

void *sub_100001FB4()
{
  return &unk_100047870;
}

void *sub_100001FC0()
{
  if (dword_100047A18 == 1)
    return &unk_1000479BC;
  else
    return &unk_100047A00;
}

void *sub_100001FDC()
{
  return &unk_1000478C0;
}

void *sub_100001FE8()
{
  if (dword_100047A18 == 1)
    return &unk_1000479BE;
  else
    return &unk_100047A02;
}

int *sub_100002004()
{
  return &dword_100047910;
}

int *sub_100002010()
{
  return &dword_100047914;
}

uint64_t sub_10000201C(uint64_t result)
{
  _QWORD *v1;

  v1 = &unk_1000479C8;
  if (dword_100047A18 != 1)
    v1 = &unk_100047A10;
  *v1 = result;
  return result;
}

uint64_t sub_10000203C(uint64_t result)
{
  int *v1;

  v1 = &dword_1000479C0;
  if (dword_100047A18 != 1)
    v1 = (int *)&unk_100047A08;
  *(_QWORD *)v1 = result;
  return result;
}

uint64_t sub_10000205C@<X0>(const std::string *a1@<X0>, unsigned __int8 a2@<W1>, uint64_t *a3@<X8>)
{
  __int128 v5;
  _QWORD *v6;
  void *v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *__p[2];
  uint64_t v14;
  __int128 v15;
  _OWORD v16[4];
  void *v17[2];
  __int128 v18;
  __int128 v19;
  _OWORD v20[9];
  unint64_t v21;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[7] = v5;
  v20[8] = v5;
  v20[5] = v5;
  v20[6] = v5;
  v20[3] = v5;
  v20[4] = v5;
  v20[1] = v5;
  v20[2] = v5;
  v19 = v5;
  v20[0] = v5;
  *(_OWORD *)v17 = v5;
  v18 = v5;
  v16[2] = v5;
  v16[3] = v5;
  v16[0] = v5;
  v16[1] = v5;
  v15 = v5;
  sub_10000222C((void (__cdecl ***)(std::basic_stringstream<char> *__hidden))&v15, a1, 24);
  __p[0] = 0;
  __p[1] = 0;
  v14 = 0;
  while (1)
  {
    v6 = sub_10000234C(&v15, (uint64_t)__p, a2);
    if ((*((_BYTE *)v6 + *(_QWORD *)(*v6 - 24) + 32) & 5) != 0)
      break;
    if (v14 >= 0)
      v7 = (void *)HIBYTE(v14);
    else
      v7 = __p[1];
    if (v7)
    {
      v8 = a3[1];
      if (v8 >= a3[2])
      {
        v10 = sub_1000082A0(a3, (__int128 *)__p);
      }
      else
      {
        if (v14 < 0)
        {
          sub_1000083C8((_BYTE *)a3[1], __p[0], (unint64_t)__p[1]);
        }
        else
        {
          v9 = *(_OWORD *)__p;
          *(_QWORD *)(v8 + 16) = v14;
          *(_OWORD *)v8 = v9;
        }
        v10 = v8 + 24;
        a3[1] = v8 + 24;
      }
      a3[1] = v10;
    }
  }
  if (v14 < 0)
    operator delete(__p[0]);
  *(_QWORD *)((char *)&v16[-1]
  *(_QWORD *)&v16[0] = v11;
  if (SHIBYTE(v18) < 0)
    operator delete(v17[1]);
  std::streambuf::~streambuf((char *)v16 + 8);
  return std::ios::~ios(v20);
}

void sub_1000021E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16)
{
  sub_100008074((void ***)&a16);
  _Unwind_Resume(a1);
}

void (__cdecl ***sub_10000222C(void (__cdecl ***a1)(std::basic_stringstream<char> *__hidden this), const std::string *a2, int a3))(std::basic_stringstream<char> *__hidden this)
{
  _QWORD *v5;
  uint64_t v6;
  void (__cdecl **v7)(std::basic_stringstream<char> *__hidden);
  void (__cdecl **v8)(std::basic_stringstream<char> *__hidden);
  std::ios_base *v9;
  void (__cdecl **v10)(std::basic_stringstream<char> *__hidden);
  uint64_t v11;
  void (__cdecl **v12)(std::basic_stringstream<char> *__hidden);

  v5 = a1 + 2;
  v6 = (uint64_t)(a1 + 3);
  *a1 = v7;
  *(_QWORD *)((char *)*(v7 - 3) + (_QWORD)a1) = v8;
  a1[1] = 0;
  v9 = (std::ios_base *)((char *)*(*a1 - 3) + (_QWORD)a1);
  std::ios_base::init(v9, a1 + 3);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  a1[2] = v10;
  *(_QWORD *)((char *)*(v10 - 3) + (_QWORD)v5) = v11;
  *a1 = v12;
  sub_100008100(v6, a2, a3);
  return a1;
}

void sub_100002324(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  std::iostream::~basic_iostream(v2, v3 + 8);
  std::ios::~ios(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_10000234C(_QWORD *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  int v9;
  char v11;

  v11 = -86;
  std::istream::sentry::sentry(&v11, a1, 1);
  if (!v11)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v6 = 0;
  while (1)
  {
    v7 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(_QWORD *))(*v7 + 80))(v7);
    if ((_DWORD)v7 == -1)
      break;
LABEL_9:
    if (v7 == a3)
    {
      v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(_QWORD *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6)
    v9 = 2;
  else
    v9 = 6;
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_100002480(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x10000244CLL);
  }
  __cxa_rethrow();
}

void sub_1000024C4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_1000024D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = a1 + 24;
  *(_QWORD *)(a1 + 16) = v3;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf(v4);
  std::ios::~ios(a1 + 128);
  return a1;
}

void start(unsigned int a1, const char **a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  int v27;
  const char **v28;
  const char *v29;
  const char *v30;
  int v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char **v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  char v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  float v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  float v75;
  const char *v76;
  int v77;
  const char *v78;
  int v79;
  int MainDisplay;
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
  char outputStruct;
  const char *v96;
  uint64_t v97;
  unsigned int v98;
  size_t __n[2];
  __int128 __b;
  __int128 v101;
  __int128 v102;

  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100028410);
  if ((int)a1 <= 1)
    sub_10000705C(*a2);
  v96 = *a2;
  bzero(&qword_10002C000, 0x1BAE0uLL);
  bzero(qword_100047AE0, 0x68uLL);
  byte_100047B38 = byte_100047B38 & 0xF0 | 3;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v101 = v4;
  v102 = v4;
  __b = v4;
  __n[0] = 128;
  bzero(byte_100047B48, 0x80uLL);
  if (sysctlbyname("hw.targettype", byte_100047B48, __n, 0, 0))
    sub_100001E38("Could not determine device type", v5, v6, v7, v8, v9, v10, v11, outputStruct);
  v12 = &qword_100028448;
  v13 = __n[0];
  v14 = 96;
  while (strncmp(byte_100047B48, (const char *)*(v12 - 3), v13))
  {
    v12 += 8;
    if (!--v14)
    {
      sub_100001F08("Device %s unknown", v15, v16, v17, v18, v19, v20, v21, (char)byte_100047B48);
      v22 = 0;
      goto LABEL_14;
    }
  }
  v22 = *((_DWORD *)v12 - 4);
  if (v22 <= 1)
    v23 = 1;
  else
    v23 = v22;
  v24 = (uint64_t *)&__b + 1;
  do
  {
    *(v24 - 1) = *(v12 - 1);
    v25 = *v12;
    v12 += 2;
    *v24 = v25;
    v24 += 2;
    --v23;
  }
  while (v23);
LABEL_14:
  v26 = 0;
  v27 = 0;
  LODWORD(qword_100047AEC) = 0;
  qword_100047B40 = 0;
  v98 = v22;
  *(_QWORD *)algn_100047B28 = 0;
  *(_QWORD *)&dword_100047B20 = 0;
  v97 = v22;
  v28 = a2;
  while (1)
  {
    v30 = v28[1];
    ++v28;
    v29 = v30;
    if (!strncmp(v30, "-i", 3uLL))
    {
      v31 = a1 - 2;
      if (a1 <= 2)
        sub_10000705C(v96);
      v32 = malloc_type_malloc(0x18uLL, 0xF00400FAC18B6uLL);
      if (!v32)
        sub_100001E38("could not create custom file list", v33, v34, v35, v36, v37, v38, v39, outputStruct);
      v41 = a2[2];
      v40 = a2 + 2;
      *v32 = v41;
      v42 = qword_100047B40;
      v32[1] = qword_100047B40;
      if (v42)
        *(_QWORD *)(v42 + 16) = v32 + 1;
      qword_100047B40 = (uint64_t)v32;
      v32[2] = &qword_100047B40;
      v43 = qword_100047AEC;
      v26 = qword_100047AEC + 1;
      LODWORD(qword_100047AEC) = qword_100047AEC + 1;
      v44 = &qword_100047AE0[2 * v43];
      v44[2] = 0x100000001;
      v44[3] = 0;
      ++v27;
      goto LABEL_33;
    }
    v31 = a1 - 1;
    if (!strncmp(v29, "-n", 3uLL))
    {
      v45 = byte_100047B38 & 0xFE;
LABEL_36:
      byte_100047B38 = v45;
      goto LABEL_49;
    }
    if (!strncmp(v29, "-C", 3uLL))
    {
      v45 = byte_100047B38 & 0xFD;
      goto LABEL_36;
    }
    if (!strncmp(v29, "-F", 3uLL))
    {
      if (v26)
        sub_10000705C(v96);
      qword_100047AEC = 0x200000001;
      v46 = (uint64_t *)&__b + 1;
      v47 = v97;
      if (!v98)
        goto LABEL_46;
      while (*((_DWORD *)v46 - 2) != 2)
      {
        v46 += 2;
        if (!--v47)
          goto LABEL_46;
      }
LABEL_47:
      dword_100047AF4 = *((_DWORD *)v46 - 1);
      qword_100047AF8 = *v46;
LABEL_48:
      ++v27;
      v26 = 1;
      goto LABEL_49;
    }
    if (!strncmp(v29, "--fs", 5uLL))
    {
      if (v26)
        sub_10000705C(v96);
      qword_100047AEC = 0x300000001;
      v46 = (uint64_t *)&__b + 1;
      v48 = v97;
      if (v98)
      {
        while (*((_DWORD *)v46 - 2) != 3)
        {
          v46 += 2;
          if (!--v48)
            goto LABEL_46;
        }
        goto LABEL_47;
      }
LABEL_46:
      dword_100047AF4 = 0;
      goto LABEL_48;
    }
    if (!strncmp(v29, "--launchd_boot", 0x10uLL))
    {
      if (v26)
        sub_10000705C(v96);
      byte_100047B38 |= 4u;
      *(_OWORD *)((char *)&qword_100047AEC + 4) = __b;
      unk_100047B00 = v101;
      unk_100047B10 = v102;
      v26 = v98;
      LODWORD(qword_100047AEC) = v98;
      ++v27;
    }
    else
    {
      if (!strncmp(v29, "--pdc_ffr_low", 0x10uLL))
      {
        v31 = a1 - 2;
        if (a1 <= 2)
          sub_10000705C(v96);
        v49 = a2[2];
        v40 = a2 + 2;
        v57 = atof(v49);
        if (v57 <= 0.0)
          sub_100001E38("pdc bin must be positive.", v50, v51, v52, v53, v54, v55, v56, outputStruct);
        *(float *)&qword_10002C908 = v57;
        goto LABEL_33;
      }
      if (!strncmp(v29, "--pdc_ffr_high", 0x10uLL))
      {
        v31 = a1 - 2;
        if (a1 <= 2)
          sub_10000705C(v96);
        v58 = a2[2];
        v40 = a2 + 2;
        v66 = atof(v58);
        if (v66 <= 0.0)
          sub_100001E38("pdc bin must be positive.", v59, v60, v61, v62, v63, v64, v65, outputStruct);
        *((float *)&qword_10002C908 + 1) = v66;
        goto LABEL_33;
      }
      if (!strncmp(v29, "--latleak_bin", 0x10uLL))
      {
        v31 = a1 - 2;
        if (a1 <= 2)
          sub_10000705C(v96);
        v67 = a2[2];
        v40 = a2 + 2;
        v75 = atof(v67);
        if (v75 <= 0.0)
          sub_100001E38("lateral leakage bin must be positive.", v68, v69, v70, v71, v72, v73, v74, outputStruct);
        dword_100047AC8 = ((float)(v75 * 65536.0) + 0.5);
        goto LABEL_33;
      }
      if (!strncmp(v29, "--prox_bin_pbds", 0x10uLL))
      {
        v31 = a1 - 2;
        if (a1 <= 2)
          sub_10000705C(v96);
        v76 = a2[2];
        v40 = a2 + 2;
        *(float *)&v77 = atof(v76);
        dword_100047AD0 = v77;
        byte_100047AD8 = 1;
        goto LABEL_33;
      }
      if (!strncmp(v29, "--prox_bin_pbdd", 0x10uLL))
      {
        v31 = a1 - 2;
        if (a1 <= 2)
          sub_10000705C(v96);
        v78 = a2[2];
        v40 = a2 + 2;
        *(float *)&v79 = atof(v78);
        dword_100047AD4 = v79;
        byte_100047AD9 = 1;
LABEL_33:
        v28 = v40;
        goto LABEL_49;
      }
      if (strncmp(v29, "-v", 2uLL))
        sub_10000705C(v96);
      byte_10002C019 = 1;
    }
LABEL_49:
    a1 = v31;
    a2 = v28;
    if (v31 <= 1)
    {
      if (v27 <= 0)
        sub_10000705C(v96);
      MainDisplay = IOMobileFramebufferGetMainDisplay(qword_100047AE0);
      if (!MainDisplay && qword_100047AE0[0])
      {
        dword_100047AE8 = IOMobileFramebufferGetServiceObject(qword_100047AE0[0]);
        if (!dword_100047AE8)
          sub_100001E38("Failed to get IOMFB service", v88, v89, v90, v91, v92, v93, v94, outputStruct);
        operator new();
      }
      sub_100001E38("Failed to connect to IOMFB: 0x%x", v81, v82, v83, v84, v85, v86, v87, MainDisplay);
    }
  }
}

void sub_100006DBC()
{
  operator delete();
}

void sub_100006DE8(id a1, void *a2)
{
  char string;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  sub_100006E24("IOMFB_FDR_Loader: handling event %s\n", v3, v4, v5, v6, v7, v8, v9, string);
}

uint64_t sub_100006E24(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  fwrite("info: ", 6uLL, 1uLL, __stderrp);
  vfprintf(__stderrp, a1, &a9);
  return fputc(10, __stderrp);
}

uint64_t sub_100006E8C(io_registry_entry_t a1, int a2)
{
  char v2;
  CFTypeRef *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v2 = a2;
  v4 = (CFTypeRef *)&kCFBooleanTrue;
  if (!a2)
    v4 = (CFTypeRef *)&kCFBooleanFalse;
  result = IORegistryEntrySetCFProperty(a1, CFSTR("NormalModeEnable"), *v4);
  if ((v2 & 1) == 0 && (_DWORD)result)
  {
    result = sub_100001DC4(a1, CFSTR("NormalModeActive"));
    if ((_DWORD)result)
      sub_100001E38("could not switch out of normal mode", v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return result;
}

void sub_100006EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char **i;
  const char *v17;
  const char *v18;
  char v19;

  byte_10002C018 = 1;
  if ((byte_100047B38 & 1) != 0)
  {
    v8 = !qword_100047AE0 || dword_100047AE8 == 0;
    if (!v8 && (sub_100001DC4() & 1) == 0)
    {
      sub_100006E24("setting back to normal mode", a2, a3, a4, a5, a6, a7, a8, v19);
      IORegistryEntrySetCFProperty(dword_100047AE8, CFSTR("NormalModeEnable"), kCFBooleanTrue);
    }
  }
  if (qword_100047AE0)
    CFRelease((CFTypeRef)qword_100047AE0);
  if (dword_100047B20 == 3)
    globfree((glob_t *)&qword_100047C48);
  if (qword_100047B30)
  {
    sub_10000A56C(qword_100047B30);
    if (qword_100047B30)
      operator delete();
    qword_100047B30 = 0;
  }
  if (qword_100047B40)
  {
    sub_100001F08("custom input files not all processed, remaining files below: ", a2, a3, a4, a5, a6, a7, a8, v19);
    for (i = (const char **)qword_100047B40; qword_100047B40; i = (const char **)qword_100047B40)
    {
      v17 = i[1];
      if (v17)
        *((_QWORD *)v17 + 2) = i[2];
      *(_QWORD *)i[2] = v17;
      v18 = *i;
      if (!*i)
        v18 = "(null)";
      sub_100006E24("%s ", v9, v10, v11, v12, v13, v14, v15, (char)v18);
      free(i);
    }
  }
}

void sub_10000705C(const char *a1)
{
  size_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  fprintf(__stderrp, "usage: %s [-n] [-C] (-F | -i <infile> | --fs | --launchd_boot)\n", a1);
  fwrite("\t-n: do not attempt mode change\n", 0x20uLL, 1uLL, __stderrp);
  fwrite("\t-C: do not ignore CDFD sections\n", 0x21uLL, 1uLL, __stderrp);
  fwrite("\t-F: get data from FDR\n", 0x17uLL, 1uLL, __stderrp);
  fwrite("\t-i: parse unsigned FDR file\n", 0x1DuLL, 1uLL, __stderrp);
  fwrite("\t--fs: read data from /System/Library/Display\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\t--launchd_boot: default boot action for this device\n", 0x35uLL, 1uLL, __stderrp);
  fwrite("\t--latleak_bin: set bin (float) for lateral leakage interpolation\n", 0x42uLL, 1uLL, __stderrp);
  v1 = fwrite("\t-v: enable additional parsing information\n", 0x2BuLL, 1uLL, __stderrp);
  sub_100006EFC(v1, v2, v3, v4, v5, v6, v7, v8);
  exit(2);
}

BOOL sub_100007158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v5 = IOMobileFramebufferSetBlock(qword_100047AE0, a1, a2, a3, a4, a5);
  v13 = v5;
  if (v5)
    sub_100006E24("Parser SetBlock failed with 0x%x", v6, v7, v8, v9, v10, v11, v12, v5);
  return v13 == 0;
}

uint64_t sub_1000071B8(const __CFString *a1)
{
  return sub_100001D0C(dword_100047AE8, a1, 0xFFFFFFFFLL);
}

uint64_t sub_1000071CC(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_DWORD *)(a1 + 4) >> 8;
  if ((v1 - 5) > 0xFFFFFFFB)
    operator new[]();
  return printf("%s: Bad SPUC data version %d\n", "read_spuc", v1);
}

uint64_t sub_1000073D0(FILE *__stream)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  unsigned int __ptr;

  __ptr = -1431655766;
  if (fread(&__ptr, 1uLL, 4uLL, __stream) != 4)
    sub_100001E38("Unexpected EOF on input", v1, v2, v3, v4, v5, v6, v7, v9);
  return __ptr;
}

void sub_10000741C(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  int v29;
  unint64_t v30;
  __int16 v31;

  if (!qword_100047B30)
    sub_100001E38("No parser", a2, a3, a4, a5, a6, a7, a8, v27);
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v31 = -21846;
  sub_10000924C(qword_100047B30, *a1, (char *)&v30);
  v9 = 4 * (a1[2] - 3);
  v10 = malloc_type_malloc(v9, 0x100004052888210uLL);
  if (!v10)
    sub_100001E38("Could not allocate memory for %s data\n", v11, v12, v13, v14, v15, v16, v17, (char)&v30);
  v18 = v10;
  sub_100007640((FILE *)qword_10002C008, v10, v9);
  v29 = a1[2];
  v28 = *(_QWORD *)a1;
  v19 = sub_1000096F0((_QWORD *)qword_100047B30, (uint64_t)v18, (int *)&v28);
  free(v18);
  if ((v19 & 1) == 0)
    sub_100001F08("Could not configure %s block\n", v20, v21, v22, v23, v24, v25, v26, (char)&v30);
}

uint64_t sub_100007544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100001F08("%s", a2, a3, a4, a5, a6, a7, a8, a2);
}

FILE *sub_10000756C(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  FILE *v5;

  v4 = malloc_type_malloc(0x10uLL, 0x50040D3D5ADE1uLL);
  *v4 = a1;
  v4[1] = a1 + a2;
  v5 = funopen(v4, (int (__cdecl *)(void *, char *, int))sub_1000075E4, 0, 0, 0);
  if (!v5)
    free(v4);
  return v5;
}

uint64_t sub_1000075E4(uint64_t a1, void *__dst, unsigned int a3)
{
  unsigned int v3;
  uint64_t v5;

  v3 = *(_DWORD *)(a1 + 8) - *(_QWORD *)a1;
  if (!v3)
    return 0;
  if ((int)v3 >= (int)a3)
    v5 = a3;
  else
    v5 = v3;
  memcpy(__dst, *(const void **)a1, (int)v5);
  *(_QWORD *)a1 += (int)v5;
  return v5;
}

size_t sub_100007640(FILE *__stream, void *__ptr, size_t __nitems)
{
  int v3;
  size_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = __nitems;
  result = fread(__ptr, 1uLL, __nitems, __stream);
  if (result != v3)
    sub_100001E38("Unexpected EOF on input", v5, v6, v7, v8, v9, v10, v11, v12);
  return result;
}

uint64_t sub_100007684(FILE *__stream)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  unsigned __int16 __ptr;

  __ptr = -21846;
  if (fread(&__ptr, 1uLL, 2uLL, __stream) != 2)
    sub_100001E38("Unexpected EOF on input", v1, v2, v3, v4, v5, v6, v7, v9);
  return __ptr;
}

uint64_t sub_1000076D0(FILE *__stream)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  unsigned __int8 __ptr;

  __ptr = -86;
  if (fread(&__ptr, 1uLL, 1uLL, __stream) != 1)
    sub_100001E38("Unexpected EOF on input", v1, v2, v3, v4, v5, v6, v7, v9);
  return __ptr;
}

uint64_t sub_10000771C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  unsigned int v9;
  BOOL v10;

  if ((_DWORD)result)
  {
    v9 = result;
    result = 0;
    do
    {
      if (v9 > 0x46u)
      {
        if (v9 == 71)
        {
          result = result | 2;
        }
        else
        {
          if (v9 != 82)
LABEL_13:
            sub_100001E38("Illegal channel code", a2, a3, a4, a5, a6, a7, a8, v8);
          result = result | 1;
        }
      }
      else if (v9 != 32)
      {
        if (v9 != 66)
          goto LABEL_13;
        result = result | 4;
      }
      v10 = v9 > 0xFF;
      v9 >>= 8;
    }
    while (v10);
  }
  return result;
}

__int32 *sub_100007790(__int32 __c, __int32 *__s, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9;
  __int32 *v12;
  __int32 *result;
  __int32 *v14;
  uint64_t v15;
  uint64_t v16;
  __int32 *v17;
  char v18;
  char v19;

  v9 = *a3;
  if ((_DWORD)v9 == 12)
    sub_100001E38("Too many index values for CLUT tables", (uint64_t)__s, v9, a4, a5, a6, a7, a8, v18);
  v12 = &__s[v9];
  result = wmemchr(__s, __c, v9);
  if (result)
    v14 = result;
  else
    v14 = v12;
  v15 = v14 - __s;
  v16 = *a3;
  if (v15 == v16)
  {
    *a3 = v16 + 1;
    __s[v15] = __c;
    v17 = &__s[*a3];
    v19 = -86;
    return (__int32 *)std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>(__s, v17, &v19);
  }
  return result;
}

void sub_100007830(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_DWORD *sub_100007840(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v10;
  uint64_t *v11;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  char v23;

  v8 = a5;
  v9 = a3;
  v10 = a2;
  v11 = &qword_10002C910;
  if ((unsigned __int16)word_10002C8FC != a1)
  {
    v11 = &qword_10002C918;
    if (*(float *)&dword_10002C900 == 0.0 || (unsigned __int16)word_10002C8FC + 1 != a1)
    {
      if ((_DWORD)a4)
      {
        v13 = (_DWORD *)qword_10002C920;
        if (qword_10002C920 || (v13 = malloc_type_malloc(0xDB8uLL, 0x1020040D1459293uLL)) != 0)
        {
          bzero(v13, 0xDB8uLL);
          v13[8] = 2;
          v13[3] = v8;
          v13[4] = v9;
          v13[2] = v10;
          qword_10002C920 = (uint64_t)v13;
          return v13;
        }
LABEL_20:
        sub_100001E38("out of memory", v14, v15, v16, v17, v18, v19, v20, v23);
      }
      return 0;
    }
  }
  v13 = (_DWORD *)*v11;
  if (!*v11)
  {
LABEL_14:
    if ((_DWORD)a4)
    {
      v21 = malloc_type_malloc(0xDB8uLL, 0x1020040D1459293uLL);
      if (v21)
      {
        v13 = v21;
        bzero(v21, 0xDB8uLL);
        v13[8] = 2;
        v13[3] = v8;
        v13[4] = v9;
        v13[2] = v10;
        *(_QWORD *)v13 = *v11;
        *v11 = (uint64_t)v13;
        return v13;
      }
      goto LABEL_20;
    }
    return 0;
  }
  while (v13[2] != (_DWORD)a2 || v13[4] != (_DWORD)a3)
  {
    v13 = *(_DWORD **)v13;
    if (!v13)
      goto LABEL_14;
  }
  if ((v13[5] & a4) != 0)
    sub_100001E38("Duplicate PDC table (bin=%d temp=%d bright=%d chan=%X) found in input.", a2, a3, a4, a5, a6, a7, a8, a1);
  return v13;
}

__int32 *sub_1000079AC(__int32 __c, __int32 *__s, unsigned __int16 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v9;
  __int32 *v12;
  __int32 *result;
  __int32 *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 v17;
  char v18;
  char v19;

  v9 = *a3;
  if (v9 == 20)
    sub_100001E38("Too many index values for CLUT tables", (uint64_t)__s, 20, a4, a5, a6, a7, a8, v18);
  v12 = &__s[v9];
  result = wmemchr(__s, __c, v9);
  if (result)
    v14 = result;
  else
    v14 = v12;
  v15 = v14 - __s;
  v16 = *a3;
  if (v15 == v16)
  {
    v17 = v16 + 1;
    *a3 = v17;
    __s[v15] = __c;
    v19 = -86;
    return (__int32 *)std::__sort<std::__less<int,int> &,int *>(__s, &__s[v17], &v19);
  }
  return result;
}

uint64_t sub_100007A48(uint64_t result, uint64_t a2, _WORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  char vars0;

  v8 = (unsigned __int16)*a3;
  if (v8 == 20)
    sub_100001E38("Too many index values for CLUT tables", a2, (uint64_t)a3, a4, a5, a6, a7, a8, vars0);
  if (*a3)
  {
    v9 = 0;
    while (1)
    {
      v10 = *(_DWORD *)(a2 + 4 * v9);
      if (v10 == (_DWORD)result)
        break;
      if (v10 > (int)result)
        goto LABEL_9;
      if (v8 == ++v9)
      {
        LODWORD(v9) = (unsigned __int16)*a3;
        goto LABEL_12;
      }
    }
  }
  else
  {
    LODWORD(v9) = 0;
LABEL_9:
    if (v9 < v8)
    {
      v11 = (unsigned __int16)*a3;
      v12 = v11;
      do
      {
        *(_DWORD *)(a2 + 4 * (unsigned __int16)v12--) = *(_DWORD *)(a2 + 4 * (v11 - 1));
        v11 = (unsigned __int16)v12;
      }
      while ((unsigned __int16)v12 > (unsigned __int16)v9);
    }
LABEL_12:
    *(_DWORD *)(a2 + 4 * v9) = result;
    *a3 = v8 + 1;
  }
  return result;
}

uint64_t sub_100007ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9)
{
  uint64_t v9;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _WORD *v17;
  uint64_t v18;
  unsigned __int16 *v19;
  unsigned __int16 *v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  unsigned __int16 *v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int *v45;
  uint64_t v46;
  _QWORD *v47;
  char v48;

  v9 = qword_100047AB8;
  if (!qword_100047AB8)
LABEL_35:
    sub_100001E38("missing entry", a2, a3, a4, a5, a6, a7, a8, v48);
  v12 = *((_DWORD *)&unk_100047870 + a4);
  v13 = *((_DWORD *)&unk_100047870 + a5 + 20);
  v14 = qword_100047AB8;
  while (*(_DWORD *)(v14 + 76) != v12
       || *(_DWORD *)(v14 + 80) != v13
       || *(_DWORD *)(v14 + 72) != dword_100047868[a3 + 109])
  {
    v14 = *(_QWORD *)v14;
    if (!v14)
      goto LABEL_35;
  }
  if (a9 == 0.0)
  {
    v9 = 0;
  }
  else
  {
    while (*(_DWORD *)(v9 + 76) != v12
         || *(_DWORD *)(v9 + 80) != v13
         || *(_DWORD *)(v9 + 72) != *((_DWORD *)&qword_10002C000 + a3 + 28296))
    {
      v9 = *(_QWORD *)v9;
      if (!v9)
        goto LABEL_35;
    }
  }
  v15 = 0;
  v16 = 6;
  if (*(_WORD *)(a1 + 58) != 1)
    v16 = 0;
  v17 = (_WORD *)(a2 + v16);
  LOWORD(v16) = *(_WORD *)(a1 + 50);
  do
  {
    *(_DWORD *)(*(_QWORD *)a1 + 16 * (unsigned __int16)v16) = *(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 24);
    v18 = *(_QWORD *)(v14 + 8 * v15 + 24);
    *(_QWORD *)(a1 + 8) = 0;
    if (v9)
    {
      v19 = (unsigned __int16 *)(v18 + 10);
      v20 = (unsigned __int16 *)(*(_QWORD *)(v9 + 8 * v15 + 24) + 10);
      v21 = 4913;
      do
      {
        v23 = *v19++;
        v22 = v23;
        v24 = *v20++;
        v25 = (int)((float)((float)v22 + (float)(a9 * (float)(int)(v24 - v22))) + 0.5);
        sub_100008028(a1, v25, a3, a4, a5, a6, a7, a8);
        result = sub_100008028(a1, v25 >> 8, v26, v27, v28, v29, v30, v31);
        --v21;
      }
      while (v21);
    }
    else
    {
      v33 = (unsigned __int16 *)(v18 + 10);
      v34 = 4913;
      do
      {
        v35 = *v33++;
        sub_100008028(a1, v35, a3, a4, a5, a6, a7, a8);
        result = sub_100008028(a1, v35 >> 8, v36, v37, v38, v39, v40, v41);
        --v34;
      }
      while (v34);
    }
    v42 = *(_QWORD *)a1;
    v43 = *(_QWORD *)(a1 + 8);
    v44 = *(unsigned __int16 *)(a1 + 50);
    v45 = (unsigned int *)(*(_QWORD *)a1 + 16 * v44);
    *((_QWORD *)v45 + 1) = v43;
    if (v44)
    {
      v46 = 0;
      v47 = (_QWORD *)(v42 + 8);
      while (1)
      {
        if (*v47 == v43)
        {
          result = memcmp((const void *)(*(_QWORD *)(a1 + 24) + *((unsigned int *)v47 - 2)), (const void *)(*(_QWORD *)(a1 + 24) + *v45), 0x2662uLL);
          if (!(_DWORD)result)
            break;
        }
        ++v46;
        v47 += 2;
        if (v44 == v46)
          goto LABEL_26;
      }
      LOWORD(v44) = v46;
    }
LABEL_26:
    *v17++ = v44;
    v16 = *(unsigned __int16 *)(a1 + 50);
    if ((_DWORD)v16 == (unsigned __int16)v44)
    {
      LOWORD(v16) = v44 + 1;
      *(_WORD *)(a1 + 50) = v44 + 1;
    }
    else
    {
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a1 + 24) + *(unsigned int *)(*(_QWORD *)a1 + 16 * v16);
    }
    ++v15;
  }
  while (v15 != 3);
  return result;
}

uint64_t sub_100007D54(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9)
{
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  int v18;
  size_t v19;
  int v20;
  char *v21;
  int v22;
  _BOOL4 v23;
  char *v24;
  size_t v25;
  unsigned int v26;
  BOOL v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v53;

  v9 = qword_100047AB8;
  if (!qword_100047AB8)
LABEL_46:
    sub_100001E38("missing entry", a2, a3, a4, a5, a6, a7, a8, v50);
  v10 = result;
  v11 = *((_DWORD *)&unk_100047870 + a4);
  v12 = *((_DWORD *)&unk_100047870 + a5 + 20);
  v13 = qword_100047AB8;
  while (*(_DWORD *)(v13 + 76) != v11
       || *(_DWORD *)(v13 + 80) != v12
       || *(_DWORD *)(v13 + 72) != dword_100047868[a3 + 109])
  {
    v13 = *(_QWORD *)v13;
    if (!v13)
      goto LABEL_46;
  }
  if (a9 == 0.0)
  {
    v9 = 0;
  }
  else
  {
    while (*(_DWORD *)(v9 + 76) != v11
         || *(_DWORD *)(v9 + 80) != v12
         || *(_DWORD *)(v9 + 72) != *((_DWORD *)&qword_10002C000 + a3 + 28296))
    {
      v9 = *(_QWORD *)v9;
      if (!v9)
        goto LABEL_46;
    }
  }
  v14 = 0;
  v51 = v9;
  do
  {
    *(_QWORD *)(v10 + 8) = 0;
    v15 = *(_QWORD *)(v13 + 8 * v14 + 48);
    if (v9 && v15 != *(_QWORD *)(v9 + 8 * v14 + 48))
      sub_100001E38("No support curve interpolation", a2, a3, a4, a5, a6, a7, a8, v50);
    v53 = v14;
    v16 = *(_QWORD *)(v10 + 32);
    v17 = *(char **)(v10 + 40);
    if ((unint64_t)v17 < v16)
    {
      v18 = 0;
      v19 = *(unsigned __int16 *)(v15 + 12);
      while (1)
      {
        v20 = *v17;
        v21 = v17 + 3;
        v22 = *(unsigned __int16 *)(v17 + 1);
        if ((_DWORD)v19 == v22)
        {
          result = memcmp(*(const void **)(v15 + 16), v21, v19);
          v23 = result == 0;
        }
        else
        {
          v23 = 0;
        }
        v17 = &v21[v22];
        if (v20 == 1)
        {
          v26 = *(unsigned __int16 *)v17;
          v24 = v17 + 2;
          v25 = v26;
          if (*(unsigned __int16 *)(v15 + 14) == v26)
          {
            result = memcmp(*(const void **)(v15 + 24), v24, v25);
            v27 = (_DWORD)result == 0;
          }
          else
          {
            v27 = 0;
          }
          v17 = &v24[v25];
          if (!v23)
            goto LABEL_28;
        }
        else
        {
          v27 = 1;
          if (!v23)
            goto LABEL_28;
        }
        if (v20 != *(unsigned __int8 *)(v15 + 8))
          v27 = 0;
        if (v27)
          goto LABEL_31;
LABEL_28:
        ++v18;
        if ((unint64_t)v17 >= v16)
          goto LABEL_31;
      }
    }
    v18 = 0;
LABEL_31:
    if (v18 == *(unsigned __int16 *)(v10 + 54))
    {
      sub_100008028(v10, *(unsigned __int8 *)(v15 + 8), a3, a4, a5, a6, a7, a8);
      v28 = *(unsigned __int16 *)(v15 + 12);
      sub_100008028(v10, *(_WORD *)(v15 + 12), v29, v30, v31, v32, v33, v34);
      result = sub_100008028(v10, v28 >> 8, v35, v36, v37, v38, v39, v40);
      if (*(_WORD *)(v15 + 12))
      {
        v41 = 0;
        do
          result = sub_100008028(v10, *(unsigned __int8 *)(*(_QWORD *)(v15 + 16) + v41++), a3, a4, a5, a6, a7, a8);
        while (v41 < *(unsigned __int16 *)(v15 + 12));
      }
      if (*(_BYTE *)(v15 + 8) == 1)
      {
        v42 = *(unsigned __int16 *)(v15 + 14);
        sub_100008028(v10, *(_WORD *)(v15 + 14), a3, a4, a5, a6, a7, a8);
        result = sub_100008028(v10, v42 >> 8, v43, v44, v45, v46, v47, v48);
        if (*(_WORD *)(v15 + 14))
        {
          v49 = 0;
          do
            result = sub_100008028(v10, *(unsigned __int8 *)(*(_QWORD *)(v15 + 24) + v49++), a3, a4, a5, a6, a7, a8);
          while (v49 < *(unsigned __int16 *)(v15 + 14));
        }
      }
      ++*(_WORD *)(v10 + 54);
    }
    *(_WORD *)(a2 + 2 * v53) = v18;
    v14 = v53 + 1;
    v9 = v51;
  }
  while (v53 != 2);
  return result;
}

uint64_t sub_100008028(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v8;
  char vars0;

  v8 = *(_BYTE **)(result + 32);
  if ((uint64_t)&v8[-*(_QWORD *)(result + 24)] >= *(unsigned int *)(result + 16))
    sub_100001E38("output buffer overflow", a2, a3, a4, a5, a6, a7, a8, vars0);
  *(_QWORD *)(result + 32) = v8 + 1;
  *v8 = a2;
  *(_QWORD *)(result + 8) = a2 ^ __ROR8__(*(_QWORD *)(result + 8), 7);
  return result;
}

void sub_100008074(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_1000080B4((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_1000080B4(uint64_t *a1)
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

uint64_t sub_100008100(uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6;

  v6 = std::streambuf::basic_streambuf();
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  sub_100008190(a1);
  return a1;
}

void sub_10000816C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 87) < 0)
    operator delete(*v2);
  std::streambuf::~streambuf(v1);
  _Unwind_Resume(a1);
}

void sub_100008190(uint64_t a1)
{
  std::string *v2;
  char v3;
  std::string *v4;
  unint64_t v5;
  int v6;
  std::string::size_type v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)(a1 + 88) = 0;
  v2 = (std::string *)(a1 + 64);
  v3 = *(_BYTE *)(a1 + 87);
  if (v3 < 0)
  {
    v4 = *(std::string **)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 72);
  }
  else
  {
    v4 = v2;
    v5 = *(unsigned __int8 *)(a1 + 87);
  }
  v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    v7 = v3 < 0 ? (*(_QWORD *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    v8 = *(char *)(a1 + 87) < 0 ? *(_QWORD *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(_QWORD *)(a1 + 40) = v4;
    *(_QWORD *)(a1 + 48) = v4;
    *(_QWORD *)(a1 + 56) = (char *)v4 + v8;
    if ((*(_BYTE *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        v5 = v5 - v10 - 0x7FFFFFFF;
        *(_QWORD *)(a1 + 48) = v4;
      }
      if (v5)
        *(_QWORD *)(a1 + 48) = (char *)v4 + v5;
    }
  }
}

uint64_t sub_1000082A0(uint64_t *a1, __int128 *a2)
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
    sub_100008578();
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
    v10 = (char *)sub_10000858C(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_1000083C8(v11, *(void **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    *((_QWORD *)v11 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v11 = v12;
  }
  v16 = v11 + 24;
  sub_100008504(a1, v15);
  v13 = a1[1];
  sub_1000086E8((uint64_t)v15);
  return v13;
}

void sub_1000083B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1000086E8((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void *sub_1000083C8(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_100008454();
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

void sub_100008454()
{
  sub_100008468("basic_string");
}

void sub_100008468(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000084B8(exception, a1);
}

void sub_1000084A4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1000084B8(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_1000084DC()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_100008504(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1000085D0((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void sub_100008578()
{
  sub_100008468("vector");
}

void *sub_10000858C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_1000084DC();
  return operator new(24 * a2);
}

uint64_t sub_1000085D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  unint64_t v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  v13 = 0xAAAAAAAAAAAAAAAALL;
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
  LOBYTE(v13) = 1;
  sub_100008670((uint64_t)v12);
  return a6;
}

uint64_t sub_100008670(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1000086A4(a1);
  return a1;
}

void sub_1000086A4(uint64_t a1)
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

uint64_t sub_1000086E8(uint64_t a1)
{
  sub_10000871C(a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_10000871C(uint64_t a1, void **a2)
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

uint64_t sub_100008770(uint64_t a1)
{
  bzero((void *)a1, 0x18uLL);
  bzero((void *)(a1 + 24), 0xF30uLL);
  bzero((void *)(a1 + 3912), 0x98uLL);
  return a1;
}

__n128 sub_1000087B4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_1000087C8(uint64_t a1, int *a2, int *a3)
{
  int v3;
  int v4;
  int v5;
  BOOL v6;
  unsigned int v7;

  v3 = *a2;
  *a3 = *a2;
  v4 = a2[1];
  a3[1] = v4;
  v5 = a2[2];
  a3[2] = v5;
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v7 = !v6;
  if (v3)
    return v7;
  else
    return 0;
}

uint64_t sub_1000087F8(uint64_t a1, int *a2)
{
  int *v2;
  int v3;
  int v4;
  int v5;

  v2 = *(int **)(a1 + 3896);
  v3 = *v2;
  *a2 = *v2;
  v4 = v2[1];
  a2[1] = v4;
  v5 = v2[2];
  a2[2] = v5;
  if (!v3)
    return 0;
  if (!v4 || v5 == 0)
    return 0;
  *(_QWORD *)(a1 + 3896) = v2 + 3;
  return 1;
}

uint64_t sub_10000883C(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t result;

  switch(a3)
  {
    case 1:
      result = *(unsigned __int8 *)a2;
      break;
    case 2:
      result = *(unsigned __int16 *)a2;
      break;
    case 3:
      result = *a2 & 0xFFFFFF;
      break;
    case 4:
      result = *a2;
      break;
    default:
      result = 0xFFFFFFFFLL;
      break;
  }
  return result;
}

uint64_t sub_10000888C(uint64_t a1, unsigned __int8 *a2, int a3)
{
  unsigned int v3;

  v3 = -1;
  switch(a3)
  {
    case 1:
      return *a2;
    case 2:
      return *(unsigned __int16 *)a2;
    case 3:
      return *(_DWORD *)a2 & 0xFFFFFF;
    case 4:
      return *(unsigned int *)a2;
    case 8:
      return *(_QWORD *)a2;
    default:
      return v3;
  }
}

uint64_t sub_1000088E4(uint64_t a1, unsigned int a2)
{
  _DWORD *v2;
  uint64_t v3;

  v2 = *(_DWORD **)(a1 + 3896);
  switch(a2)
  {
    case 1u:
      v3 = *(unsigned __int8 *)v2;
      break;
    case 2u:
      v3 = *(unsigned __int16 *)v2;
      break;
    case 3u:
      v3 = *v2 & 0xFFFFFF;
      break;
    case 4u:
      v3 = *v2;
      break;
    default:
      v3 = 0xFFFFFFFFLL;
      break;
  }
  *(_QWORD *)(a1 + 3896) = (char *)v2 + a2;
  return v3;
}

uint64_t sub_100008944(uint64_t a1, unsigned int a2)
{
  _DWORD *v2;
  uint64_t v3;

  v2 = *(_DWORD **)(a1 + 3896);
  LODWORD(v3) = -1;
  switch(a2)
  {
    case 1u:
      LODWORD(v3) = *(unsigned __int8 *)v2;
      goto LABEL_6;
    case 2u:
      LODWORD(v3) = *(unsigned __int16 *)v2;
      goto LABEL_6;
    case 3u:
      LODWORD(v3) = *v2 & 0xFFFFFF;
      goto LABEL_6;
    case 4u:
      LODWORD(v3) = *v2;
      goto LABEL_6;
    case 8u:
      v3 = *(_QWORD *)v2;
      goto LABEL_7;
    default:
LABEL_6:
      v3 = v3;
LABEL_7:
      *(_QWORD *)(a1 + 3896) = (char *)v2 + a2;
      return v3;
  }
}

uint64_t sub_1000089AC(uint64_t result, unsigned int a2)
{
  *(_QWORD *)(result + 3896) += a2;
  return result;
}

void sub_1000089BC(float a1, uint64_t a2, uint64_t a3, int a4, __int16 *a5, float *a6)
{
  uint64_t v6;
  __int16 v7;
  float v8;

  if (!a4)
  {
    LODWORD(v6) = 0;
    if (!a5)
      goto LABEL_11;
    goto LABEL_7;
  }
  v6 = 0;
  while (*(float *)(a3 + 4 * v6) < a1)
  {
    if (a4 == ++v6)
    {
      LODWORD(v6) = a4;
      break;
    }
  }
  if (a5)
  {
LABEL_7:
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    *a5 = v7;
  }
LABEL_11:
  if (a6)
  {
    v8 = 0.0;
    if ((int)v6 - 1 < (a4 - 2))
      v8 = (float)(a1 - *(float *)(a3 + 4 * (v6 - 1)))
         / (float)(*(float *)(a3 + 4 * v6) - *(float *)(a3 + 4 * (v6 - 1)));
    *a6 = v8;
  }
}

uint64_t sub_100008A34(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v5;
  float v6;
  uint64_t v7;
  unsigned int v8;
  __int16 v9;
  float v10;

  v5 = result;
  v6 = *(float *)(result + 2140);
  if (v6 != 0.0)
  {
    if (a3)
      goto LABEL_3;
LABEL_10:
    LODWORD(v7) = 0;
    goto LABEL_11;
  }
  result = (*(uint64_t (**)(const __CFString *, _QWORD))(result + 8))(CFSTR("FFR_raw_index"), *(_QWORD *)(result + 16));
  v6 = (float)result * 0.000015259;
  if ((_DWORD)result == -1)
    v6 = 0.5;
  if (!a3)
    goto LABEL_10;
LABEL_3:
  v7 = 0;
  while (*(float *)(a2 + 4 * v7) < v6)
  {
    if (a3 == ++v7)
    {
      LODWORD(v7) = a3;
      break;
    }
  }
LABEL_11:
  v8 = v7 - 1;
  if (v7 <= 1)
    v9 = 1;
  else
    v9 = v7;
  *(_WORD *)(v5 + 2128) = v9;
  v10 = 0.0;
  if (v8 < a3 - 2)
    v10 = (float)(v6 - *(float *)(a2 + 4 * v8))
        / (float)(*(float *)(a2 + 4 * v7) - *(float *)(a2 + 4 * v8));
  *(float *)(v5 + 2132) = v10;
  *(_BYTE *)(v5 + 2136) = 1;
  return result;
}

uint64_t sub_100008B08(uint64_t a1, uint64_t a2, uint64_t a3, int a4, float a5)
{
  float v10;
  unsigned int v11;
  float v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  float v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  uint64_t result;
  int v23;
  float v24;

  v10 = *(float *)(a1 + 2140);
  if (v10 == 0.0)
  {
    v11 = (*(uint64_t (**)(const __CFString *, _QWORD))(a1 + 8))(CFSTR("FFR_raw_index"), *(_QWORD *)(a1 + 16));
    if (v11 == -1)
      v10 = 0.5;
    else
      v10 = (float)v11 * 0.000015259;
  }
  v12 = *(float *)(a1 + 2144);
  if (v12 != 0.0)
  {
    if (a4)
      goto LABEL_7;
LABEL_14:
    LODWORD(v13) = 0;
    goto LABEL_15;
  }
  v14 = (*(uint64_t (**)(const __CFString *, _QWORD))(a1 + 8))(CFSTR("FFR_raw_high_index"), *(_QWORD *)(a1 + 16));
  v12 = (float)v14 * 0.000015259;
  if (v14 == -1)
    v12 = 0.5;
  if (!a4)
    goto LABEL_14;
LABEL_7:
  v13 = 0;
  while (*(float *)(a2 + 4 * v13) < v10)
  {
    if (a4 == ++v13)
    {
      LODWORD(v13) = a4;
      break;
    }
  }
LABEL_15:
  v15 = a4 - 2;
  v16 = 0.0;
  if ((int)v13 - 1 < (a4 - 2))
    v16 = (float)(v10 - *(float *)(a2 + 4 * (v13 - 1)))
        / (float)(*(float *)(a2 + 4 * v13) - *(float *)(a2 + 4 * (v13 - 1)));
  if (a4)
  {
    v17 = 0;
    while (*(float *)(a3 + 4 * v17) < v12)
    {
      if (a4 == ++v17)
      {
        LODWORD(v17) = a4;
        break;
      }
    }
  }
  else
  {
    LODWORD(v17) = 0;
  }
  v18 = 0.0;
  if ((int)v17 - 1 < v15)
    v18 = (float)(v12 - *(float *)(a3 + 4 * (v17 - 1)))
        / (float)(*(float *)(a3 + 4 * v17) - *(float *)(a3 + 4 * (v17 - 1)));
  if (v17 <= 1)
    LOWORD(v17) = 1;
  if (v13 <= 1)
    LOWORD(v13) = 1;
  v19 = v16 + (float)(unsigned __int16)v13;
  v20 = v18 + (float)(unsigned __int16)v17;
  v21 = (float)((float)(1.0 - a5) * v20) + (float)(a5 * v19);
  result = printf("i: PDC mix bin %g and bin %g with %g --> %g\n", v19, v20, a5, v21);
  *(_WORD *)(a1 + 2128) = v21;
  v23 = (unsigned __int16)v21;
  v24 = v21 - (float)v23;
  if (v23 > v15)
    v24 = 0.0;
  *(float *)(a1 + 2132) = v24;
  *(_BYTE *)(a1 + 2136) = 1;
  return result;
}

uint64_t sub_100008D00(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  BOOL v3;

  result = 0;
  if (a2)
  {
    do
    {
      if (a2 > 0x46u)
      {
        if (a2 == 71)
        {
          result = result | 2;
        }
        else
        {
          if (a2 != 82)
          {
LABEL_12:
            printf("e: Illegal channel code %c\n", a2);
            return 0;
          }
          result = result | 1;
        }
      }
      else if (a2 != 32)
      {
        if (a2 != 66)
          goto LABEL_12;
        result = result | 4;
      }
      v3 = a2 > 0xFF;
      a2 >>= 8;
    }
    while (v3);
  }
  return result;
}

_DWORD *sub_100008D8C(uint64_t a1, int a2, int a3, unsigned int a4, unsigned int a5, int a6, int a7, int a8)
{
  int v14;
  uint64_t v16;
  void *v17;
  _DWORD *v18;
  _DWORD *v19;
  uint64_t v20;
  _DWORD *v21;

  v14 = *(unsigned __int16 *)(a1 + 2128);
  if (v14 != a3 && (*(float *)(a1 + 2132) == 0.0 || v14 + 1 != a3))
  {
    if (a6)
    {
      v16 = *(_QWORD *)(a1 + 2216);
      if (v16)
      {
        if (*(_DWORD *)(v16 + 32) == 5)
        {
          v17 = *(void **)(v16 + 48);
          if (v17)
          {
            *(_QWORD *)(v16 + 48) = 0;
            free(v17);
            v16 = *(_QWORD *)(a1 + 2216);
          }
        }
        free((void *)v16);
        *(_QWORD *)(a1 + 2216) = 0;
      }
      v18 = malloc_type_calloc(1uLL, 0xDB8uLL, 0x1020040D1459293uLL);
      v19 = v18;
      if (v18)
      {
        bzero(v18, 0xDB8uLL);
        v19[8] = a2;
        v19[3] = a7;
        v19[4] = a5;
        v19[2] = a4;
        v19[6] = a8;
      }
      else
      {
        puts("e: Out of memory");
      }
      *(_QWORD *)(a1 + 2216) = v19;
      return v19;
    }
    return 0;
  }
  if (v14 == a3)
    v20 = 2200;
  else
    v20 = 2208;
  v19 = *(_DWORD **)(a1 + v20);
  if (!v19)
  {
LABEL_23:
    if (a6)
    {
      v21 = malloc_type_calloc(1uLL, 0xDB8uLL, 0x1020040D1459293uLL);
      v19 = v21;
      if (v21)
      {
        bzero(v21, 0xDB8uLL);
        v19[8] = a2;
        v19[3] = a7;
        v19[4] = a5;
        v19[2] = a4;
        v19[6] = a8;
        *(_QWORD *)v19 = *(_QWORD *)(a1 + v20);
        *(_QWORD *)(a1 + v20) = v19;
      }
      else
      {
        puts("e: Out of memory");
      }
      return v19;
    }
    return 0;
  }
  while (v19[2] != a4 || v19[4] != a5 || v19[6] != a8 || v19[3] != a7)
  {
    v19 = *(_DWORD **)v19;
    if (!v19)
      goto LABEL_23;
  }
  if ((v19[5] & a6) != 0)
  {
    printf("e: Duplicate PDC table (bin=%d temp=%d bright=%d sf=%d param=%d chan=%X) found in input.\n", a3, HIWORD(a4), HIWORD(a5), a7, a8, a6);
    return 0;
  }
  return v19;
}

void sub_100008F74(uint64_t a1, uint64_t a2)
{
  void *v2;

  if (*(_DWORD *)a2 == 5)
  {
    v2 = *(void **)(a2 + 16);
    if (v2)
    {
      *(_QWORD *)(a2 + 16) = 0;
      free(v2);
    }
  }
}

uint64_t *sub_100008F94(uint64_t a1, int a2, int a3, int a4, int a5)
{
  uint64_t v5;
  uint64_t *result;

  v5 = 3608;
  if (*(_DWORD *)(a1 + 3564) == a5)
    v5 = 3600;
  for (result = *(uint64_t **)(a1 + v5); result; result = (uint64_t *)*result)
  {
    if (*((_DWORD *)result + 664) == a2 && *((_DWORD *)result + 665) == a3 && *((_DWORD *)result + 666) == a4)
      break;
  }
  return result;
}

_WORD *sub_100008FE0(uint64_t a1, int a2, int a3)
{
  __int16 v3;
  uint64_t *i;
  int v6;
  _WORD *v7;
  _WORD *v8;

  v3 = a2;
  for (i = *(uint64_t **)(a1 + 3776); i; i = (uint64_t *)*i)
  {
    if (*((unsigned __int16 *)i + 4) == a2)
    {
      v6 = *(_DWORD *)((char *)i + 10);
      if (v6 == 2)
      {
        if (*((unsigned __int16 *)i + 16) == a3)
        {
LABEL_11:
          printf("e: Duplicate PTUC table vers=%d (bright=%d, temp=%d) found in input.\n", v6, a2, a3);
          return 0;
        }
      }
      else if (v6 == 1)
      {
        goto LABEL_11;
      }
    }
  }
  v7 = malloc_type_calloc(1uLL, 0x20F8uLL, 0x10200406EB0A314uLL);
  v8 = v7;
  if (v7)
  {
    bzero(v7, 0x20F8uLL);
    v8[4] = v3;
    *(_QWORD *)v8 = *(_QWORD *)(a1 + 3776);
    *(_QWORD *)(a1 + 3776) = v8;
  }
  else
  {
    puts("e: Out of memory");
  }
  return v8;
}

uint64_t sub_1000090C8(uint64_t a1, int a2)
{
  return (a2 & 0xFFFFC000) + (((a2 & 0x3FFF) != 0) << 14);
}

uint64_t sub_1000090DC(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;

  v3 = a1 + 8 * a3;
  v4 = *(_QWORD *)(v3 + 2488);
  if (v4)
  {
    v5 = *(uint64_t **)(v3 + 2488);
    while (*(_DWORD *)(a2 + 12) != *((_DWORD *)v5 + 3)
         || *(_DWORD *)(a2 + 8) != *((_DWORD *)v5 + 2)
         || *(_DWORD *)(a2 + 16) != *((_DWORD *)v5 + 4))
    {
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_7;
    }
    puts("e: duplicate tables");
    return 0;
  }
  else
  {
LABEL_7:
    *(_QWORD *)a2 = v4;
    *(_QWORD *)(v3 + 2488) = a2;
    return 1;
  }
}

uint64_t sub_100009158(uint64_t a1, int *a2, _DWORD *a3, unsigned int a4, int a5, _DWORD *a6)
{
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int *v10;
  uint64_t v11;
  _DWORD *v12;
  int v13;
  char v15[5];
  int v16;
  char v17;

  v17 = -86;
  v16 = -1431655766;
  v6 = (a2[2] - 3);
  if (a4 > v6)
    v7 = a5;
  else
    v7 = 0;
  if (a4 < v6)
    v8 = 1;
  else
    v8 = v7;
  if (v8 == 1)
  {
    v9 = *a2;
    v15[0] = HIBYTE(*a2);
    v15[1] = BYTE2(v9);
    v15[2] = BYTE1(v9);
    v15[3] = v9;
    v15[4] = 0;
    printf("e: invalid block length for block %s\n", v15);
  }
  else
  {
    if (a6)
      *a6 = v6;
    if ((_DWORD)v6)
    {
      v10 = *(int **)(a1 + 3896);
      v11 = v6;
      v12 = a3;
      do
      {
        v13 = *v10++;
        *v12++ = v13;
        --v11;
      }
      while (v11);
      *(_QWORD *)(a1 + 3896) = v10;
    }
    if (a4 > v6)
      bzero(&a3[v6], 4 * (a4 - v6));
  }
  return v8 ^ 1u;
}

char *sub_10000924C(uint64_t a1, int a2, char *a3)
{
  char *result;

  if (a3)
    result = a3;
  else
    result = &byte_100047D28;
  *result = HIBYTE(a2);
  result[1] = BYTE2(a2);
  result[2] = BYTE1(a2);
  result[3] = a2;
  result[4] = 0;
  return result;
}

uint64_t sub_100009280(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  __int128 v6;
  uint64_t v7;
  int *v8;
  float *v9;
  int v10;
  float v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  float v15;
  float v16;
  _OWORD v17[2];
  uint64_t v18;

  v18 = -1;
  *(_QWORD *)&v6 = -1;
  *((_QWORD *)&v6 + 1) = -1;
  v17[0] = v6;
  v17[1] = v6;
  v7 = (a3 + 1);
  if (a3 != -1)
  {
    v8 = *(int **)(result + 3896);
    v9 = (float *)v17;
    do
    {
      v10 = *v8++;
      *v9++ = (float)v10 * 0.000000059605;
      --v7;
    }
    while (v7);
    *(_QWORD *)(result + 3896) = v8;
  }
  if (*(_BYTE *)(a2 + 12))
  {
    v11 = *(float *)(a2 + 8);
  }
  else
  {
    result = (*(uint64_t (**)(uint64_t, _QWORD))(result + 8))(a4, *(_QWORD *)(result + 16));
    v11 = (float)(int)result * 0.000000059605;
  }
  v12 = 0;
  v13 = 0;
  if (v11 <= *(float *)v17)
    v11 = *(float *)v17;
  v14 = a3 - 1;
  if (v11 >= *((float *)v17 + (a3 - 1)))
    v11 = *((float *)v17 + v14);
  do
  {
    if (4 * (a3 - 1) == v12)
      goto LABEL_16;
    v15 = *(float *)((char *)v17 + v12 + 4);
    ++v13;
    v12 += 4;
  }
  while (v11 >= v15);
  v14 = v13 - 1;
  if (a3 == v13 || (v16 = *(float *)((char *)v17 + v12 - 4), v11 == v16))
  {
LABEL_16:
    *(_DWORD *)(a2 + 4) = 0;
    v13 = v14 + 1;
    goto LABEL_17;
  }
  *(float *)(a2 + 4) = (float)(v11 - v16) / (float)(*((float *)v17 + v13) - v16);
LABEL_17:
  *(_DWORD *)a2 = v13;
  return result;
}

uint64_t sub_1000093D4(uint64_t a1, unsigned int *a2, int a3, int a4)
{
  char v6;
  int v7;
  unsigned int v8;
  unsigned int *v9;
  uint64_t v10;
  _DWORD *v11;
  char v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int *v16;
  const char *v17;
  uint64_t v18;
  BOOL v19;
  const char *v20;
  const char *v21;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;

  v28 = 0;
  v27 = 0;
  if (*a2 != 1094992716)
  {
    LODWORD(v27) = bswap32(*a2);
    printf("e: unknown header block name %s\n");
LABEL_16:
    v12 = 0;
    return v12 & 1;
  }
  if (a3 != 4 * a2[2])
  {
    printf("e: data size %d mismatch header %d\n");
    goto LABEL_16;
  }
  v6 = 0;
  v7 = 0;
  v24 = 0;
  v8 = a3 - 12;
  v23 = 0;
  v26 = 0;
  v25 = 0;
  if ((a3 - 12) >= 0xC)
  {
    v6 = 0;
    v9 = a2 + 3;
    while (1)
    {
      while (1)
      {
        v23 = *(_QWORD *)v9;
        v10 = v9[2];
        v24 = v9[2];
        v11 = v9 + 3;
        if ((_DWORD)v23 == 1447382596)
          break;
        if ((sub_1000096F0((_QWORD *)a1, (uint64_t)v11, (int *)&v23) & 1) != 0)
        {
          v6 = 1;
        }
        else
        {
          LOBYTE(v25) = BYTE3(v23);
          BYTE1(v25) = BYTE2(v23);
          BYTE2(v25) = BYTE1(v23);
          *(_WORD *)((char *)&v25 + 3) = v23;
          printf("e: failed to process block %s\n", (const char *)&v25);
        }
        v7 = 0;
        v9 += v24;
        v8 -= 4 * v24;
        if (v8 <= 0xB)
          goto LABEL_31;
      }
      if (*v11 == a4)
        break;
      v9 += v10;
      v8 -= 4 * v10;
      if (v8 <= 0xB)
      {
        v7 = 0;
        goto LABEL_31;
      }
    }
    v13 = 4 * v10;
    v14 = v13 - 16;
    if (v13 != 16)
    {
      v15 = v8 - 16;
      v16 = v9 + 4;
      v17 = "?";
      while (1)
      {
        v23 = *(_QWORD *)v16;
        v18 = v16[2];
        v24 = v16[2];
        if (!(_DWORD)v23)
          break;
        if ((_DWORD)v18)
          v19 = 4 * v18 > (unint64_t)v14;
        else
          v19 = 1;
        if (v19)
        {
          LOBYTE(v25) = BYTE3(v23);
          BYTE1(v25) = BYTE2(v23);
          BYTE2(v25) = BYTE1(v23);
          *(_WORD *)((char *)&v25 + 3) = v23;
          v17 = (const char *)&v25;
          break;
        }
        if ((sub_1000096F0((_QWORD *)a1, (uint64_t)(v16 + 3), (int *)&v23) & 1) == 0)
        {
          LOBYTE(v25) = BYTE3(v23);
          BYTE1(v25) = BYTE2(v23);
          BYTE2(v25) = BYTE1(v23);
          *(_WORD *)((char *)&v25 + 3) = v23;
          printf("e: failed to process block %s\n", (const char *)&v25);
        }
        v16 += v24;
        v14 -= 4 * v24;
        if (!v14)
          goto LABEL_30;
      }
      printf("e: block %s not well formed size %d remaining %d\n", v17, v18, v15);
    }
LABEL_30:
    v7 = 1;
  }
LABEL_31:
  if (sub_100009CFC(a1) && (*(_WORD *)(a1 + 24) & 2) != 0 && sub_100009EA0(a1))
    sub_100009F5C((uint64_t (**)(uint64_t))a1);
  if (v7)
    v20 = "Found";
  else
    v20 = "Did not find";
  printf("VDCL: %s Vendor Specific Calibration Data for idx %d\n", v20, a4);
  if ((v6 & 1) != 0)
    v21 = "Found";
  else
    v21 = "Did not find";
  printf("VDCL: %s Global Calibration Data for idx %d\n", v21, a4);
  v12 = v7 | v6;
  return v12 & 1;
}

uint64_t sub_1000096F0(_QWORD *a1, uint64_t a2, int *a3)
{
  int v5;
  const char *v7;

  if (!a2)
  {
    v7 = "e: no data";
LABEL_12:
    puts(v7);
    return 0;
  }
  if (!*a1)
  {
    v7 = "e: no valid set block callback";
    goto LABEL_12;
  }
  a1[487] = a2;
  v5 = *a3;
  if (*a3 > 1280068947)
  {
    if (v5 <= 1347634764)
    {
      if (v5 <= 1346520175)
      {
        switch(v5)
        {
          case 1280068948:
            return sub_10000E380((uint64_t)a1, (uint64_t)a3);
          case 1346520132:
            return sub_10000DA80((uint64_t)a1, (uint64_t)a3);
          case 1346520147:
            return sub_10000DE20((uint64_t)a1, (uint64_t)a3);
        }
      }
      else if (v5 > 1346650991)
      {
        if (v5 == 1346650992)
          return sub_10000D8D0((uint64_t)a1, (uint64_t)a3);
        if (v5 == 1347634753)
          return sub_10000B284((uint64_t)a1, (uint64_t)a3);
      }
      else
      {
        if (v5 == 1346520176)
          return sub_10000D960((uint64_t)a1, (uint64_t)a3);
        if (v5 == 1346650979)
          return sub_10000D918((uint64_t)a1, (uint64_t)a3);
      }
      goto LABEL_80;
    }
    if (v5 > 1381520458)
    {
      if (v5 > 1431323499)
      {
        if (v5 == 1431323500)
          return sub_10000E2A0((uint64_t)a1, (uint64_t)a3);
        if (v5 == 1431523395)
          return sub_10000BCA8((uint64_t)a1, (uint64_t)a3);
      }
      else
      {
        if (v5 == 1381520459)
          return sub_10000D5D8((uint64_t)a1, (uint64_t)a3);
        if (v5 == 1414288195)
          return sub_10000B858((uint64_t)a1, (uint64_t)a3);
      }
LABEL_80:
      byte_100047D28 = HIBYTE(*a3);
      byte_100047D29 = BYTE2(v5);
      byte_100047D2A = BYTE1(v5);
      byte_100047D2B = v5;
      byte_100047D2C = 0;
      printf("e: unknown block name %s\n", &byte_100047D28);
      return 0;
    }
    if (v5 <= 1347704175)
    {
      if (v5 == 1347634765)
        return sub_10000BE54((uint64_t)a1, (uint64_t)a3);
      if (v5 == 1347704131)
        return sub_10000E63C((uint64_t)a1, (uint64_t)a3);
      goto LABEL_80;
    }
    if (v5 != 1347704176)
    {
      if (v5 == 1363498051)
        return sub_10000B674((uint64_t)a1, (uint64_t)a3);
      goto LABEL_80;
    }
    return sub_10000E4D8((uint64_t)a1, (uint64_t)a3);
  }
  if (v5 <= 1112298578)
  {
    if (v5 > 1097626439)
    {
      if (v5 > 1112293703)
      {
        if (v5 == 1112293704)
          return sub_10000AD5C((uint64_t)a1, (uint64_t)a3);
        if (v5 == 1112298320)
          return sub_10000C0A8((uint64_t)a1, (uint64_t)a3);
      }
      else
      {
        if (v5 == 1097626440)
          return sub_10000CAC4((uint64_t)a1, (uint64_t)a3);
        if (v5 == 1111703884)
          return sub_10000AAA8((uint64_t)a1, a2, (uint64_t)a3);
      }
      goto LABEL_80;
    }
    if (v5 == 538985281)
      return sub_10000C33C((uint64_t)a1, (uint64_t)a3);
    if (v5 == 542134851)
      return sub_10000C890((uint64_t)a1, (uint64_t)a3);
    if (v5 != 1095128135)
      goto LABEL_80;
    sub_10000E444((uint64_t)a1, (uint64_t)a3);
    return sub_10000E4D8((uint64_t)a1, (uint64_t)a3);
  }
  if (v5 > 1212632899)
  {
    if (v5 > 1230128194)
    {
      if (v5 == 1230128195)
        return sub_10000E844((uint64_t)a1, (uint64_t)a3);
      if (v5 == 1279479620)
        return sub_10000B228((uint64_t)a1, (uint64_t)a3);
    }
    else
    {
      if (v5 == 1212632900)
        return sub_10000D370((uint64_t)a1, (uint64_t)a3);
      if (v5 == 1213419587)
        return sub_10000B4E4((uint64_t)a1, (uint64_t)a3);
    }
    goto LABEL_80;
  }
  if (v5 > 1146110827)
  {
    if (v5 == 1146110828)
      return sub_10000BAC8((uint64_t)a1, (uint64_t)a3);
    if (v5 == 1162630739)
      return sub_10000ECE0((uint64_t)a1, (uint64_t)a3);
    goto LABEL_80;
  }
  if (v5 != 1112298579)
  {
    if (v5 == 1145195841)
      return sub_10000D144((uint64_t)a1, (uint64_t)a3);
    goto LABEL_80;
  }
  return sub_10000D468((uint64_t)a1, (uint64_t)a3);
}

BOOL sub_100009CFC(uint64_t a1)
{
  unint64_t v1;
  BOOL v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  unsigned __int16 *v8;
  unsigned int v9;
  unsigned __int16 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;

  v1 = 0;
  v2 = 0;
  v3 = 0;
  v4 = a1 + 2232;
  v5 = a1 + 2272;
  v6 = a1 + 2292;
  do
  {
    v7 = *(uint64_t **)(a1 + 8 * v1 + 2488);
    if (v7)
    {
      if (*(_DWORD *)(a1 + 88 * v1 + 2224) == 1)
      {
        v8 = (unsigned __int16 *)(a1 + 88 * v1);
        if (v8[1148] < v8[1150])
        {
          v18 = "e: not enough durations provided for LUS LUTs";
LABEL_34:
          puts(v18);
          return v2;
        }
        v9 = 0;
        v10 = v8 + 1116;
        do
        {
          v11 = v10[31];
          if (v10[31])
          {
            v12 = 0;
            while (*(_DWORD *)(v4 + 4 * v12) != *((_DWORD *)v7 + 2))
            {
              if (v11 == ++v12)
                goto LABEL_12;
            }
            LODWORD(v11) = v12;
          }
LABEL_12:
          *((_DWORD *)v7 + 2) = v11;
          v13 = v10[32];
          if (v10[32])
          {
            v14 = 0;
            while (*((_DWORD *)v7 + 3) != *(unsigned __int16 *)(v5 + 2 * v14))
            {
              if (v13 == ++v14)
                goto LABEL_18;
            }
            LODWORD(v13) = v14;
          }
LABEL_18:
          *((_DWORD *)v7 + 3) = v13;
          v15 = v10[33];
          if (v10[33])
          {
            v16 = 0;
            while (*((_DWORD *)v7 + 4) != *(unsigned __int8 *)(v6 + v16))
            {
              if (v15 == ++v16)
                goto LABEL_24;
            }
            LODWORD(v15) = v16;
          }
LABEL_24:
          *((_DWORD *)v7 + 4) = v15;
          v7 = (uint64_t *)*v7;
          ++v9;
        }
        while (v7);
        if (v9 < (v10[34] * v10[33] - v10[34] + v10[32]) * v10[31])
        {
          v18 = "e: missing LUS LUTs";
          goto LABEL_34;
        }
      }
      v3 = 1;
    }
    v2 = v1 > 1;
    v4 += 88;
    v5 += 88;
    v6 += 88;
    ++v1;
  }
  while (v1 != 3);
  if ((v3 & 1) != 0)
    v17 = 2;
  else
    v17 = 0;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFFD | v17;
  return 1;
}

uint64_t sub_100009EA0(uint64_t a1)
{
  char v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;

  v2 = 0;
  v3 = 0;
  v6 = 0;
  while (!*(_QWORD *)(a1 + 8 * v3 + 2488))
  {
LABEL_5:
    v6 = ++v3;
    if (v3 >= 3)
      return v2 & 1;
  }
  v4 = a1 + 88 * v3;
  *(_DWORD *)(v4 + 2228) = *(_DWORD *)(v4 + 2224);
  if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, _QWORD))a1)(54, v4 + 2228, 76, &v6, 1, *(_QWORD *)(a1 + 16)) & 1) != 0)
  {
    puts("i: set LUS table config succeeded");
    v2 = 1;
    v3 = v6;
    goto LABEL_5;
  }
  puts("e: failed to set LUS table config");
  v2 = 0;
  return v2 & 1;
}

uint64_t sub_100009F5C(uint64_t (**a1)(uint64_t))
{
  uint64_t v2;
  char v3;
  int32x2_t *i;
  int32x2_t v6;
  __int32 v7;

  v2 = 0;
  v3 = 1;
  do
  {
    for (i = (int32x2_t *)a1[v2 + 311]; i; i = (int32x2_t *)*i)
    {
      i[3].i32[0] = (__int32)a1[11 * v2 + 278];
      v6 = vrev64_s32(i[1]);
      v7 = i[2].i32[0];
      if (((*a1)(53) & 1) == 0)
      {
        printf("e: failed to set LUS LUT [%d %d %d]\n", v6.i32[0], v6.i32[1], v7);
        v3 = 0;
      }
    }
    ++v2;
  }
  while (v2 != 3);
  if ((v3 & 1) != 0)
    puts("i: set LUS LUTs succeeded");
  return v3 & 1;
}

uint64_t sub_10000A078(uint64_t a1, int *a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;
  int v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;
  int *v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  __int16 v20;

  v20 = 0;
  v19 = 0;
  v4 = *a2;
  v3 = a2[1];
  v5 = a2[2];
  *(_WORD *)(a1 + 3814) = 0;
  if (v4 != 1094992716)
  {
    LOBYTE(v19) = HIBYTE(v4);
    BYTE1(v19) = BYTE2(v4);
    BYTE2(v19) = BYTE1(v4);
    *(_WORD *)((char *)&v19 + 3) = v4;
    printf("e: unknown header block name %s\n");
    return 0;
  }
  if (a3 != 4 * v5)
  {
    printf("e: data size %d mismatch header %d\n");
    return 0;
  }
  if (v3 == 327680)
    v7 = -36;
  else
    v7 = -12;
  v8 = v7 + a3;
  if (v7 + a3)
  {
    v9 = v3 == 327680;
    v10 = 3;
    if (v9)
      v10 = 9;
    v11 = &a2[v10];
    v12 = "?";
    while (1)
    {
      v17 = *(_QWORD *)v11;
      v13 = v11[2];
      v18 = v11[2];
      if (!(_DWORD)v17)
        break;
      if ((_DWORD)v13)
        v14 = 4 * v13 > (unint64_t)v8;
      else
        v14 = 1;
      if (v14)
      {
        LOBYTE(v19) = BYTE3(v17);
        BYTE1(v19) = BYTE2(v17);
        BYTE2(v19) = BYTE1(v17);
        *(_WORD *)((char *)&v19 + 3) = v17;
        v12 = (const char *)&v19;
        break;
      }
      if ((sub_1000096F0((_QWORD *)a1, (uint64_t)(v11 + 3), (int *)&v17) & 1) == 0)
      {
        LOBYTE(v19) = BYTE3(v17);
        BYTE1(v19) = BYTE2(v17);
        BYTE2(v19) = BYTE1(v17);
        *(_WORD *)((char *)&v19 + 3) = v17;
        printf("e: failed to process block %s\n", (const char *)&v19);
      }
      v11 += v18;
      v8 -= 4 * v18;
      if (!v8)
        goto LABEL_18;
    }
    printf("e: block %s not well formed size %d remaining %d\n", v12, v13, v8);
    v15 = 0;
  }
  else
  {
LABEL_18:
    v15 = 1;
  }
  sub_10000A284(a1);
  sub_10000A340(a1);
  sub_10000A56C(a1);
  puts("i: all done");
  return v15;
}

uint64_t sub_10000A284(uint64_t a1)
{
  int v2;
  _BOOL4 v3;
  _BOOL4 v4;
  int v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;

  v2 = sub_1000180A0(a1);
  v3 = sub_100009CFC(a1);
  v4 = sub_100018540(a1);
  v5 = sub_100015CB4(a1);
  v6 = sub_100015C30(a1);
  v7 = sub_1000186BC(a1);
  v8 = sub_1000189B0(a1);
  v9 = sub_100018AAC(a1);
  if (*(_QWORD *)(a1 + 3816))
    *(_WORD *)(a1 + 24) |= 0x100u;
  return v2 & v3 & v4 & v5 & v6 & v7 & v8 & v9;
}

uint64_t sub_10000A340(uint64_t result)
{
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  int v9;
  const char *v10;
  int v11;
  const char *v12;

  v1 = result;
  if ((*(_WORD *)(result + 24) & 1) != 0)
  {
    result = sub_100017300(result);
    if ((_DWORD)result)
      result = sub_10001737C(v1);
  }
  if ((*(_WORD *)(v1 + 24) & 2) != 0)
  {
    result = sub_100009EA0(v1);
    if ((_DWORD)result)
      result = sub_100009F5C((uint64_t (**)(uint64_t))v1);
  }
  if ((*(_WORD *)(v1 + 24) & 4) != 0)
  {
    *(_DWORD *)(v1 + 2516) = 1;
    v2 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))v1)(5, v1 + 2516, 308, 0, 0, *(_QWORD *)(v1 + 16));
    v3 = v2 ? "i: set PRC table config succeeded" : "e: failed to set PRC table config";
    result = puts(v3);
    if (v2)
      result = sub_100017968(v1);
  }
  v4 = *(_WORD *)(v1 + 24);
  if ((v4 & 8) != 0)
  {
    result = sub_100016344(v1);
    v4 = *(_WORD *)(v1 + 24);
    if ((v4 & 0x10) == 0)
    {
LABEL_15:
      if ((v4 & 0x20) == 0)
        goto LABEL_24;
      goto LABEL_19;
    }
  }
  else if ((v4 & 0x10) == 0)
  {
    goto LABEL_15;
  }
  result = sub_1000160EC(v1);
  if ((*(_WORD *)(v1 + 24) & 0x20) == 0)
    goto LABEL_24;
LABEL_19:
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))v1)(82, v1 + 2864, 544, 0, 0, *(_QWORD *)(v1 + 16));
  if (v5)
    v6 = "i: set prox table config succeeded";
  else
    v6 = "e: failed to set prox table config";
  result = puts(v6);
  if (v5)
    result = sub_100017AB8(v1);
LABEL_24:
  v7 = *(_WORD *)(v1 + 24);
  if ((v7 & 0x40) != 0)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))v1)(85, v1 + 3616, 72, 0, 0, *(_QWORD *)(v1 + 16)))
    {
      v8 = "i: set LLMT table config succeeded";
    }
    else
    {
      v8 = "e: failed to set LLMT table config";
    }
    result = puts(v8);
    v7 = *(_WORD *)(v1 + 24);
  }
  if ((v7 & 0x80) != 0)
  {
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))v1)(111, v1 + 3692, 76, 0, 0, *(_QWORD *)(v1 + 16));
    v10 = v9 ? "i: set PTUC table config succeeded" : "e: failed to set PTUC table config";
    result = puts(v10);
    if (v9)
      result = sub_100017FD8(v1);
  }
  if ((*(_WORD *)(v1 + 24) & 0x100) != 0)
  {
    *(_DWORD *)(v1 + 3788) = 1;
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))v1)(116, v1 + 3788, 28, 0, 0, *(_QWORD *)(v1 + 16));
    if (v11)
      v12 = "i: set ELVS table config succeeded";
    else
      v12 = "e: failed to set ELVS table config";
    result = puts(v12);
    if (v11)
      return sub_10000EE78(v1);
  }
  return result;
}

void sub_10000A56C(uint64_t a1)
{
  _QWORD *i;
  _QWORD *v3;
  void *v4;
  _QWORD *j;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t k;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t m;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  _QWORD *v49;

  for (i = *(_QWORD **)(a1 + 2200); i; *(_QWORD *)(a1 + 2200) = i)
  {
    v3 = i;
    i = (_QWORD *)*i;
    if (*((_DWORD *)v3 + 8) == 5)
    {
      v4 = (void *)v3[6];
      if (v4)
      {
        v3[6] = 0;
        free(v4);
        v3 = *(_QWORD **)(a1 + 2200);
      }
    }
    free(v3);
  }
  for (j = *(_QWORD **)(a1 + 2208); j; *(_QWORD *)(a1 + 2208) = j)
  {
    v6 = j;
    j = (_QWORD *)*j;
    if (*((_DWORD *)v6 + 8) == 5)
    {
      v7 = (void *)v6[6];
      if (v7)
      {
        v6[6] = 0;
        free(v7);
        v6 = *(_QWORD **)(a1 + 2208);
      }
    }
    free(v6);
  }
  v8 = *(_QWORD *)(a1 + 2216);
  if (v8)
  {
    if (*(_DWORD *)(v8 + 32) == 5)
    {
      v9 = *(void **)(v8 + 48);
      if (v9)
      {
        *(_QWORD *)(v8 + 48) = 0;
        free(v9);
        v8 = *(_QWORD *)(a1 + 2216);
      }
    }
    free((void *)v8);
  }
  for (k = 0; k != 3; ++k)
  {
    v11 = a1 + 8 * k;
    v12 = *(_QWORD **)(v11 + 2488);
    if (v12)
    {
      v13 = (_QWORD *)(v11 + 2488);
      do
      {
        v14 = (_QWORD *)*v12;
        free(v12);
        *v13 = v14;
        v12 = v14;
      }
      while (v14);
    }
  }
  for (m = 0; m != 5; ++m)
  {
    v16 = a1 + 8 * m;
    v17 = *(_QWORD **)(v16 + 3928);
    if (v17)
    {
      v18 = (_QWORD *)(v16 + 3928);
      do
      {
        v19 = (_QWORD *)*v17;
        free(v17);
        *v18 = v19;
        v17 = v19;
      }
      while (v19);
    }
  }
  bzero((void *)(a1 + 3912), 0x98uLL);
  v20 = *(_QWORD **)(a1 + 2824);
  if (v20)
  {
    do
    {
      v21 = (_QWORD *)*v20;
      free(v20);
      *(_QWORD *)(a1 + 2824) = v21;
      v20 = v21;
    }
    while (v21);
  }
  v22 = *(_QWORD **)(a1 + 3776);
  if (v22)
  {
    do
    {
      v23 = (_QWORD *)*v22;
      free(v22);
      *(_QWORD *)(a1 + 3776) = v23;
      v22 = v23;
    }
    while (v23);
  }
  v24 = *(_QWORD **)(a1 + 3816);
  if (v24)
  {
    do
    {
      v25 = (_QWORD *)*v24;
      free(v24);
      *(_QWORD *)(a1 + 3816) = v25;
      v24 = v25;
    }
    while (v25);
  }
  v26 = *(_QWORD *)(a1 + 3824);
  if (v26)
  {
    v27 = *(_QWORD **)v26;
    v28 = *(_QWORD **)(v26 + 8);
    if (*(_QWORD **)v26 == v28)
      goto LABEL_39;
    do
    {
      if (*v27)
        operator delete();
      ++v27;
    }
    while (v27 != v28);
    v26 = *(_QWORD *)(a1 + 3824);
    if (v26)
    {
      v27 = *(_QWORD **)v26;
LABEL_39:
      if (v27)
      {
        *(_QWORD *)(v26 + 8) = v27;
        operator delete(v27);
      }
      operator delete();
    }
  }
  v29 = *(_QWORD *)(a1 + 3832);
  if (v29)
  {
    v30 = *(_QWORD **)v29;
    v31 = *(_QWORD **)(v29 + 8);
    if (*(_QWORD **)v29 == v31)
      goto LABEL_49;
    do
    {
      if (*v30)
        operator delete();
      ++v30;
    }
    while (v30 != v31);
    v29 = *(_QWORD *)(a1 + 3832);
    if (v29)
    {
      v30 = *(_QWORD **)v29;
LABEL_49:
      if (v30)
      {
        *(_QWORD *)(v29 + 8) = v30;
        operator delete(v30);
      }
      operator delete();
    }
  }
  v32 = *(_QWORD *)(a1 + 3840);
  if (v32)
  {
    v33 = *(_QWORD **)v32;
    v34 = *(_QWORD **)(v32 + 8);
    if (*(_QWORD **)v32 == v34)
      goto LABEL_59;
    do
    {
      if (*v33)
        operator delete();
      ++v33;
    }
    while (v33 != v34);
    v32 = *(_QWORD *)(a1 + 3840);
    if (v32)
    {
      v33 = *(_QWORD **)v32;
LABEL_59:
      if (v33)
      {
        *(_QWORD *)(v32 + 8) = v33;
        operator delete(v33);
      }
      operator delete();
    }
  }
  v35 = *(_QWORD *)(a1 + 3848);
  if (v35)
  {
    v36 = *(_QWORD **)v35;
    v37 = *(_QWORD **)(v35 + 8);
    if (*(_QWORD **)v35 == v37)
      goto LABEL_69;
    do
    {
      if (*v36)
        operator delete();
      ++v36;
    }
    while (v36 != v37);
    v35 = *(_QWORD *)(a1 + 3848);
    if (v35)
    {
      v36 = *(_QWORD **)v35;
LABEL_69:
      if (v36)
      {
        *(_QWORD *)(v35 + 8) = v36;
        operator delete(v36);
      }
      operator delete();
    }
  }
  v38 = *(_QWORD *)(a1 + 3856);
  if (v38)
  {
    v39 = *(_QWORD **)v38;
    v40 = *(_QWORD **)(v38 + 8);
    if (*(_QWORD **)v38 == v40)
      goto LABEL_79;
    do
    {
      if (*v39)
        operator delete();
      ++v39;
    }
    while (v39 != v40);
    v38 = *(_QWORD *)(a1 + 3856);
    if (v38)
    {
      v39 = *(_QWORD **)v38;
LABEL_79:
      if (v39)
      {
        *(_QWORD *)(v38 + 8) = v39;
        operator delete(v39);
      }
      operator delete();
    }
  }
  v41 = *(_QWORD *)(a1 + 3864);
  if (v41)
  {
    v42 = *(_QWORD **)v41;
    v43 = *(_QWORD **)(v41 + 8);
    if (*(_QWORD **)v41 == v43)
      goto LABEL_89;
    do
    {
      if (*v42)
        operator delete();
      ++v42;
    }
    while (v42 != v43);
    v41 = *(_QWORD *)(a1 + 3864);
    if (v41)
    {
      v42 = *(_QWORD **)v41;
LABEL_89:
      if (v42)
      {
        *(_QWORD *)(v41 + 8) = v42;
        operator delete(v42);
      }
      operator delete();
    }
  }
  v44 = *(_QWORD *)(a1 + 3872);
  if (v44)
  {
    if (*(_BYTE *)(a1 + 2856))
      goto LABEL_94;
    v45 = *(_QWORD **)v44;
    v49 = *(_QWORD **)(v44 + 8);
    if (*(_QWORD **)v44 == v49)
    {
LABEL_95:
      if (v45)
      {
        *(_QWORD *)(v44 + 8) = v45;
        operator delete(v45);
      }
      operator delete();
    }
    do
    {
      if (*v45)
        operator delete();
      ++v45;
    }
    while (v45 != v49);
    v44 = *(_QWORD *)(a1 + 3872);
    if (v44)
    {
LABEL_94:
      v45 = *(_QWORD **)v44;
      goto LABEL_95;
    }
  }
  v46 = *(_QWORD *)(a1 + 3880);
  if (v46)
  {
    v47 = *(_QWORD **)v46;
    v48 = *(_QWORD **)(v46 + 8);
    if (*(_QWORD **)v46 == v48)
      goto LABEL_105;
    do
    {
      if (*v47)
        operator delete();
      ++v47;
    }
    while (v47 != v48);
    v46 = *(_QWORD *)(a1 + 3880);
    if (v46)
    {
      v47 = *(_QWORD **)v46;
LABEL_105:
      if (v47)
      {
        *(_QWORD *)(v46 + 8) = v47;
        operator delete(v47);
      }
      operator delete();
    }
  }
  sub_1000190BC((_QWORD *)a1);
  bzero((void *)(a1 + 24), 0xF30uLL);
}

uint64_t sub_10000AAA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  __int128 v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  int v21;
  size_t v22;
  void *v23;
  void *v24;
  const char *v25;
  __int128 v27;
  _BYTE v28[32];
  __int128 v29;
  __int128 v30;
  _BYTE v31[160];
  __int128 v32;
  __int128 v33;
  __int128 v34;

  if (!*(_BYTE *)(a1 + 3904))
    return 1;
  v3 = *(_DWORD *)(a3 + 8);
  if (v3 >> 2 > 0xCBC || *(_DWORD *)(a3 + 4) != 0x10000)
    return 0;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33 = v6;
  v34 = v6;
  *(_OWORD *)&v31[144] = v6;
  v32 = v6;
  *(_OWORD *)&v31[112] = v6;
  *(_OWORD *)&v31[128] = v6;
  *(_OWORD *)&v31[80] = v6;
  *(_OWORD *)&v31[96] = v6;
  *(_OWORD *)&v31[48] = v6;
  *(_OWORD *)&v31[64] = v6;
  *(_OWORD *)&v31[16] = v6;
  *(_OWORD *)&v31[32] = v6;
  *(_OWORD *)v31 = v6;
  *(_OWORD *)&v28[16] = v6;
  v29 = v6;
  v27 = v6;
  *(_OWORD *)v28 = v6;
  LODWORD(v27) = 1;
  WORD4(v27) = *(_WORD *)a2;
  v7 = *(_DWORD *)(a2 + 5) & 0xFFFFFF | 0xAA000000;
  HIDWORD(v27) = *(_DWORD *)(a2 + 2) & 0xFFFFFF | 0xAA000000;
  *(_DWORD *)v28 = v7;
  *(_DWORD *)&v28[4] = *(_DWORD *)(a2 + 8);
  *(_OWORD *)&v28[8] = *(_OWORD *)(a2 + 12);
  *(_QWORD *)&v28[24] = *(_QWORD *)(a2 + 28);
  v29 = *(_OWORD *)(a2 + 36);
  v30 = v6;
  v8 = *(_QWORD *)(a2 + 52);
  v9 = *(_QWORD *)(a2 + 60);
  *(_WORD *)v31 = *(_WORD *)(a2 + 68);
  *(_QWORD *)&v30 = v8;
  *((_QWORD *)&v30 + 1) = v9;
  *(_OWORD *)&v31[2] = *(_OWORD *)(a2 + 70);
  *(_QWORD *)&v31[18] = *(_QWORD *)(a2 + 86);
  *(_OWORD *)&v31[90] = *(_OWORD *)(a2 + 158);
  *(_OWORD *)&v31[106] = *(_OWORD *)(a2 + 174);
  *(_OWORD *)&v31[122] = *(_OWORD *)(a2 + 190);
  *(_QWORD *)&v31[138] = *(_QWORD *)(a2 + 206);
  *(_OWORD *)&v31[26] = *(_OWORD *)(a2 + 94);
  *(_OWORD *)&v31[42] = *(_OWORD *)(a2 + 110);
  *(_OWORD *)&v31[58] = *(_OWORD *)(a2 + 126);
  *(_OWORD *)&v31[74] = *(_OWORD *)(a2 + 142);
  v31[146] = *(_BYTE *)(a2 + 214);
  v10 = *(unsigned __int8 *)(a2 + 215);
  LOBYTE(v32) = *(_BYTE *)(a2 + 215);
  BYTE12(v32) = *(_BYTE *)(a2 + 216);
  if (v31[146])
  {
    memcpy(&v31[148], (const void *)(a2 + 217), 2 * v31[146]);
    v10 = v32;
    v11 = 2 * v31[146] + 217;
    v12 = v31[146];
    if ((_BYTE)v32)
    {
LABEL_6:
      v13 = v10;
      memcpy((char *)&v32 + 2, (const void *)(a2 + v11), 2 * v10);
      goto LABEL_10;
    }
  }
  else
  {
    v12 = 0;
    v11 = 217;
    if (v10)
      goto LABEL_6;
  }
  v13 = 0;
LABEL_10:
  v15 = 4 * v3;
  v16 = v13 + v12;
  v17 = BYTE12(v32);
  if (BYTE12(v32))
  {
    memcpy((char *)&v32 + 14, (const void *)(a2 + 2 * v16 + 217), 2 * BYTE12(v32));
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  v19 = v16 + v18;
  v20 = v31[146] + v10 * v17;
  DWORD2(v34) = ((v15 - 2 * v19 - 229) >> 1) / v20;
  v21 = v20 * DWORD2(v34);
  v22 = (2 * v21);
  HIDWORD(v33) = (v22 & 0xFFFFC000) + (((v21 & 0x1FFF) != 0) << 14);
  v23 = malloc_type_aligned_alloc(0x4000uLL, HIDWORD(v33), 0xB61E424AuLL);
  if (!v23)
  {
    puts("e: could not allocate memory for BCAL data");
    return 0;
  }
  v24 = v23;
  memcpy(v23, (const void *)(a2 + (2 * v19 + 217)), v22);
  *(_QWORD *)&v34 = v24;
  v14 = (*(uint64_t (**)(uint64_t, __int128 *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(46, &v27, 288, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v14)
    v25 = "i: set BCAL data succeeded";
  else
    v25 = "e: set BCAL data failed";
  puts(v25);
  free(v24);
  return v14;
}

uint64_t sub_10000AD5C(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned __int16 *v4;
  int v5;
  char *v6;
  char v7;
  __int16 v8;
  int v9;
  int v10;
  int v11;
  int v12;
  __int16 v13;
  uint64_t i;
  char *v15;
  char v16;
  char v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  int v27;
  __int16 *v28;
  uint64_t v29;
  __int16 v30;
  char v31;
  char v32;
  char v33;
  __int16 v34;
  __int16 v35;
  int v36;
  int v37;
  int v38;
  __int16 v39;
  char *v40;
  _DWORD v42[77];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  if (!*(_BYTE *)(a1 + 3904))
    return 1;
  v2 = *(_DWORD *)(a2 + 4);
  if (v2 < 0x30000)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    memset(&v42[1], 0, 304);
    v42[0] = 1;
    v4 = *(unsigned __int16 **)(a1 + 3896);
    v5 = *v4;
    *(_QWORD *)(a1 + 3896) = v4 + 1;
    printf("i: Processing BLAH format version %d data version %d\n", HIWORD(v2), v5);
    v6 = *(char **)(a1 + 3896);
    v7 = *v6;
    *(_QWORD *)(a1 + 3896) = v6 + 1;
    LOBYTE(v44) = v7;
    LOBYTE(v42[1]) = v6[1];
    WORD1(v44) = *((_WORD *)v6 + 1);
    v8 = *((_WORD *)v6 + 2);
    *(_QWORD *)(a1 + 3896) = v6 + 6;
    WORD2(v44) = v8;
    LOBYTE(v8) = v6[6];
    *(_QWORD *)(a1 + 3896) = v6 + 7;
    BYTE1(v42[1]) = v8;
    LOBYTE(v8) = v6[7];
    *(_QWORD *)(a1 + 3896) = v6 + 8;
    BYTE2(v42[1]) = v8;
    LOBYTE(v8) = v6[8];
    *(_QWORD *)(a1 + 3896) = v6 + 9;
    HIBYTE(v42[1]) = v8;
    LOBYTE(v42[2]) = v6[9];
    v42[3] = *(_DWORD *)(v6 + 10);
    v9 = v42[3];
    v10 = *(_DWORD *)(v6 + 14);
    DWORD2(v44) = v10;
    HIDWORD(v44) = *(_DWORD *)(v6 + 18);
    v11 = *(_DWORD *)(v6 + 22);
    LODWORD(v45) = v11;
    v12 = *(_DWORD *)(v6 + 26);
    *(_QWORD *)(a1 + 3896) = v6 + 30;
    DWORD1(v45) = v12;
    WORD4(v45) = v6[30];
    v13 = *(_WORD *)(v6 + 31);
    *(_QWORD *)(a1 + 3896) = v6 + 33;
    WORD5(v45) = v13;
    if (!v9 || !v10 || !v11)
    {
      v18 = "e: Step values should be nonzero";
LABEL_38:
      puts(v18);
      return 0;
    }
    for (i = 0; i != 70; ++i)
      *((_BYTE *)&v42[4] + i) = v6[i + 33];
    v15 = v6 + 103;
    *(_QWORD *)(a1 + 3896) = v6 + 103;
    if (v2 < 0x20000)
    {
      v16 = 3;
      v17 = 3;
    }
    else
    {
      v16 = v6[103];
      *(_QWORD *)(a1 + 3896) = v6 + 104;
      v17 = v6[104];
      v15 = v6 + 105;
      *(_QWORD *)(a1 + 3896) = v6 + 105;
    }
    v19 = 0;
    BYTE2(v42[21]) = v16;
    HIBYTE(v42[21]) = v17;
    do
    {
      *((_BYTE *)&v42[22] + v19) = v15[v19];
      ++v19;
    }
    while (v19 != 16);
    v20 = 0;
    *(_QWORD *)(a1 + 3896) = v15 + 16;
    do
    {
      *(_WORD *)((char *)&v42[26] + v20) = *(_WORD *)&v15[v20 + 16];
      v20 += 2;
    }
    while ((_DWORD)v20 != 20);
    v21 = 0;
    do
    {
      *(_WORD *)((char *)&v42[31] + v21) = *(_WORD *)&v15[v21 + 36];
      v21 += 2;
    }
    while ((_DWORD)v21 != 22);
    v22 = 0;
    v23 = 37;
    do
    {
      v42[v23++] = *(_DWORD *)&v15[v22 + 58] & 0xFFFFFF;
      v22 += 3;
    }
    while (v22 != 30);
    v24 = 0;
    do
    {
      *(_WORD *)((char *)&v42[47] + v24) = *(_WORD *)&v15[v24 + 88];
      v24 += 2;
    }
    while ((_DWORD)v24 != 22);
    v25 = (int *)(v15 + 110);
    v26 = 53;
    do
    {
      v27 = *v25++;
      v42[v26++] = v27;
    }
    while ((_DWORD)(v26 * 4) != 252);
    v28 = (__int16 *)(v15 + 150);
    v29 = 292;
    do
    {
      v30 = *v28++;
      *(_WORD *)((char *)v42 + v29) = v30;
      v29 += 2;
    }
    while ((_DWORD)v29 != 314);
    *(_QWORD *)(a1 + 3896) = v15 + 172;
    v31 = v15[172];
    *(_QWORD *)(a1 + 3896) = v15 + 173;
    BYTE6(v43) = v31;
    v32 = v15[173];
    *(_QWORD *)(a1 + 3896) = v15 + 174;
    BYTE7(v43) = v32;
    v33 = v15[174];
    *(_QWORD *)(a1 + 3896) = v15 + 175;
    BYTE8(v43) = v33;
    BYTE9(v43) = v15[175];
    v34 = *((_WORD *)v15 + 88);
    *(_QWORD *)(a1 + 3896) = v15 + 178;
    WORD5(v43) = v34;
    LOBYTE(v34) = v15[178];
    *(_QWORD *)(a1 + 3896) = v15 + 179;
    BYTE12(v43) = v34;
    BYTE13(v43) = v15[179];
    v35 = *((_WORD *)v15 + 90);
    *(_QWORD *)(a1 + 3896) = v15 + 182;
    HIWORD(v43) = v35;
    LOBYTE(v35) = v15[182];
    *(_QWORD *)(a1 + 3896) = v15 + 183;
    BYTE12(v45) = v35;
    LOBYTE(v35) = v15[183];
    *(_QWORD *)(a1 + 3896) = v15 + 184;
    BYTE13(v45) = v35;
    LOBYTE(v35) = v15[184];
    *(_QWORD *)(a1 + 3896) = v15 + 185;
    BYTE14(v45) = v35;
    LOBYTE(v35) = v15[185];
    *(_QWORD *)(a1 + 3896) = v15 + 186;
    HIBYTE(v45) = v35;
    LOBYTE(v35) = v15[186];
    *(_QWORD *)(a1 + 3896) = v15 + 187;
    LOBYTE(v46) = v35;
    if (v2 >> 17)
    {
      BYTE1(v46) = v15[187];
      v36 = BYTE1(v46);
      v37 = *((_DWORD *)v15 + 47) & 0xFFFFFF;
      *(_QWORD *)(a1 + 3896) = v15 + 191;
      DWORD1(v46) = v37;
      v38 = v15[191];
      *(_QWORD *)(a1 + 3896) = v15 + 192;
      BYTE8(v46) = v38;
      if (v36 && !v37 && !v38)
      {
        v18 = "e: ramp down configurations should be nonzero";
        goto LABEL_38;
      }
      v40 = v15 + 30;
      WORD5(v46) = *((_WORD *)v15 + 96);
      v39 = *((_WORD *)v15 + 97);
      *(_QWORD *)(a1 + 3896) = v40 + 166;
    }
    else
    {
      v39 = 0;
      BYTE1(v46) = 0;
      DWORD1(v46) = 0;
      BYTE8(v46) = 0;
      WORD5(v46) = 0;
    }
    WORD6(v46) = v39;
    if (!(*(unsigned int (**)(uint64_t, _DWORD *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(47, v42, 372, 0, 0, *(_QWORD *)(a1 + 16)))
    {
      v18 = "e: set BLAH data failed";
      goto LABEL_38;
    }
    puts("i: set BLAH data succeeded");
    return 1;
  }
  printf("e: Unexpected BLAH block version 0x%x\n", *(_DWORD *)(a2 + 4));
  return 0;
}

uint64_t sub_10000B228(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = HIWORD(*(_DWORD *)(a2 + 4));
  if (v2 == 4)
    return sub_10000F610(a1, a2);
  if (v2 == 3)
    return sub_10000F184(a1, a2);
  printf("e: unexpected block version %d\n", HIWORD(*(_DWORD *)(a2 + 4)));
  return 0;
}

uint64_t sub_10000B284(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v4;
  unsigned int v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  char v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  const char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  if (!*(_BYTE *)(a1 + 3904))
    return 1;
  v2 = *(_DWORD *)(a2 + 4);
  if (v2 > 0x4FFFF)
    return 0;
  v4 = 4 * *(_DWORD *)(a2 + 8);
  v5 = v4 - 16;
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  LODWORD(v25) = 1;
  if (v2 > 0x2FFFF)
    BYTE8(v25) = 2;
  v6 = *(unsigned __int8 **)(a1 + 3896);
  v7 = *v6;
  *(_QWORD *)(a1 + 3896) = v6 + 1;
  BYTE10(v26) = v7;
  v8 = v6[1];
  *(_QWORD *)(a1 + 3896) = v6 + 2;
  BYTE11(v26) = v8;
  v9 = v6[2];
  *(_QWORD *)(a1 + 3896) = v6 + 3;
  BYTE12(v26) = v9;
  v10 = v6[3];
  *(_QWORD *)(a1 + 3896) = v6 + 4;
  BYTE13(v26) = v10;
  if ((v2 & 0xFFFD0000) == 0x10000)
  {
    BYTE9(v25) = 0;
    v11 = 10 * (v7 * v8 + v7 * v8 * v9 + (v7 * v8 + v7 * v8 * v9) * v10);
    v12 = 1;
    if (v2 >> 17)
      v13 = v11 + 6;
    else
      v13 = v11 | 1;
  }
  else
  {
    v15 = HIWORD(v2);
    v12 = 1;
    if (v15 == 4 || v15 == 2)
    {
      BYTE9(v25) = 1;
      v13 = *((_DWORD *)v6 + 1);
      *(_QWORD *)(a1 + 3896) = v6 + 8;
      v5 = v4 - 36;
      v12 = 0;
    }
    else
    {
      v13 = 0;
    }
  }
  v16 = (v13 & 0x3FFF) != 0;
  LODWORD(v27) = (v13 & 0xFFFFC000) + (v16 << 14);
  if (v13 > v5 || v13 < v5 - 3)
  {
    v18 = "e: incoming data not well formed";
LABEL_29:
    puts(v18);
    return 0;
  }
  v19 = malloc_type_aligned_alloc(0x4000uLL, (v13 & 0xFFFFC000) + (v16 << 14), 0x575A7256uLL);
  if (!v19)
  {
    v18 = "e: could not allocate memory for PSFA data";
    goto LABEL_29;
  }
  v20 = v19;
  memcpy(v19, *(const void **)(a1 + 3896), (int)v13);
  *((_QWORD *)&v27 + 1) = v20;
  if ((v12 & 1) == 0)
  {
    v21 = 0;
    v22 = *(_QWORD *)(a1 + 3896);
    do
    {
      *(_BYTE *)(((unint64_t)&v25 | 0xA) + v21) = *(_BYTE *)(v22 + v21);
      ++v21;
    }
    while (v21 != 16);
    *(_QWORD *)(a1 + 3896) = v22 + 16;
  }
  v14 = (*(uint64_t (**)(uint64_t, __int128 *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(52, &v25, 56, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v14)
    v23 = "i: set PSFA data succeeded";
  else
    v23 = "e: set PSFA data failed";
  puts(v23);
  free(v20);
  return v14;
}

uint64_t sub_10000B4E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int16 *v4;
  __int16 v5;
  __int16 *v6;
  int *v7;
  char *v8;
  unsigned __int16 *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;
  int *v15;
  char *v16;
  unsigned __int16 *v17;
  int v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  const char *v23;
  int v25;
  __int16 v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  __int16 v31;
  __int16 v32;
  __int16 v33;
  uint64_t v34;

  if (!*(_BYTE *)(a1 + 3904))
    return 1;
  if (*(unsigned __int16 *)(a2 + 6) << 16 != 0x10000)
    return 0;
  bzero(&v34, 0x230uLL);
  v3 = 0;
  v25 = 1;
  v4 = *(__int16 **)(a1 + 3896);
  v26 = *v4;
  v27 = v4[1];
  v28 = v4[2];
  v29 = v4[3];
  v30 = v4[4];
  v31 = v4[5];
  v32 = v4[6];
  v5 = v4[7];
  v6 = v4 + 8;
  *(_QWORD *)(a1 + 3896) = v6;
  v33 = v5;
  v7 = &v25;
  do
  {
    v8 = (char *)&v25 + 2 * v3;
    v10 = *((unsigned __int16 *)v8 + 4);
    v9 = (unsigned __int16 *)(v8 + 8);
    if (v10)
    {
      v11 = 10;
      do
      {
        v12 = *v6++;
        *((_WORD *)v7 + v11) = v12;
        v13 = v11 - 9;
        ++v11;
      }
      while (v13 < *v9);
      *(_QWORD *)(a1 + 3896) = v6;
    }
    ++v3;
    v7 = (int *)((char *)v7 + 62);
  }
  while (v3 != 3);
  v14 = 0;
  v15 = &v25;
  do
  {
    v16 = (char *)&v25 + 2 * v14;
    v18 = *((unsigned __int16 *)v16 + 4);
    v17 = (unsigned __int16 *)(v16 + 8);
    if (v18)
    {
      v19 = 52;
      do
      {
        v20 = *(_DWORD *)v6;
        v6 += 2;
        v15[v19] = v20;
        v21 = v19 - 51;
        ++v19;
      }
      while (v21 < *v17);
      *(_QWORD *)(a1 + 3896) = v6;
    }
    ++v14;
    v15 += 31;
  }
  while (v14 != 3);
  v22 = (*(uint64_t (**)(uint64_t, int *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(89, &v25, 580, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v22)
    v23 = "i: set HSPC data succeeded";
  else
    v23 = "e: set HSPC data failed";
  puts(v23);
  return v22;
}

uint64_t sub_10000B674(uint64_t a1, uint64_t a2)
{
  int v3;
  _WORD *v4;
  uint64_t v5;
  int *v6;
  const char *v7;
  unsigned int v8;
  _DWORD *v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t i;
  _DWORD *v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  _DWORD *v21;
  int v22;
  __int16 v23;
  __int16 v24;
  __int16 v25[2];
  _BYTE v26[100];
  uint64_t v27;

  if (*(_BYTE *)(a1 + 3904))
  {
    if (*(unsigned __int16 *)(a2 + 6) << 16 != 0x10000)
      return 0;
    v3 = *(_DWORD *)(a2 + 8);
    bzero(v25, 0x7A0uLL);
    v22 = 1;
    v4 = *(_WORD **)(a1 + 3896);
    v23 = *v4;
    v24 = v4[1];
    v5 = (unsigned __int16)v4[2];
    v6 = (int *)(v4 + 3);
    *(_QWORD *)(a1 + 3896) = v6;
    v25[0] = v5;
    if (v5 >= 0xF)
    {
      v7 = "e: set QETC data failed. Too many brightness levels. ";
LABEL_5:
      puts(v7);
      return 0;
    }
    v8 = 4 * v3 - 18;
    if (v8 < 4 * (int)v5)
    {
      printf("e: The data size(%zu)is actually lesser than remaining bytes(%d)\n", (4 * v5), 4 * v3 - 18);
      return 0;
    }
    if ((_DWORD)v5)
    {
      v9 = v26;
      v10 = v5;
      do
      {
        v11 = *v6++;
        *v9++ = v11;
        --v10;
      }
      while (v10);
      v8 -= 4 * v5;
      *(_QWORD *)(a1 + 3896) = v6;
    }
    v12 = v8 - 44;
    if (v8 < 0x2C)
    {
      printf("e: The data size(%zu)is actually lesser than remaining bytes(%d)\n", 0x2CuLL, v8);
      return 0;
    }
    for (i = 0; i != 44; i += 2)
      *(_WORD *)&v26[i + 56] = *(_WORD *)((char *)v6 + i);
    v14 = v6 + 11;
    *(_QWORD *)(a1 + 3896) = v6 + 11;
    if (132 * v5 > v12)
    {
      printf("e: The data size(%zu)is actually lesser than remaining bytes(%d)\n", 132 * v5, v12);
      return 0;
    }
    if ((_DWORD)v5)
    {
      v16 = 0;
      v17 = &v27;
      do
      {
        v18 = 0;
        v19 = v17;
        do
        {
          v20 = 0;
          v21 = v14;
          do
          {
            *(_WORD *)((char *)v19 + v20) = *(_WORD *)((char *)v14 + v20);
            v20 += 2;
          }
          while (v20 != 44);
          ++v18;
          v19 = (uint64_t *)((char *)v19 + 44);
          v14 += 11;
        }
        while (v18 != 3);
        ++v16;
        v17 = (uint64_t *)((char *)v17 + 132);
      }
      while (v16 != v5);
      *(_QWORD *)(a1 + 3896) = v21 + 11;
    }
    if (((*(uint64_t (**)(uint64_t, int *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(101, &v22, 1960, 0, 0, *(_QWORD *)(a1 + 16)) & 1) == 0)
    {
      v7 = "e: set QETC data failed";
      goto LABEL_5;
    }
    puts("i: set QETC data succeeded");
  }
  return 1;
}

uint64_t sub_10000B858(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int16 *v6;
  const char *v7;
  uint64_t v8;
  unsigned int v9;
  _DWORD *v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  uint64_t i;
  uint64_t j;
  unsigned int v17;
  void *v18;
  void *v19;
  const char *v20;
  __int128 v21;
  _OWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[2];
  __int128 v27;
  void *v28;

  if (!*(_BYTE *)(a1 + 3904))
    return 1;
  if (*(unsigned __int16 *)(a2 + 6) << 16 != 0x10000)
    return 0;
  v3 = *(_DWORD *)(a2 + 8);
  v28 = 0;
  v27 = 0u;
  v25 = 0u;
  memset(v26, 0, sizeof(v26));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  memset(v22, 0, sizeof(v22));
  LODWORD(v21) = 1;
  v4 = *(_QWORD *)(a1 + 3896);
  DWORD2(v21) = *(_DWORD *)v4;
  v5 = *(unsigned __int16 *)(v4 + 4);
  v6 = (unsigned __int16 *)(v4 + 6);
  *(_QWORD *)(a1 + 3896) = v6;
  WORD6(v21) = v5;
  if (v5 >= 0xF)
    goto LABEL_4;
  v9 = 4 * v3 - 18;
  if (v9 < 4 * (int)v5)
    goto LABEL_17;
  if ((_DWORD)v5)
  {
    v10 = v22;
    v11 = v5;
    do
    {
      v12 = *(_DWORD *)v6;
      v6 += 2;
      *v10++ = v12;
      --v11;
    }
    while (v11);
    v9 -= 4 * v5;
  }
  v13 = *v6;
  *(_QWORD *)(a1 + 3896) = v6 + 1;
  WORD4(v23) = v13;
  if (v13 > 2)
  {
LABEL_4:
    v7 = "e: set TLSC data failed. Too many frequency levels. ";
LABEL_5:
    puts(v7);
    return 0;
  }
  if (v9 - 2 < 0x28)
    goto LABEL_17;
  for (i = 38; i != 58; i += 2)
    *(_DWORD *)((char *)&v22[-1] + i * 2) = *(_DWORD *)&v6[i - 37];
  *(_QWORD *)(a1 + 3896) = v6 + 21;
  if (v9 - 42 < 0x44)
  {
LABEL_17:
    printf("e: The data size(%zu)is actually lesser than remaining bytes(%d)\n");
    return 0;
  }
  for (j = 0; j != 17; ++j)
    *(_WORD *)((char *)v26 + j * 2 + 4) = v6[j + 21];
  *(_QWORD *)(a1 + 3896) = v6 + 38;
  v17 = 1122 * v5 * v13;
  DWORD2(v27) = v17;
  if (v9 - 76 < v17)
  {
    printf("e: The data size(%d)is actually lesser than remaining bytes(%d)\n");
    return 0;
  }
  v18 = malloc_type_aligned_alloc(0x4000uLL, (v17 & 0xFFFFC000) + (((v17 & 0x3FFE) != 0) << 14), 0xED1EA672uLL);
  if (!v18)
  {
    v7 = "e: could not allocate memory for TLSC data";
    goto LABEL_5;
  }
  v19 = v18;
  memcpy(v18, *(const void **)(a1 + 3896), v17 & 0xFFFFFFFE);
  v28 = v19;
  v8 = (*(uint64_t (**)(uint64_t, __int128 *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(103, &v21, 168, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v8)
    v20 = "i: set TLSC data succeeded";
  else
    v20 = "e: set TLSC data failed";
  puts(v20);
  free(v19);
  return v8;
}

uint64_t sub_10000BAC8(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned __int16 *v4;
  uint64_t v5;
  unsigned __int16 *v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  _DWORD *v10;
  uint64_t v11;
  int v12;
  __int16 *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v17;
  _WORD *v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  size_t v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  _OWORD v27[4];
  __int128 v28;
  __int128 v29;
  void *v30;

  if (!*(_BYTE *)(a1 + 3904))
    return 1;
  if (*(unsigned __int16 *)(a2 + 6) << 16 != 0x20000)
    return 0;
  v3 = *(_DWORD *)(a2 + 8);
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  memset(v27, 0, sizeof(v27));
  LODWORD(v27[0]) = 1;
  v4 = *(unsigned __int16 **)(a1 + 3896);
  v7 = *v4;
  v6 = v4 + 1;
  v5 = v7;
  *(_QWORD *)(a1 + 3896) = v6;
  WORD4(v27[0]) = v7;
  if (v7 >= 0xF)
  {
    printf("e: DPCl: More brightness taps( %d) then expected (%d) \n");
    return 0;
  }
  v9 = 4 * v3 - 14;
  if ((_DWORD)v5)
  {
    v10 = (_DWORD *)((unint64_t)v27 | 0xC);
    v11 = v5;
    do
    {
      v12 = *(_DWORD *)v6;
      v6 += 2;
      *v10++ = v12;
      --v11;
    }
    while (v11);
    v9 -= 2 * v5;
  }
  v15 = *v6;
  v13 = (__int16 *)(v6 + 1);
  v14 = v15;
  *(_QWORD *)(a1 + 3896) = v13;
  WORD2(v28) = v15;
  if (v15 > 8)
  {
    printf("e: DPCl: More temperature taps( %d) then expected (%d) \n");
    return 0;
  }
  v17 = v9 - 2;
  if ((_DWORD)v14)
  {
    v18 = (_WORD *)&v28 + 3;
    v19 = v14;
    do
    {
      v20 = *v13++;
      *v18++ = v20;
      --v19;
    }
    while (v19);
    v17 -= 2 * v14;
    *(_QWORD *)(a1 + 3896) = v13;
  }
  v21 = 9 * v5 * v14;
  v22 = (4 * v21);
  DWORD2(v29) = 4 * v21;
  if (v17 < 4 * v21)
  {
    v23 = "e: DPCl: Data size insufficient for the taps ";
LABEL_26:
    puts(v23);
    return 0;
  }
  v24 = malloc_type_aligned_alloc(0x4000uLL, ((4 * v21) & 0xFFFFC000) + ((((4 * (_WORD)v21) & 0x3FFC) != 0) << 14), 0x1D4F2EF1uLL);
  if (!v24)
  {
    v23 = "e: DPCl: could not allocate memory for DPCl data";
    goto LABEL_26;
  }
  v25 = v24;
  memcpy(v24, *(const void **)(a1 + 3896), v22);
  v30 = v25;
  v8 = (*(uint64_t (**)(uint64_t, _OWORD *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(92, v27, 104, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v8)
    v26 = "i: set DPCl data succeeded";
  else
    v26 = "e: set DPCl data failed";
  puts(v26);
  free(v25);
  return v8;
}

uint64_t sub_10000BCA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  _DWORD *v5;
  int v6;
  int v7;
  char v8;
  size_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  _DWORD v15[4];
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[12];

  if (!*(_BYTE *)(a1 + 3904))
    return 1;
  if (*(unsigned __int16 *)(a2 + 6) > 2u)
    return 0;
  v3 = 0;
  v4 = *(_DWORD *)(a2 + 8);
  v17 = 0;
  v16 = 0;
  memset(v18, 0, sizeof(v18));
  v15[0] = 1;
  v5 = *(_DWORD **)(a1 + 3896);
  v15[1] = *v5;
  v15[2] = v5[1];
  v6 = v5[2];
  *(_QWORD *)(a1 + 3896) = v5 + 3;
  v7 = 4 * v4;
  v15[3] = v6;
  do
  {
    v8 = *((_BYTE *)v5 + v3 + 12);
    *(_QWORD *)(a1 + 3896) = (char *)v5 + v3 + 13;
    *((_BYTE *)&v15[4] + v3++) = v8;
  }
  while (v3 != 16);
  v9 = v5[7];
  *(_QWORD *)(a1 + 3896) = v5 + 8;
  *(_DWORD *)v18 = v9;
  if (v7 - 44 < v9)
    printf("e: The data size(%d)is actually lesser than remaining bytes(%d)\n", v9, v7 - 44);
  v10 = malloc_type_aligned_alloc(0x4000uLL, (v9 & 0xFFFFC000) + (((v9 & 0x3FFF) != 0) << 14), 0x8BB2D46FuLL);
  if (!v10)
  {
    puts("e: could not allocate memory for USPC data");
    return 0;
  }
  v11 = v10;
  memcpy(v10, *(const void **)(a1 + 3896), v9);
  *(_QWORD *)&v18[4] = v11;
  v12 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(90, v15, 44, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v12)
    v13 = "i: set USPC data succeeded";
  else
    v13 = "e: set USPC data failed";
  puts(v13);
  free(v11);
  return v12;
}

uint64_t sub_10000BE54(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v4;
  char v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  if (!*(_BYTE *)(a1 + 3904))
    return 1;
  v2 = *(_DWORD *)(a2 + 4);
  if (HIWORD(v2) > 2u)
    return 0;
  v4 = 4 * *(_DWORD *)(a2 + 8);
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  v5 = 1;
  LODWORD(v25) = 1;
  BYTE8(v25) = 1;
  v6 = *(unsigned __int8 **)(a1 + 3896);
  v7 = *v6;
  *(_QWORD *)(a1 + 3896) = v6 + 1;
  LOBYTE(v28) = v7;
  v8 = v6[1];
  *(_QWORD *)(a1 + 3896) = v6 + 2;
  BYTE1(v28) = v8;
  v9 = v6[2];
  *(_QWORD *)(a1 + 3896) = v6 + 3;
  BYTE12(v26) = v9;
  v10 = v6[3];
  *(_QWORD *)(a1 + 3896) = v6 + 4;
  BYTE13(v26) = v10;
  v11 = v6[4];
  *(_QWORD *)(a1 + 3896) = v6 + 5;
  BYTE10(v26) = v11;
  v12 = v6[5];
  *(_QWORD *)(a1 + 3896) = v6 + 6;
  BYTE11(v26) = v12;
  v13 = v6[6];
  *(_QWORD *)(a1 + 3896) = v6 + 7;
  BYTE2(v28) = v13;
  if (v2 == 0x20000)
  {
    BYTE9(v25) = 1;
    v15 = *(_DWORD *)(v6 + 7);
    *(_QWORD *)(a1 + 3896) = v6 + 11;
    v14 = v4 - 39;
    v5 = 0;
  }
  else
  {
    v14 = v4 - 19;
    if (v2 == 0x10000)
      v15 = (v8 + v8 * v10) * (4 * v11 * v12 * v13 + 8 * (v7 + v7 * v9));
    else
      v15 = 0;
  }
  v17 = (v15 & 0x3FFF) != 0;
  LODWORD(v27) = (v15 & 0xFFFFC000) + (v17 << 14);
  if (v15 > v14 || v15 < v14 - 3)
  {
    v23 = "e: incoming data not well formed";
LABEL_22:
    puts(v23);
    return 0;
  }
  v18 = malloc_type_aligned_alloc(0x4000uLL, (v15 & 0xFFFFC000) + (v17 << 14), 0xD92207A1uLL);
  if (!v18)
  {
    v23 = "e: could not allocate memory for PSFM data";
    goto LABEL_22;
  }
  v19 = v18;
  memcpy(v18, *(const void **)(a1 + 3896), (int)v15);
  *((_QWORD *)&v27 + 1) = v19;
  if ((v5 & 1) == 0)
  {
    v20 = 0;
    v21 = *(_QWORD *)(a1 + 3896);
    do
    {
      *(_BYTE *)(((unint64_t)&v25 | 0xA) + v20) = *(_BYTE *)(v21 + v20);
      ++v20;
    }
    while (v20 != 16);
    *(_QWORD *)(a1 + 3896) = v21 + 16;
  }
  v16 = (*(uint64_t (**)(uint64_t, __int128 *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(52, &v25, 56, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v16)
    v22 = "i: set PSFM data succeeded";
  else
    v22 = "e: set PSFM data failed";
  puts(v22);
  free(v19);
  return v16;
}

uint64_t sub_10000C0A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  unsigned __int16 *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t result;
  uint64_t v13;
  int *v14;
  int *v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  int *v24;
  char *v25;
  char v26;
  uint64_t v27;
  int v28;
  int v29;
  __int16 v30;

  if (!*(_BYTE *)(a1 + 3904))
    return 1;
  v2 = *(unsigned int *)(a2 + 8);
  if (v2 > 0x14)
    return 0;
  v4 = *(_DWORD *)(a2 + 4);
  if (v4 != 0x20000 && v4 != 0x10000)
    return 0;
  if (v4 == 0x20000)
    v5 = -2;
  else
    v5 = -1;
  v6 = *(unsigned __int16 **)(a1 + 3896);
  v7 = *v6;
  v8 = v6[1];
  *(_QWORD *)(a1 + 3896) = v6 + 2;
  v9 = *((unsigned __int8 *)v6 + 4);
  *(_QWORD *)(a1 + 3896) = (char *)v6 + 5;
  if (v4 != 0x20000)
  {
    v10 = 0;
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  v10 = *(_DWORD *)((char *)v6 + 5);
  *(_QWORD *)(a1 + 3896) = (char *)v6 + 9;
  if (v10 != 21474837)
  {
    if (v10 == 17913593)
    {
      v11 = 1;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v11 = 2;
LABEL_15:
  v13 = a1 + 88 * v11;
  *(_DWORD *)(v13 + 2224) = 1;
  v14 = (int *)malloc_type_calloc(1uLL, 0x60uLL, 0x102004029C71177uLL);
  if (!v14)
  {
    puts("e: no memory");
    return 0;
  }
  v15 = v14;
  v16 = (4 * (v2 + v5) - 13) / 3uLL;
  v17 = 3 * v16;
  v18 = a1 + 88 * v11;
  v19 = *(_DWORD *)(v18 + 2308);
  if (v19)
  {
    if (v17 != v19)
    {
      v20 = "e: lut sizes should be the same";
LABEL_23:
      puts(v20);
LABEL_36:
      free(v15);
      return 0;
    }
  }
  else
  {
    *(_DWORD *)(v18 + 2308) = v17;
  }
  bzero(v14, 0x60uLL);
  v15[2] = v8 << 8;
  v15[3] = v7;
  v15[4] = v9;
  v15[5] = v10;
  v15[7] = v16;
  if (v16 > 0x14)
  {
    v20 = "e: lut size too big";
    goto LABEL_23;
  }
  v21 = 0;
  v22 = v15 + 8;
  do
  {
    v23 = v16;
    v24 = v22;
    if ((_DWORD)v16)
    {
      do
      {
        v25 = *(char **)(a1 + 3896);
        v26 = *v25;
        *(_QWORD *)(a1 + 3896) = v25 + 1;
        *(_BYTE *)v24 = v26;
        v24 = (int *)((char *)v24 + 3);
        --v23;
      }
      while (v23);
    }
    ++v21;
    v22 = (int *)((char *)v22 + 1);
  }
  while (v21 != 3);
  if ((sub_100010190(a1, v15[2], (int *)(v13 + 2232), (_WORD *)(v13 + 2294)) & 1) == 0
    || !sub_100010238(a1, *((unsigned __int16 *)v15 + 6), (_WORD *)(v13 + 2272), (_WORD *)(v13 + 2296))
    || !sub_100010598(a1, *((unsigned __int8 *)v15 + 16), (_BYTE *)(v13 + 2292), (_WORD *)(v13 + 2298))
    || !sub_1000090DC(a1, (uint64_t)v15, v11))
  {
    goto LABEL_36;
  }
  result = 1;
  if (v15[4])
  {
    v27 = a1 + 88 * v11;
    v28 = *(_DWORD *)(v27 + 2304);
    v29 = (1 << v15[3]) | v28;
    *(_DWORD *)(v27 + 2304) = v29;
    v30 = *(_WORD *)(v13 + 2300);
    if (v28 != v29)
      ++v30;
    *(_WORD *)(v13 + 2300) = v30;
  }
  return result;
}

uint64_t sub_10000C33C(uint64_t a1, uint64_t a2)
{
  int v4;
  unsigned int v5;
  int *v6;
  int v7;
  int v8;
  unsigned int v9;
  BOOL v10;
  BOOL v12;
  uint64_t v13;
  _DWORD *v14;
  unsigned int v15;
  int v16;
  _DWORD *v17;
  const char *v19;
  int v20[3];
  _DWORD __dst[777];
  char v22[5];
  int v23;
  char v24;

  memcpy(__dst, &unk_100021630, sizeof(__dst));
  v4 = *(_DWORD *)(a2 + 8);
  v24 = 0;
  v23 = 0;
  __dst[0] = 1;
  v5 = v4 - 3;
  if (v4 != 3)
  {
    while (1)
    {
      v6 = *(int **)(a1 + 3896);
      v7 = *v6;
      v8 = v6[1];
      v20[0] = v7;
      v20[1] = v8;
      v9 = v6[2];
      v20[2] = v9;
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10 || v9 == 0)
      {
        v19 = "e: invalid header";
        goto LABEL_72;
      }
      *(_QWORD *)(a1 + 3896) = v6 + 3;
      v12 = v5 >= v9;
      v5 -= v9;
      if (!v12)
      {
        v19 = "e: input data not well-formed";
        goto LABEL_72;
      }
      v22[0] = HIBYTE(v7);
      v22[1] = BYTE2(v7);
      v22[2] = BYTE1(v7);
      v22[3] = v7;
      v22[4] = 0;
      if (v7 > 1380734291)
        break;
      if (v7 <= 1297303107)
      {
        if (v7 <= 1129600587)
        {
          if (v7 == 1129469516)
          {
            v13 = a1;
            v14 = &__dst[618];
          }
          else
          {
            if (v7 != 1129470032)
              goto LABEL_74;
            v13 = a1;
            v14 = &__dst[617];
          }
LABEL_59:
          v15 = 1;
        }
        else
        {
          if (v7 != 1129600588)
          {
            if (v7 == 1129601104)
            {
              v13 = a1;
              v14 = &__dst[619];
              goto LABEL_59;
            }
            if (v7 != 1230128472)
              goto LABEL_74;
            v13 = a1;
            v14 = &__dst[1];
            goto LABEL_53;
          }
          v13 = a1;
          v14 = &__dst[620];
          v15 = 4;
        }
LABEL_60:
        v16 = 1;
        goto LABEL_61;
      }
      if (v7 <= 1347568470)
      {
        if (v7 == 1297303108)
        {
          if (sub_100009158(a1, v20, &__dst[728], 1u, 1, 0))
            __dst[0] = 2;
          goto LABEL_63;
        }
        if (v7 != 1347568452)
        {
LABEL_74:
          printf("e: unknown block name %s\n", v22);
          return 0;
        }
        v13 = a1;
        v14 = &__dst[712];
        v15 = 16;
        v16 = 0;
LABEL_61:
        v17 = 0;
LABEL_62:
        sub_100009158(v13, v20, v14, v15, v16, v17);
        goto LABEL_63;
      }
      if (v7 != 1347568471)
      {
        if (v7 == 1380209478)
        {
          v13 = a1;
          v14 = &__dst[695];
        }
        else
        {
          if (v7 != 1380336984)
            goto LABEL_74;
          v13 = a1;
          v14 = &__dst[694];
        }
        goto LABEL_59;
      }
      sub_100010648(a1, v20, (uint64_t)__dst);
LABEL_63:
      if (!v5)
        goto LABEL_68;
    }
    if (v7 <= 1446069591)
    {
      if (v7 <= 1395803479)
      {
        if (v7 == 1380734292)
        {
          v13 = a1;
          v17 = &__dst[16];
          v14 = &__dst[17];
          v15 = 600;
          v16 = 0;
          goto LABEL_62;
        }
        if (v7 != 1395737944)
          goto LABEL_74;
        v13 = a1;
        v14 = &__dst[7];
      }
      else
      {
        switch(v7)
        {
          case 1395803480:
            v13 = a1;
            v14 = &__dst[10];
            break;
          case 1395869016:
            v13 = a1;
            v14 = &__dst[13];
            break;
          case 1397310808:
            v13 = a1;
            v14 = &__dst[4];
            break;
          default:
            goto LABEL_74;
        }
      }
LABEL_53:
      v15 = 3;
    }
    else
    {
      if (v7 <= 1447642455)
      {
        switch(v7)
        {
          case 1446069592:
            v13 = a1;
            v14 = &__dst[691];
            break;
          case 1446135128:
            v13 = a1;
            v14 = &__dst[692];
            break;
          case 1446200664:
            v13 = a1;
            v14 = &__dst[693];
            break;
          default:
            goto LABEL_74;
        }
        goto LABEL_59;
      }
      if (v7 == 1447642456)
      {
        v13 = a1;
        v14 = &__dst[690];
        goto LABEL_59;
      }
      if (v7 == 1447839064)
      {
        v13 = a1;
        v14 = &__dst[624];
        goto LABEL_59;
      }
      if (v7 != 1447843404)
        goto LABEL_74;
      v13 = a1;
      v14 = &__dst[625];
      v15 = 65;
    }
    goto LABEL_60;
  }
LABEL_68:
  if ((*(unsigned int (**)(uint64_t, _DWORD *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(8, __dst, 3108, 0, 0, *(_QWORD *)(a1 + 16)))
  {
    puts("i: set CA data succeeded");
    return 1;
  }
  else
  {
    v19 = "e: set CA data failed";
LABEL_72:
    puts(v19);
    return 0;
  }
}

BOOL sub_10000C890(uint64_t a1, uint64_t a2)
{
  int v3;
  _BOOL8 result;
  int v5;
  BOOL v6;
  uint64_t v7;
  uint16x4_t v8;
  int v9;
  const char *v10;
  unsigned int *v11;
  unsigned int *v12;
  uint64_t v13;
  char *v14;
  uint64_t i;
  __int16 *v16;
  __int16 v17;
  uint64_t *v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  int v22;

  v3 = HIWORD(*(_DWORD *)(a2 + 4));
  if (v3 == 4)
    return sub_100010720(a1, a2);
  if (v3 == 1)
    v5 = 389;
  else
    v5 = 390;
  if (*(_DWORD *)(a2 + 8) - 3 != v5)
  {
    v10 = "e: PRC table not well formed";
LABEL_27:
    puts(v10);
    return 0;
  }
  v6 = v3 == 2;
  v7 = *(_QWORD *)(a1 + 3896) + 2 * (v3 == 2);
  v8 = *(uint16x4_t *)v7;
  *(_QWORD *)(a1 + 3896) = v7 + 8;
  if (v6)
  {
    v9 = *(unsigned __int16 *)(v7 + 8);
    *(_QWORD *)(a1 + 3896) = v7 + 10;
    if (v9)
    {
      *(_QWORD *)(a1 + 3896) = v7 + 1558;
      return 1;
    }
  }
  v11 = (unsigned int *)malloc_type_calloc(1uLL, 0x628uLL, 0x10200404B1403A4uLL);
  if (!v11)
  {
    v10 = "e: out of memory for PRC table";
    goto LABEL_27;
  }
  v12 = v11;
  v13 = 0;
  v11[6] = 2;
  *(uint32x4_t *)(v11 + 2) = vmovl_u16(v8);
  v14 = (char *)(v11 + 7);
  do
  {
    for (i = 0; i != 514; i += 2)
    {
      v16 = *(__int16 **)(a1 + 3896);
      v17 = *v16;
      *(_QWORD *)(a1 + 3896) = v16 + 1;
      *(_WORD *)&v14[i] = v17;
    }
    *(_QWORD *)(a1 + 3896) += 2;
    ++v13;
    v14 += 514;
  }
  while (v13 != 3);
  v18 = *(uint64_t **)(a1 + 2824);
  v19 = v11[2];
  if (v18)
  {
    while (v19 != *((_DWORD *)v18 + 2)
         || v11[3] != *((_DWORD *)v18 + 3)
         || v11[4] != *((_DWORD *)v18 + 4)
         || v11[5] != *((_DWORD *)v18 + 5))
    {
      v18 = (uint64_t *)*v18;
      if (!v18)
        goto LABEL_23;
    }
    puts("e: duplicate PRC table found in input");
    goto LABEL_25;
  }
LABEL_23:
  sub_100010A78(a1, v19, (unsigned int *)(a1 + 2520), (unsigned int *)(a1 + 2616));
  sub_100010A78(a1, v12[3], (unsigned int *)(a1 + 2720), (unsigned int *)(a1 + 2816));
  sub_100010A78(a1, v12[4], (unsigned int *)(a1 + 2620), (unsigned int *)(a1 + 2716));
  v20 = v12[5];
  if (v20 >= 2)
  {
    printf("e: unexpected value for polarity %d\n", v12[5]);
LABEL_25:
    free(v12);
    return 0;
  }
  result = 1;
  v21 = *(_DWORD *)(a1 + 2512) | (1 << v20);
  *(_DWORD *)(a1 + 2512) = v21;
  if (v21 == 3)
    v22 = 2;
  else
    v22 = 1;
  *(_DWORD *)(a1 + 2820) = v22;
  *(_QWORD *)v12 = *(_QWORD *)(a1 + 2824);
  *(_QWORD *)(a1 + 2824) = v12;
  return result;
}

uint64_t sub_10000CAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t result;
  _QWORD *v7;
  uint64_t v8;
  __int16 v9;

  v9 = 0;
  v8 = 0;
  v3 = *(unsigned int *)(a2 + 4);
  HIDWORD(v4) = *(_DWORD *)(a2 + 4);
  LODWORD(v4) = v3 - 0x40000;
  switch((v4 >> 16))
  {
    case 0u:
      v5 = 1;
      break;
    case 1u:
      *(_DWORD *)(a1 + 2832) = 2;
      operator new();
    case 2u:
      v5 = 3;
      break;
    case 3u:
      *(_DWORD *)(a1 + 2832) = 4;
      operator new();
    case 4u:
      *(_DWORD *)(a1 + 2832) = 5;
      operator new();
    case 5u:
      *(_DWORD *)(a1 + 2832) = 6;
      operator new();
    default:
      *(_DWORD *)(a1 + 2832) = 0;
      printf("e: unsupported AlsH version: 0x%x\n", v3);
      result = 0;
      switch(*(_DWORD *)(a1 + 2832))
      {
        case 1:
        case 3:
          v7 = (_QWORD *)(a1 + 2840);
          if (*(_QWORD *)(a1 + 2840))
            goto LABEL_18;
          goto LABEL_19;
        case 2:
          v7 = (_QWORD *)(a1 + 2840);
          if (*(_QWORD *)(a1 + 2840))
            goto LABEL_18;
          goto LABEL_19;
        case 4:
          v7 = (_QWORD *)(a1 + 2840);
          if (*(_QWORD *)(a1 + 2840))
            goto LABEL_18;
          goto LABEL_19;
        case 6:
          v7 = (_QWORD *)(a1 + 2840);
          if (*(_QWORD *)(a1 + 2840))
LABEL_18:
            operator delete();
LABEL_19:
          result = 0;
          *v7 = 0;
          break;
        default:
          return result;
      }
      return result;
  }
  *(_DWORD *)(a1 + 2832) = v5;
  operator new();
}

uint64_t sub_10000D144(uint64_t a1, uint64_t a2)
{
  int v3;
  char *v4;
  char v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  size_t v9;
  size_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  if (*(unsigned __int16 *)(a2 + 6) > 2u)
    return 0;
  v3 = 4 * *(_DWORD *)(a2 + 8);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  LODWORD(v16) = 1;
  v4 = *(char **)(a1 + 3896);
  v5 = *v4;
  *(_QWORD *)(a1 + 3896) = v4 + 1;
  LOBYTE(v17) = v5;
  BYTE1(v17) = v4[1];
  *(_QWORD *)((char *)&v17 + 2) = *(_QWORD *)(v4 + 2);
  WORD5(v17) = *((_WORD *)v4 + 5);
  v6 = *((_WORD *)v4 + 6);
  *(_QWORD *)(a1 + 3896) = v4 + 14;
  WORD6(v17) = v6;
  BYTE14(v17) = v4[14];
  LOWORD(v18) = *(_WORD *)(v4 + 15);
  v7 = *(_WORD *)(v4 + 17);
  *(_QWORD *)(a1 + 3896) = v4 + 19;
  WORD1(v18) = v7;
  BYTE4(v18) = v4[19];
  *(_QWORD *)((char *)&v18 + 6) = *(_QWORD *)(v4 + 20);
  HIWORD(v18) = *((_WORD *)v4 + 14);
  v19 = *(_OWORD *)(v4 + 30);
  *(_QWORD *)&v20 = *(_QWORD *)(v4 + 46);
  DWORD2(v20) = *(_DWORD *)(v4 + 54);
  v8 = *((_WORD *)v4 + 29);
  *(_QWORD *)(a1 + 3896) = v4 + 60;
  WORD6(v20) = v8;
  v9 = (v3 - 72);
  LODWORD(v4) = (((_WORD)v3 - 72) & 0x3FFC) != 0;
  v10 = (v9 & 0xFFFFC000) + ((_DWORD)v4 << 14);
  DWORD2(v21) = (v9 & 0xFFFFC000) + ((_DWORD)v4 << 14);
  v11 = malloc_type_aligned_alloc(0x4000uLL, DWORD2(v21), 0x1EB29C33uLL);
  if (!v11)
  {
    puts("e: could not allocate memory for DBMA data");
    return 0;
  }
  v12 = v11;
  bzero(v11, v10);
  memcpy(v12, *(const void **)(a1 + 3896), v9);
  *(_QWORD *)&v21 = v12;
  v13 = (*(uint64_t (**)(uint64_t, __int128 *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(67, &v16, 96, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v13)
    v14 = "i: set DBMA data succeeded";
  else
    v14 = "e: set DBMA data failed";
  puts(v14);
  free(v12);
  return v13;
}

uint64_t sub_10000D370(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  _DWORD *v4;
  int v5;
  int v6;
  uint64_t v7;
  const char *v8;
  _DWORD v10[4];
  int v11;

  v2 = *(_DWORD *)(a2 + 4);
  if (HIWORD(v2) != 1)
  {
    if (HIWORD(v2) != 2)
      goto LABEL_12;
    v3 = *(_DWORD *)(a2 + 8);
LABEL_5:
    if (v3 == 7)
      goto LABEL_6;
LABEL_12:
    puts("e: Bad size/version for HGOD");
    return 0;
  }
  v3 = *(_DWORD *)(a2 + 8);
  if (v3 != 6)
    goto LABEL_5;
LABEL_6:
  v11 = -1431655766;
  v10[0] = HIWORD(v2);
  v4 = *(_DWORD **)(a1 + 3896);
  v10[1] = *v4;
  v10[2] = v4[1];
  v5 = v4[2];
  *(_QWORD *)(a1 + 3896) = v4 + 3;
  v10[3] = v5;
  if (v2 >= 0x20000)
  {
    v6 = v4[3];
    *(_QWORD *)(a1 + 3896) = v4 + 4;
    v11 = v6 << 16;
  }
  v7 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(38, v10, 20, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v7)
    v8 = "i: set HGOD data succeeded";
  else
    v8 = "e: set HGOD data failed";
  puts(v8);
  return v7;
}

uint64_t sub_10000D468(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int16 *v5;
  int v6;
  _DWORD *v7;
  uint64_t i;
  uint64_t v9;
  int *v10;
  uint64_t j;
  int v12;
  const char *v13;
  _DWORD v15[4];
  __int128 v16;
  __int128 v17;
  _BYTE v18[76];

  if (!*(_BYTE *)(a1 + 3904))
    return 1;
  v2 = *(_DWORD *)(a2 + 4);
  if (v2 < 0x30000)
  {
    memset(v18, 0, sizeof(v18));
    v17 = 0u;
    v16 = 0u;
    v15[0] = 1;
    v5 = *(unsigned __int16 **)(a1 + 3896);
    v6 = *v5;
    *(_QWORD *)(a1 + 3896) = v5 + 1;
    printf("i: Processing BLTS format version %d data version %d\n", HIWORD(v2), v6);
    v7 = *(_DWORD **)(a1 + 3896);
    v15[1] = *v7;
    v15[2] = v7[1];
    v15[3] = v7[2];
    for (i = 4; i != 15; ++i)
    {
      v15[i] = v7[3] & 0xFFFFFF;
      v7 = (_DWORD *)((char *)v7 + 3);
    }
    v9 = 0;
    do
    {
      *(_WORD *)&v18[v9 + 12] = *(_WORD *)((char *)v7 + v9 + 12);
      v9 += 2;
    }
    while ((_DWORD)v9 != 22);
    v10 = (_DWORD *)((char *)v7 + 34);
    for (j = 21; j != 31; ++j)
    {
      v12 = *v10;
      v10 = (int *)((char *)v10 + 3);
      v15[j] = v12 & 0xFFFFFF;
    }
    *(_QWORD *)(a1 + 3896) = v10;
    v3 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(68, v15, 124, 0, 0, *(_QWORD *)(a1 + 16));
    if ((_DWORD)v3)
      v13 = "i: set BLTS data succeeded";
    else
      v13 = "e: set BLTS data failed";
    puts(v13);
  }
  else
  {
    printf("e: Unexpected BLTS block version 0x%x\n", *(_DWORD *)(a2 + 4));
    return 0;
  }
  return v3;
}

uint64_t sub_10000D5D8(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  int *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int *v12;
  uint64_t i;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  uint64_t j;
  int v21;
  int v22;
  _DWORD v24[19];
  _DWORD v25[202];

  if (!*(_BYTE *)(a1 + 3904))
    return 1;
  v2 = *(_DWORD *)(a2 + 4);
  if (v2 < 0x20000)
  {
    bzero(v25, 0x328uLL);
    v24[0] = 2;
    v5 = *(int **)(a1 + 3896);
    v6 = *v5;
    *(_QWORD *)(a1 + 3896) = v5 + 1;
    printf("i: Processing RXTK format version %d data version %d\n", HIWORD(v2), v6);
    v7 = 0;
    v8 = *(_QWORD *)(a1 + 3896);
    v24[1] = *(_DWORD *)v8;
    v24[2] = *(_DWORD *)(v8 + 4);
    v24[3] = *(_DWORD *)(v8 + 8);
    v24[4] = *(_DWORD *)(v8 + 12);
    v24[5] = *(_DWORD *)(v8 + 16);
    v24[6] = *(_DWORD *)(v8 + 20);
    v24[7] = *(_DWORD *)(v8 + 24);
    v24[8] = *(_DWORD *)(v8 + 28);
    v24[9] = *(_DWORD *)(v8 + 32);
    v24[10] = *(_DWORD *)(v8 + 36);
    v24[11] = *(_DWORD *)(v8 + 40);
    v9 = *(_DWORD *)(v8 + 44);
    *(_QWORD *)(a1 + 3896) = v8 + 48;
    v24[12] = v9;
    v10 = *(unsigned __int8 *)(v8 + 48);
    *(_QWORD *)(a1 + 3896) = v8 + 49;
    v24[13] = v10;
    v11 = *(unsigned __int8 *)(v8 + 49);
    *(_QWORD *)(a1 + 3896) = v8 + 50;
    v24[14] = v11;
    v24[15] = *(unsigned __int8 *)(v8 + 50);
    v24[16] = *(_DWORD *)(v8 + 51) & 0xFFFFFF;
    v24[17] = *(_DWORD *)(v8 + 54) & 0xFFFFFF;
    v24[18] = *(unsigned __int16 *)(v8 + 57);
    do
    {
      v24[v7 + 19] = *(_DWORD *)(v8 + v7 * 4 + 59);
      ++v7;
    }
    while (v7 != 6);
    v12 = (int *)(v8 + 121);
    for (i = 25; i != 41; ++i)
    {
      v24[i] = *(int *)((char *)v12 - 38) & 0xFFFFFF;
      v12 = (int *)((char *)v12 + 3);
    }
    do
    {
      v24[i++] = *(int *)((char *)v12 - 38) & 0xFFFFFF;
      v12 = (int *)((char *)v12 + 3);
    }
    while (i != 57);
    v25[38] = *(int *)((char *)v12 - 38) & 0xFFFFFF;
    v25[39] = *(int *)((char *)v12 - 35) & 0xFFFFFF;
    v25[40] = *(v12 - 8);
    v25[41] = *(v12 - 7);
    v14 = *(v12 - 6);
    *(_QWORD *)(a1 + 3896) = v12 - 5;
    v25[42] = v14;
    v25[43] = *((unsigned __int8 *)v12 - 20);
    v25[44] = *(int *)((char *)v12 - 19) & 0xFFFFFF;
    v15 = *(v12 - 4) & 0xFFFFFF;
    *(_QWORD *)(a1 + 3896) = (char *)v12 - 13;
    v25[45] = v15;
    v16 = *((unsigned __int8 *)v12 - 13);
    *(_QWORD *)(a1 + 3896) = v12 - 3;
    v25[46] = v16;
    v25[47] = *((unsigned __int8 *)v12 - 12);
    v25[48] = *(int *)((char *)v12 - 11);
    v17 = *(int *)((char *)v12 - 7);
    *(_QWORD *)(a1 + 3896) = (char *)v12 - 3;
    v25[49] = v17;
    v18 = *((unsigned __int8 *)v12 - 3);
    *(_QWORD *)(a1 + 3896) = (char *)v12 - 2;
    v25[50] = v18;
    v19 = *((unsigned __int8 *)v12 - 2);
    *(_QWORD *)(a1 + 3896) = (char *)v12 - 1;
    v25[51] = v19;
    v25[52] = *((unsigned __int8 *)v12 - 1);
    for (j = 72; j != 142; ++j)
    {
      v21 = *v12;
      v12 = (int *)((char *)v12 + 3);
      v24[j] = v21 & 0xFFFFFF;
    }
    do
    {
      v22 = *v12;
      v12 = (int *)((char *)v12 + 3);
      v24[j++] = v22 & 0xFFFFFF;
    }
    while (j != 212);
    *(_QWORD *)(a1 + 3896) = v12;
    v3 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(95, v24, 884, 0, 0, *(_QWORD *)(a1 + 16));
    if ((v3 & 1) != 0)
      printf("i: set RXTK data succeeded");
    else
      puts("e: set RXTK data failed");
  }
  else
  {
    printf("e: Unexpected RXTK block version 0x%x\n", *(_DWORD *)(a2 + 4));
    return 0;
  }
  return v3;
}

uint64_t sub_10000D8D0(uint64_t a1, uint64_t a2)
{
  if (HIWORD(*(_DWORD *)(a2 + 4)) == 5)
    return sub_10000FFC0(a1, a2);
  printf("e: unexpected version %d for PDCp block\n", HIWORD(*(_DWORD *)(a2 + 4)));
  return 0;
}

uint64_t sub_10000D918(uint64_t a1, uint64_t a2)
{
  if (HIWORD(*(_DWORD *)(a2 + 4)) == 5)
    return sub_10000FA60(a1, a2);
  printf("e: unexpected version %d for PDCc block\n", HIWORD(*(_DWORD *)(a2 + 4)));
  return 0;
}

uint64_t sub_10000D960(uint64_t a1, uint64_t a2)
{
  unsigned __int16 *v3;
  int v4;
  _WORD *v5;
  int v6;
  __int16 v7;

  if (*(_DWORD *)(a2 + 4) < 0x20000u)
  {
    *(_DWORD *)(a1 + 2864) = 1;
    if (*(_DWORD *)(a2 + 8) == 9)
    {
      v3 = *(unsigned __int16 **)(a1 + 3896);
      v4 = *v3;
      *(_QWORD *)(a1 + 3896) = v3 + 1;
      *(_WORD *)(a1 + 2868) = v4;
      printf("i: processing prox data version %d\n", v4);
      v5 = *(_WORD **)(a1 + 3896);
      *(_WORD *)(a1 + 2912) = *v5;
      *(_WORD *)(a1 + 2916) = v5[1];
      *(_WORD *)(a1 + 2914) = v5[2];
      *(_WORD *)(a1 + 2918) = v5[3];
      *(_WORD *)(a1 + 3164) = v5[4];
      *(_WORD *)(a1 + 3162) = v5[5];
      *(_DWORD *)(a1 + 3408) = (unsigned __int16)v5[6];
      *(_WORD *)(a1 + 2870) = v5[7];
      *(_WORD *)(a1 + 3160) = v5[8];
      v6 = (unsigned __int16)v5[9];
      *(_QWORD *)(a1 + 3896) = v5 + 10;
      if (v6 == 3)
      {
        v7 = v5[10];
        *(_QWORD *)(a1 + 3896) = v5 + 11;
        *(_WORD *)(a1 + 3166) = v7;
        *(_OWORD *)(a1 + 3584) = 0u;
        *(_OWORD *)(a1 + 3600) = 0u;
        return 1;
      }
      puts("e: expected 3 color channels");
    }
    else
    {
      printf("e: unexpected PBDp block size %d\n");
    }
  }
  else
  {
    printf("e: unexpected PBDp block version %d\n");
  }
  return 0;
}

uint64_t sub_10000DA80(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int *v10;
  uint64_t v11;
  int v12;
  uint64_t v14;
  _DWORD *v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v20;
  _DWORD *v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned __int16 *v27;
  unsigned __int16 *v28;
  unsigned int v29;
  unsigned int v30;
  float v31;
  void *v32;
  _QWORD *v33;
  unsigned __int16 *v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  unsigned int v38;
  unint64_t v39;
  int *v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  unsigned int v44;
  unint64_t v45;
  int *v46;
  int v47;
  const char *v48;
  unsigned int *v50;

  if (*(_DWORD *)(a2 + 4) >= 0x20000u)
  {
    printf("e: unexpected PBDD version %d\n");
    return 0;
  }
  if (*(_DWORD *)(a1 + 2864) && *(_WORD *)(a1 + 2868))
  {
    v3 = *(_DWORD *)(a1 + 3408);
    v4 = v3 * *(unsigned __int16 *)(a1 + 2870);
    v5 = *(unsigned __int16 *)(a1 + 2912);
    v6 = *(unsigned __int16 *)(a1 + 2916);
    v7 = *(unsigned __int16 *)(a1 + 2914);
    v8 = *(unsigned __int16 *)(a1 + 2918);
    v9 = v8 * v7 + v6 * v5 + 1;
    if (*(_DWORD *)(a2 + 8) != v3 + v5 + v6 + v7 + v8 + v9 * v4 + 5)
    {
      printf("e: unexpected PBDD block size 0x%x != 0x%x\n");
      return 0;
    }
    *(_QWORD *)(a1 + 3896) += 2;
    v50 = (unsigned int *)(a1 + 3548);
    sub_100009280(a1, a1 + 3548, v3, (uint64_t)CFSTR("DisplayCoexPrioritizeDisplay"));
    v10 = *(int **)(a1 + 3896);
    if (*(_WORD *)(a1 + 2912))
    {
      v11 = *(unsigned __int16 *)(a1 + 2912) - 1;
      do
      {
        v12 = *v10++;
        *(_WORD *)(a1 + 2 * v11 + 2920) = v12;
      }
      while ((unint64_t)v11--);
    }
    v14 = *(unsigned __int16 *)(a1 + 2916);
    if (*(_WORD *)(a1 + 2916))
    {
      v15 = (_DWORD *)(a1 + 2960);
      do
      {
        v16 = *v10++;
        *v15++ = v16 << 16;
        --v14;
      }
      while (v14);
    }
    if (*(_WORD *)(a1 + 2914))
    {
      v17 = *(unsigned __int16 *)(a1 + 2914) - 1;
      do
      {
        v18 = *v10++;
        *(_WORD *)(a1 + 2 * v17 + 3040) = v18;
      }
      while ((unint64_t)v17--);
    }
    v20 = *(unsigned __int16 *)(a1 + 2918);
    if (*(_WORD *)(a1 + 2918))
    {
      v21 = (_DWORD *)(a1 + 3080);
      do
      {
        v22 = *v10++;
        *v21++ = v22 << 16;
        --v20;
      }
      while (v20);
    }
    *(_QWORD *)(a1 + 3896) = (char *)v10 + 2;
    v23 = 1;
    if (v4)
    {
      v24 = 0;
      v25 = (4 * v9 - 2);
      v26 = *(_DWORD *)(a1 + 3548);
      while (1)
      {
        v27 = *(unsigned __int16 **)(a1 + 3896);
        v30 = *v27;
        v28 = v27 + 1;
        v29 = v30;
        *(_QWORD *)(a1 + 3896) = v28;
        if (v26 <= v30 && ((v31 = *(float *)(a1 + 3552), v26 + 1 >= v29) || v31 == 0.0) && (v26 >= v29 || v31 != 0.0))
        {
          v32 = malloc_type_calloc(1uLL, 0xC90uLL, 0x102004011C89CF6uLL);
          if (!v32)
          {
            v48 = "e: no memory";
            goto LABEL_46;
          }
          v33 = v32;
          v34 = *(unsigned __int16 **)(a1 + 3896);
          v35 = *v34;
          *(_QWORD *)(a1 + 3896) = v34 + 1;
          *((_DWORD *)v32 + 803) = (int)((float)((float)((float)v35 * 65536.0) / 10.0) + 0.5);
          *((_DWORD *)v32 + 2) = 1;
          v36 = *(unsigned __int16 *)(a1 + 2912);
          if (*(_WORD *)(a1 + 2912))
          {
            LODWORD(v37) = *(unsigned __int16 *)(a1 + 2916);
            v38 = v36 - 1;
            do
            {
              if ((_DWORD)v37)
              {
                v39 = 0;
                do
                {
                  v40 = *(int **)(a1 + 3896);
                  v41 = *v40;
                  *(_QWORD *)(a1 + 3896) = v40 + 1;
                  *((float *)v32 + 20 * v38 + v39++ + 3) = (float)v41 * 0.125;
                  v37 = *(unsigned __int16 *)(a1 + 2916);
                }
                while (v39 < v37);
              }
              --v38;
              --v36;
            }
            while ((_DWORD)v36);
          }
          v42 = *(unsigned __int16 *)(a1 + 2914);
          if (*(_WORD *)(a1 + 2914))
          {
            LODWORD(v43) = *(unsigned __int16 *)(a1 + 2918);
            v44 = v42 - 1;
            do
            {
              if ((_DWORD)v43)
              {
                v45 = 0;
                do
                {
                  v46 = *(int **)(a1 + 3896);
                  v47 = *v46;
                  *(_QWORD *)(a1 + 3896) = v46 + 1;
                  *((float *)v32 + 20 * v44 + v45++ + 403) = (float)v47 * 0.125;
                  v43 = *(unsigned __int16 *)(a1 + 2918);
                }
                while (v45 < v43);
              }
              --v44;
              --v42;
            }
            while ((_DWORD)v42);
          }
          if ((sub_1000171A8(a1, *((_DWORD *)v32 + 803), (_DWORD *)(a1 + 3508), (unsigned int *)(a1 + 3424)) & 1) == 0)
          {
            free(v33);
            return 0;
          }
          v26 = *v50;
          if (*v50 == v29)
          {
            *v33 = *(_QWORD *)(a1 + 3584);
            *(_QWORD *)(a1 + 3584) = v33;
            v26 = v29;
          }
          else
          {
            *v33 = *(_QWORD *)(a1 + 3592);
            *(_QWORD *)(a1 + 3592) = v33;
          }
        }
        else
        {
          *(_QWORD *)(a1 + 3896) = (char *)v28 + v25;
        }
        if (++v24 == v4)
          return 1;
      }
    }
  }
  else
  {
    v48 = "e: prox LUTs should come after config parameters";
LABEL_46:
    puts(v48);
    return 0;
  }
  return v23;
}

uint64_t sub_10000DE20(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  float *v11;
  unsigned int v12;
  uint64_t v13;
  float *v14;
  int v15;
  int v16;
  uint64_t v17;
  unsigned __int16 *v18;
  unsigned int v19;
  unsigned int v20;
  float v21;
  double v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  int *v27;
  int v28;
  uint64_t v29;
  _DWORD *v30;
  int v31;
  char v32;
  unint64_t i;
  unint64_t v34;
  unint64_t v35;
  _WORD *v36;
  unint64_t v37;
  _WORD *v38;
  __int16 v39;
  __int16 v40;
  int *v41;
  _DWORD *v42;
  int v43;
  int v44;
  const char *v45;
  _DWORD *v47;

  if (*(_DWORD *)(a2 + 4) >= 0x20000u)
  {
    printf("e: unexpected PBDS version %d\n");
    return 0;
  }
  if (!*(_DWORD *)(a1 + 2864) || !*(_WORD *)(a1 + 2868))
  {
    v45 = "e: prox LUTs should come after config parameters";
LABEL_66:
    puts(v45);
    return 0;
  }
  v3 = *(_DWORD *)(a1 + 3408);
  v4 = 3 * *(unsigned __int16 *)(a1 + 2870) * v3 * *(unsigned __int16 *)(a1 + 3160) * *(unsigned __int16 *)(a1 + 3166);
  v5 = *(unsigned __int16 *)(a1 + 3162);
  v6 = *(unsigned __int16 *)(a1 + 3164);
  v7 = ((double)v5 * 0.5 * (double)v6 + 3.5 + (double)v6 + 0.9);
  if (*(_DWORD *)(a2 + 8) != v3 + v5 + v6 + v4 * v7 + 5)
  {
    printf("e: unexpected PBDS block size 0x%x != 0x%x\n");
    return 0;
  }
  *(_QWORD *)(a1 + 3896) += 2;
  v47 = (_DWORD *)(a1 + 3564);
  v8 = sub_100009280(a1, a1 + 3564, v3, (uint64_t)CFSTR("DisplayCoexPrioritizeProx"));
  v9 = *(unsigned __int16 *)(a1 + 3164);
  v10 = *(int **)(a1 + 3896);
  if (*(_WORD *)(a1 + 3164))
  {
    v11 = (float *)(a1 + 3328);
    do
    {
      v12 = *v10++;
      *v11++ = (float)v12 / 255.0;
      --v9;
    }
    while (v9);
  }
  v13 = *(unsigned __int16 *)(a1 + 3162);
  if (*(_WORD *)(a1 + 3162))
  {
    v14 = (float *)(a1 + 3248);
    do
    {
      v15 = *v10++;
      *v14++ = (float)v15 * 0.125;
      --v13;
    }
    while (v13);
  }
  *(_QWORD *)(a1 + 3896) = (char *)v10 + 2;
  if (!v4)
    return 1;
  v16 = 0;
  v17 = 4 * v7 - 2;
  while (1)
  {
    v18 = *(unsigned __int16 **)(a1 + 3896);
    v19 = *v18;
    *(_QWORD *)(a1 + 3896) = v18 + 1;
    v20 = *(_DWORD *)(a1 + 3564);
    if (v20 <= v19)
    {
      v21 = *(float *)(a1 + 3568);
      if ((v20 + 1 >= v19 || v21 == 0.0) && (v20 >= v19 || v21 != 0.0))
        break;
    }
    *(_QWORD *)(a1 + 3896) = (char *)v18 + v17 + 2;
LABEL_20:
    if (++v16 == v4)
      return 1;
  }
  LOWORD(v21) = v18[1];
  v22 = (float)((float)((float)LODWORD(v21) * 65536.0) / 10.0) + 0.5;
  v23 = (int)v22;
  LOWORD(v22) = v18[2];
  v24 = (int)((float)((float)LODWORD(v22) * 65536.0) + 0.5);
  v25 = *(_DWORD *)(v18 + 3);
  *(_QWORD *)(a1 + 3896) = v18 + 5;
  v8 = sub_100008D00(v8, v25);
  v26 = v8;
  v27 = *(int **)(a1 + 3896);
  v28 = *v27;
  *(_QWORD *)(a1 + 3896) = v27 + 1;
  v29 = 3608;
  if (*(_DWORD *)(a1 + 3564) == v19)
    v29 = 3600;
  v30 = *(_DWORD **)(a1 + v29);
  if (v30)
  {
    while (v30[664] != v23 || v30[665] != v24 || v30[666] != v28)
    {
      v30 = *(_DWORD **)v30;
      if (!v30)
        goto LABEL_29;
    }
    v32 = 0;
    v31 = v30[663];
    goto LABEL_31;
  }
LABEL_29:
  v8 = (uint64_t)malloc_type_calloc(1uLL, 0xA70uLL, 0x10200402CC89F78uLL);
  if (!v8)
  {
    v45 = "e: no memory";
    goto LABEL_66;
  }
  v30 = (_DWORD *)v8;
  v31 = 0;
  *(_DWORD *)(v8 + 2656) = v23;
  *(_DWORD *)(v8 + 2660) = v24;
  *(_DWORD *)(v8 + 2664) = v28;
  v32 = 1;
  *(_DWORD *)(v8 + 2652) = 0;
LABEL_31:
  v30[663] = v31 | v26;
  LODWORD(i) = *(unsigned __int16 *)(a1 + 3164);
  if (!*(_WORD *)(a1 + 3164))
  {
    v41 = *(int **)(a1 + 3896);
    goto LABEL_57;
  }
  v34 = 0;
  LODWORD(v35) = *(unsigned __int16 *)(a1 + 3162);
  v36 = v30;
  do
  {
    if (!(_DWORD)v35)
      goto LABEL_44;
    v37 = 0;
    i = *(_QWORD *)(a1 + 3896);
    v38 = v36;
    do
    {
      v40 = *(_WORD *)i;
      i += 2;
      v39 = v40;
      if ((v26 & 1) != 0)
      {
        v38[6] = v39;
        if ((v26 & 2) == 0)
        {
LABEL_37:
          if ((v26 & 4) == 0)
            goto LABEL_39;
LABEL_38:
          v38[806] = v39;
          goto LABEL_39;
        }
      }
      else if ((v26 & 2) == 0)
      {
        goto LABEL_37;
      }
      v38[406] = v39;
      if ((v26 & 4) != 0)
        goto LABEL_38;
LABEL_39:
      ++v37;
      v35 = *(unsigned __int16 *)(a1 + 3162);
      ++v38;
    }
    while (v37 < v35);
    *(_QWORD *)(a1 + 3896) = i;
    LODWORD(i) = *(unsigned __int16 *)(a1 + 3164);
LABEL_44:
    ++v34;
    v36 += 20;
  }
  while (v34 < i);
  v41 = *(int **)(a1 + 3896);
  if ((_DWORD)i)
  {
    v42 = v30 + 603;
    for (i = i; i; --i)
    {
      v44 = *v41++;
      v43 = v44;
      if ((v26 & 1) != 0)
      {
        *v42 = v43;
        if ((v26 & 2) != 0)
        {
LABEL_54:
          v42[20] = v43;
          if ((v26 & 4) == 0)
            goto LABEL_51;
LABEL_50:
          v42[40] = v43;
          goto LABEL_51;
        }
      }
      else if ((v26 & 2) != 0)
      {
        goto LABEL_54;
      }
      if ((v26 & 4) != 0)
        goto LABEL_50;
LABEL_51:
      ++v42;
    }
  }
LABEL_57:
  *(_QWORD *)(a1 + 3896) = (char *)v41 + 2;
  if ((v32 & 1) == 0)
    goto LABEL_20;
  if (sub_1000171A8(a1, v30[664], (_DWORD *)(a1 + 2872), (unsigned int *)(a1 + 3412)))
  {
    if (sub_1000171A8(a1, v30[665], (_DWORD *)(a1 + 3208), (unsigned int *)(a1 + 3416)))
    {
      v8 = sub_100017254(a1, v30[666], (unsigned int *)(a1 + 3168), (unsigned int *)(a1 + 3420));
      if ((v8 & 1) != 0)
      {
        if (*v47 == v19)
        {
          *(_QWORD *)v30 = *(_QWORD *)(a1 + 3600);
          *(_QWORD *)(a1 + 3600) = v30;
        }
        else
        {
          *(_QWORD *)v30 = *(_QWORD *)(a1 + 3608);
          *(_QWORD *)(a1 + 3608) = v30;
        }
        goto LABEL_20;
      }
    }
  }
  free(v30);
  return 0;
}

uint64_t sub_10000E2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t i;
  const char *v7;
  int v9;
  _OWORD v10[2];
  int v11;

  if (*(_DWORD *)(a2 + 4) < 0x30000u)
  {
    v3 = 0;
    v4 = v10;
    v11 = 0;
    memset(v10, 0, sizeof(v10));
    v9 = 1;
    v5 = *(_QWORD *)(a1 + 3896);
    do
    {
      for (i = 0; i != 12; i += 4)
        *(_DWORD *)((char *)v4 + i) = *(_DWORD *)(v5 + i);
      ++v3;
      v4 = (_OWORD *)((char *)v4 + 12);
      v5 += 12;
    }
    while (v3 != 3);
    *(_QWORD *)(a1 + 3896) = v5;
    v2 = (*(uint64_t (**)(uint64_t, int *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(98, &v9, 40, 0, 0, *(_QWORD *)(a1 + 16));
    if ((_DWORD)v2)
      v7 = "i:  UPCL set DPCL data succeeded";
    else
      v7 = "e: UPCL set DPCL data failed";
    puts(v7);
  }
  else
  {
    printf("e: Unexpected DPCL block version 0x%x\n", *(_DWORD *)(a2 + 4));
    return 0;
  }
  return v2;
}

uint64_t sub_10000E380(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;

  if (*(_DWORD *)(a2 + 4) >= 0x20000u)
  {
    printf("e: unexpected LLMT block version %d\n");
    return 0;
  }
  *(_DWORD *)(a1 + 3616) = 1;
  if (*(_DWORD *)(a2 + 8) != 20)
  {
    printf("e: unexpected LLMT block size %d\n");
    return 0;
  }
  v2 = 0;
  v3 = *(_QWORD *)(a1 + 3896);
  do
  {
    *(_WORD *)(a1 + 3620 + v2) = *(_WORD *)(v3 + v2);
    v2 += 2;
  }
  while (v2 != 32);
  for (i = 0; i != 32; i += 2)
    *(_WORD *)(a1 + 3652 + i) = *(_WORD *)(v3 + i + 32);
  *(_WORD *)(a1 + 3684) = *(_WORD *)(v3 + 64);
  *(_QWORD *)(a1 + 3896) = v3 + 68;
  return 1;
}

uint64_t sub_10000E444(uint64_t a1, uint64_t a2)
{
  const char *v3;
  int v4;

  if (*(unsigned __int16 *)(a2 + 6) << 16 == 0x10000 && *(_DWORD *)(a2 + 8) == 4)
  {
    v4 = **(_DWORD **)(a1 + 3896);
    if ((*(unsigned int (**)(uint64_t, int *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(99, &v4, 4, 0, 0, *(_QWORD *)(a1 + 16)))
    {
      puts("i: set user_cal_aft_gain succeeded");
      return 1;
    }
    v3 = "e: set user_cal_aft_gain failed";
  }
  else
  {
    v3 = "e: Bad size/version for aftg";
  }
  puts(v3);
  return 0;
}

BOOL sub_10000E4D8(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  __int16 *v5;
  __int16 v6;
  __int16 *v7;
  __int16 v8;
  uint64_t v9;
  _WORD *v10;
  __int16 v11;
  __int16 *v12;
  __int16 v13;
  uint64_t i;
  __int16 *v15;
  __int16 v16;
  _WORD *v17;
  __int16 v18;
  uint64_t v19;
  __int16 *v20;
  __int16 v21;
  __int16 *v22;
  __int16 v23;
  _WORD *v24;
  __int16 v25;

  v2 = HIWORD(*(_DWORD *)(a2 + 4));
  v3 = v2 - 1;
  if ((v2 - 1) <= 1)
  {
    *(_DWORD *)(a1 + 3692) = v2;
    if (v2 == 2)
    {
      v19 = 0;
      v20 = *(__int16 **)(a1 + 3896);
      v21 = *v20;
      *(_QWORD *)(a1 + 3896) = v20 + 1;
      *(_WORD *)(a1 + 3696) = v21;
      do
      {
        v22 = *(__int16 **)(a1 + 3896);
        v23 = *v22;
        *(_QWORD *)(a1 + 3896) = v22 + 1;
        *(_WORD *)(a1 + 3698 + v19) = v23;
        v19 += 2;
      }
      while (v19 != 22);
      v24 = *(_WORD **)(a1 + 3896);
      *(_WORD *)(a1 + 3720) = *v24;
      *(_WORD *)(a1 + 3722) = v24[1];
      *(_WORD *)(a1 + 3724) = v24[2];
      *(_WORD *)(a1 + 3726) = v24[3];
      *(_WORD *)(a1 + 3728) = v24[4];
      v25 = v24[5];
      *(_QWORD *)(a1 + 3896) = v24 + 6;
      *(_WORD *)(a1 + 3730) = v25;
    }
    else if (v2 == 1)
    {
      v4 = 0;
      v5 = *(__int16 **)(a1 + 3896);
      v6 = *v5;
      *(_QWORD *)(a1 + 3896) = v5 + 1;
      *(_WORD *)(a1 + 3696) = v6;
      do
      {
        v7 = *(__int16 **)(a1 + 3896);
        v8 = *v7;
        *(_QWORD *)(a1 + 3896) = v7 + 1;
        *(_WORD *)(a1 + 3698 + v4) = v8;
        v4 += 2;
      }
      while (v4 != 22);
      v9 = 0;
      v10 = *(_WORD **)(a1 + 3896);
      *(_WORD *)(a1 + 3720) = *v10;
      v11 = v10[1];
      *(_QWORD *)(a1 + 3896) = v10 + 2;
      *(_WORD *)(a1 + 3722) = v11;
      do
      {
        v12 = *(__int16 **)(a1 + 3896);
        v13 = *v12;
        *(_QWORD *)(a1 + 3896) = v12 + 1;
        *(_WORD *)(a1 + 3724 + v9) = v13;
        v9 += 2;
      }
      while (v9 != 6);
      for (i = 0; i != 6; i += 2)
      {
        v15 = *(__int16 **)(a1 + 3896);
        v16 = *v15;
        *(_QWORD *)(a1 + 3896) = v15 + 1;
        *(_WORD *)(a1 + 3730 + i) = v16;
      }
      v17 = *(_WORD **)(a1 + 3896);
      *(_WORD *)(a1 + 3736) = *v17;
      *(_WORD *)(a1 + 3738) = v17[1];
      v18 = v17[2];
      *(_QWORD *)(a1 + 3896) = v17 + 3;
      *(_WORD *)(a1 + 3740) = v18;
    }
  }
  return v3 < 2;
}

uint64_t sub_10000E63C(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  __int16 *v5;
  __int16 v6;
  uint64_t v7;
  int v8;
  int v9;
  _WORD *v10;
  _WORD *v11;
  uint64_t v12;
  int *v13;
  int v14;
  uint64_t v15;
  _WORD *v16;
  uint64_t v17;
  _WORD *v18;
  uint64_t v19;
  _WORD *v20;
  uint64_t v21;
  _WORD *v22;
  uint64_t i;
  __int16 *v24;
  __int16 v25;
  unsigned int v26;
  _WORD *v27;
  _WORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = *(_DWORD *)(a2 + 4);
  if (v3 == 0x20000 || v3 == 0x10000)
  {
    v4 = HIWORD(v3);
    v5 = *(__int16 **)(a1 + 3896);
    v6 = *v5;
    v7 = *(_QWORD *)(v5 + 1);
    v8 = (unsigned __int16)v5[5];
    *(_QWORD *)(a1 + 3896) = v5 + 6;
    if (v4 == 2)
    {
      v9 = (unsigned __int16)v5[6];
      *(_QWORD *)(a1 + 3896) = v5 + 7;
    }
    else
    {
      v9 = 0;
    }
    v10 = sub_100008FE0(a1, v8, v9);
    if (v10)
    {
      v11 = v10;
      *(_DWORD *)(v10 + 5) = v4;
      v10[4] = v8;
      if (v4 == 2)
      {
        v29 = 0;
        v10[7] = v6;
        *(_QWORD *)(v10 + 11) = v7;
        v10[15] = v8;
        v10[16] = v9;
        v30 = *(_QWORD *)(a1 + 3896);
        do
        {
          *(_DWORD *)&v10[v29 + 19] = *(_DWORD *)(v30 + v29 * 2);
          v29 += 2;
        }
        while ((_DWORD)(v29 * 2) != 84);
        v31 = 0;
        do
        {
          v10[v31 + 61] = *(_WORD *)(v30 + 84 + v31 * 2);
          ++v31;
        }
        while ((_DWORD)(v31 * 2) != 1386);
        *(_QWORD *)(a1 + 3896) = v30 + 1470;
        if (sub_10000EDC8(a1, (unsigned __int16)v10[4], (_WORD *)(a1 + 3732), (_WORD *)(a1 + 3748)))
        {
          v26 = (unsigned __int16)v11[16];
          v27 = (_WORD *)(a1 + 3750);
          v28 = (_WORD *)(a1 + 3766);
          return sub_10000EDC8(a1, v26, v27, v28);
        }
      }
      else if (v4 == 1)
      {
        v10[7] = v6;
        *(_QWORD *)(v10 + 11) = v7;
        v12 = 17;
        v10[16] = v8;
        do
        {
          v13 = *(int **)(a1 + 3896);
          v14 = *v13;
          *(_QWORD *)(a1 + 3896) = v13 + 1;
          *(_DWORD *)&v10[v12] = v14;
          v12 += 2;
        }
        while (v12 != 59);
        v15 = 0;
        v16 = v10 + 59;
        do
        {
          v17 = 0;
          v18 = v16;
          do
          {
            v19 = 0;
            v20 = v18;
            do
            {
              v21 = 0;
              v22 = v20;
              do
              {
                for (i = 0; i != 21; ++i)
                {
                  v24 = *(__int16 **)(a1 + 3896);
                  v25 = *v24;
                  *(_QWORD *)(a1 + 3896) = v24 + 1;
                  v22[i] = v25;
                }
                ++v21;
                v22 += 21;
              }
              while (v21 != 11);
              ++v19;
              v20 += 231;
            }
            while (v19 != 3);
            ++v17;
            v18 += 693;
          }
          while (v17 != 2);
          ++v15;
          v16 += 1386;
        }
        while (v15 != 3);
        v26 = (unsigned __int16)v10[4];
        v27 = (_WORD *)(a1 + 3742);
        v28 = (_WORD *)(a1 + 3758);
        return sub_10000EDC8(a1, v26, v27, v28);
      }
    }
  }
  return 0;
}

uint64_t sub_10000E844(uint64_t a1, uint64_t a2)
{
  unsigned __int16 *v4;
  unsigned int v5;
  unsigned __int16 *v6;
  _WORD *v7;
  int v8;
  unsigned __int16 *v9;
  unsigned __int16 v10;
  unsigned __int16 *v11;
  int v12;
  int v13;
  unint64_t v14;
  int *v15;
  int v16;
  uint64_t i;
  unsigned __int16 *v18;
  unsigned __int16 v19;
  int v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t j;
  __int16 *v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  uint64_t k;
  __int16 *v31;
  __int16 v32;
  uint64_t m;
  unsigned __int16 *v34;
  unsigned __int16 v35;
  int v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t n;
  int *v42;
  int v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t ii;
  __int16 *v51;
  __int16 v52;
  uint64_t v53;
  unsigned __int16 *v54;
  uint64_t jj;
  unsigned __int16 *v56;
  unsigned __int16 v57;
  __int16 *v58;
  int v59;
  unint64_t v60;
  unsigned __int16 *v61;
  uint64_t v62;
  unsigned __int16 *v63;
  uint64_t kk;
  unsigned __int16 *v65;
  unsigned __int16 v66;
  __int16 v67;
  unsigned __int16 *v68;
  unint64_t v69;
  __int16 v70;
  unsigned int v71;
  unint64_t v72;
  unsigned __int16 *v73;
  int v74;
  unint64_t v75;
  unsigned __int16 *v76;
  unsigned __int16 v77;
  unint64_t v78;
  unsigned __int16 *v79;
  unint64_t v80;
  unsigned __int16 *v81;
  unsigned __int16 v82;
  uint64_t v83;
  const char *v85;
  uint64_t v86;
  int v87;
  unsigned __int16 *v88;

  v4 = (unsigned __int16 *)malloc_type_calloc(1uLL, 0x3B828uLL, 0x1000040B9B2AFE7uLL);
  v5 = HIWORD(*(_DWORD *)(a2 + 4));
  if (v5 > 2)
    return 0;
  v6 = v4;
  v7 = v4 + 120973;
  v8 = 4 * *(_DWORD *)(a2 + 8);
  *(_DWORD *)v4 = v5;
  v9 = *(unsigned __int16 **)(a1 + 3896);
  v10 = *v9;
  *(_QWORD *)(a1 + 3896) = v9 + 1;
  v4[2] = v10;
  v11 = *(unsigned __int16 **)(a1 + 3896);
  v12 = *v11;
  *(_QWORD *)(a1 + 3896) = v11 + 1;
  v4[3] = v12;
  v13 = v8 - 16;
  if (v12)
  {
    v14 = 0;
    do
    {
      v15 = *(int **)(a1 + 3896);
      v16 = *v15;
      *(_QWORD *)(a1 + 3896) = v15 + 1;
      *(_DWORD *)&v4[2 * v14 + 4] = v16;
      v13 -= 4;
      ++v14;
    }
    while (v14 < v4[3]);
  }
  for (i = 94; i != 108; ++i)
  {
    v18 = *(unsigned __int16 **)(a1 + 3896);
    v19 = *v18;
    *(_QWORD *)(a1 + 3896) = v18 + 1;
    v4[i] = v19;
  }
  v20 = v13 - 28;
  if (v4[3])
  {
    v21 = 0;
    v22 = (char *)(v4 + 108);
    do
    {
      v23 = 0;
      v24 = v22;
      do
      {
        for (j = 0; j != 32; j += 2)
        {
          v26 = *(__int16 **)(a1 + 3896);
          v27 = *v26;
          *(_QWORD *)(a1 + 3896) = v26 + 1;
          *(_WORD *)&v24[j] = v27;
        }
        ++v23;
        v24 += 32;
      }
      while (v23 != 3);
      v20 -= 96;
      ++v21;
      v22 += 96;
    }
    while (v21 < v4[3]);
    if (v4[3])
    {
      v28 = 0;
      v29 = (char *)(v4 + 2268);
      do
      {
        for (k = 0; k != 32; k += 2)
        {
          v31 = *(__int16 **)(a1 + 3896);
          v32 = *v31;
          *(_QWORD *)(a1 + 3896) = v31 + 1;
          *(_WORD *)&v29[k] = v32;
        }
        v20 -= 32;
        ++v28;
        v29 += 32;
      }
      while (v28 < v4[3]);
    }
  }
  for (m = 2988; m != 2992; ++m)
  {
    v34 = *(unsigned __int16 **)(a1 + 3896);
    v35 = *v34;
    *(_QWORD *)(a1 + 3896) = v34 + 1;
    v4[m] = v35;
  }
  v36 = v20 - 8;
  if (v4[3])
  {
    v37 = 0;
    v38 = (char *)(v4 + 2992);
    do
    {
      v39 = 0;
      v40 = v38;
      do
      {
        for (n = 0; n != 1028; n += 4)
        {
          v42 = *(int **)(a1 + 3896);
          v43 = *v42;
          *(_QWORD *)(a1 + 3896) = v42 + 1;
          *(_DWORD *)&v40[n] = v43;
        }
        ++v39;
        v40 += 1028;
      }
      while (v39 != 3);
      v36 -= 3084;
      ++v37;
      v38 += 3084;
    }
    while (v37 < v4[3]);
  }
  v44 = 0;
  v45 = (char *)(v4 + 72382);
  do
  {
    v46 = 0;
    v47 = v45;
    do
    {
      v48 = 0;
      v49 = v47;
      do
      {
        for (ii = 0; ii != 22; ii += 2)
        {
          v51 = *(__int16 **)(a1 + 3896);
          v52 = *v51;
          *(_QWORD *)(a1 + 3896) = v51 + 1;
          *(_WORD *)&v49[ii] = v52;
        }
        ++v48;
        v49 += 22;
      }
      while (v48 != 21);
      ++v46;
      v47 += 462;
    }
    while (v46 != 10);
    ++v44;
    v45 += 4620;
  }
  while (v44 != 20);
  v53 = 0;
  v54 = v6 + 118582;
  do
  {
    for (jj = 0; jj != 11; ++jj)
    {
      v56 = *(unsigned __int16 **)(a1 + 3896);
      v57 = *v56;
      *(_QWORD *)(a1 + 3896) = v56 + 1;
      v54[jj] = v57;
    }
    ++v53;
    v54 += 11;
  }
  while (v53 != 21);
  v58 = (__int16 *)(*(_QWORD *)(a1 + 3896) + 2);
  *(_QWORD *)(a1 + 3896) = v58;
  v59 = v36 - 92864;
  if (v5 == 2)
  {
    if (v6[3])
    {
      v60 = 0;
      v61 = v6 + 118813;
      do
      {
        v62 = 0;
        v63 = v61;
        do
        {
          for (kk = 0; kk != 16; ++kk)
          {
            v65 = *(unsigned __int16 **)(a1 + 3896);
            v66 = *v65;
            *(_QWORD *)(a1 + 3896) = v65 + 1;
            v63[kk] = v66;
          }
          ++v62;
          v63 += 16;
        }
        while (v62 != 3);
        v59 -= 96;
        ++v60;
        v61 += 48;
      }
      while (v60 < v6[3]);
      v58 = *(__int16 **)(a1 + 3896);
    }
    v67 = *v58;
    *(_QWORD *)(a1 + 3896) = v58 + 1;
    *v7 = v67;
    v68 = *(unsigned __int16 **)(a1 + 3896);
    v70 = *v68;
    LODWORD(v69) = *v68;
    *(_QWORD *)(a1 + 3896) = v68 + 1;
    v7[1] = v70;
    v59 -= 4;
    v71 = v6[3];
    if (v6[3])
    {
      v72 = 0;
      v73 = v6 + 120975;
      v74 = v69;
      do
      {
        if (v74)
        {
          v75 = 0;
          do
          {
            v76 = *(unsigned __int16 **)(a1 + 3896);
            v77 = *v76;
            *(_QWORD *)(a1 + 3896) = v76 + 1;
            v73[v75] = v77;
            v59 -= 2;
            ++v75;
            v69 = (unsigned __int16)v7[1];
          }
          while (v75 < v69);
          v71 = v6[3];
          v74 = (unsigned __int16)v7[1];
        }
        ++v72;
        v73 += 10;
      }
      while (v72 < v71);
      if (v71)
      {
        v78 = 0;
        v79 = v6 + 121425;
        do
        {
          if ((_DWORD)v69)
          {
            v80 = 0;
            do
            {
              v81 = *(unsigned __int16 **)(a1 + 3896);
              v82 = *v81;
              *(_QWORD *)(a1 + 3896) = v81 + 1;
              v79[v80] = v82;
              v59 -= 2;
              ++v80;
              v69 = (unsigned __int16)v7[1];
            }
            while (v80 < v69);
            v71 = v6[3];
          }
          ++v78;
          v79 += 10;
        }
        while (v78 < v71);
      }
    }
  }
  if (v59)
  {
    printf("e: IRDC Block data and header size mismatch by %d too many bytes\n", v59);
    return 0;
  }
  v86 = 1;
  v88 = v6;
  v87 = 245760;
  v83 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(113, &v86, 20, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v83)
    v85 = "i: set IRDC data succeeded";
  else
    v85 = "e: set IRDC data failed";
  puts(v85);
  free(v6);
  return v83;
}

uint64_t sub_10000ECE0(uint64_t a1, uint64_t a2)
{
  __int16 *v3;
  __int16 v4;
  int v5;
  int v6;
  _WORD *v7;
  unint64_t v8;
  __int16 *v9;
  __int16 v10;
  unint64_t v11;
  int *v12;
  int v13;

  if (*(_DWORD *)(a2 + 4) != 0x10000)
    return 0;
  v3 = *(__int16 **)(a1 + 3896);
  v4 = *v3;
  v5 = *((char *)v3 + 2);
  v6 = (unsigned __int16)v3[2];
  *(_QWORD *)(a1 + 3896) = v3 + 3;
  *(_WORD *)(a1 + 3792) = v4;
  v7 = sub_10000EFC0(a1, v5);
  if (!v7)
    return 0;
  *(_DWORD *)(v7 + 5) = 1;
  v7[8] = v5;
  v7[4] = v5;
  v7[9] = v6;
  if (v6)
  {
    v8 = 0;
    do
    {
      v9 = *(__int16 **)(a1 + 3896);
      v10 = *v9;
      *(_QWORD *)(a1 + 3896) = v9 + 1;
      v7[v8++ + 13] = v10;
    }
    while (v8 < (unsigned __int16)v7[9]);
    if (v7[9])
    {
      v11 = 0;
      do
      {
        v12 = *(int **)(a1 + 3896);
        v13 = *v12;
        *(_QWORD *)(a1 + 3896) = v12 + 1;
        *(_DWORD *)&v7[2 * v11++ + 53] = v13;
      }
      while (v11 < (unsigned __int16)v7[9]);
    }
  }
  return sub_10000F0C8(a1, v5, (unsigned __int16 *)(a1 + 3794), (_WORD *)(a1 + 3814));
}

uint64_t sub_10000EDC8(uint64_t a1, unsigned int a2, _WORD *a3, _WORD *a4)
{
  unsigned int v4;
  uint64_t result;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  v4 = (unsigned __int16)*a4;
  if (v4 <= 8)
  {
    if (*a4)
    {
      v6 = 0;
      v7 = a2;
      while (1)
      {
        v8 = (unsigned __int16)a3[v6];
        if (v8 == a2)
          return 1;
        v9 = v8 <= a2 && v7 == a2;
        v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          v10 = v8;
        }
        ++v6;
        v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 8)
            goto LABEL_2;
          if (v10 > (unsigned __int16)a3[(unsigned __int16)v4 - 1])
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_10000EE78(uint64_t a1)
{
  uint64_t **v1;
  char v3;
  _QWORD v5[3];

  v1 = *(uint64_t ***)(a1 + 3816);
  memset(v5, 0, 20);
  if (v1)
  {
    v3 = 1;
    do
    {
      LODWORD(v5[0]) = 1;
      *(_QWORD *)((char *)&v5[1] + 4) = (char *)v1 + 10;
      LODWORD(v5[1]) = 0x4000;
      BYTE4(v5[0]) = 0;
      if (((*(uint64_t (**)(uint64_t, _QWORD *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(117, v5, 20, 0, 0, *(_QWORD *)(a1 + 16)) & 1) == 0)
      {
        printf("e: failed to set ELVS LUT temperature %d\n", *((__int16 *)v1 + 4));
        v3 = 0;
      }
      v1 = (uint64_t **)*v1;
    }
    while (v1);
    if ((v3 & 1) == 0)
      return 0;
  }
  puts("i: set EVLS LUTs succeeded");
  return 1;
}

uint64_t sub_10000EF40(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 3816))
    *(_WORD *)(a1 + 24) |= 0x100u;
  return 1;
}

uint64_t sub_10000EF5C(uint64_t a1)
{
  uint64_t v1;
  const char *v2;

  *(_DWORD *)(a1 + 3788) = 1;
  v1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))a1)(116, a1 + 3788, 28, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v1)
    v2 = "i: set ELVS table config succeeded";
  else
    v2 = "e: failed to set ELVS table config";
  puts(v2);
  return v1;
}

_WORD *sub_10000EFC0(uint64_t a1, int a2)
{
  _QWORD *v3;
  uint64_t **v4;
  _WORD *v5;
  _WORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;

  v3 = (_QWORD *)(a1 + 3816);
  v4 = (uint64_t **)(a1 + 3816);
  while (1)
  {
    v4 = (uint64_t **)*v4;
    if (!v4)
      break;
    if (*((unsigned __int16 *)v4 + 4) == (unsigned __int16)a2)
    {
      printf("e: Duplicate elvs table temperature=%d found in input.\n", a2);
      return 0;
    }
  }
  v6 = malloc_type_calloc(1uLL, 0x110uLL, 0x10200405058FB69uLL);
  v5 = v6;
  if (v6)
  {
    bzero(v6, 0x110uLL);
    v5[4] = a2;
    v7 = (_QWORD *)*v3;
    if (*v3)
    {
      if (*((__int16 *)v7 + 4) <= a2)
      {
        v9 = (_QWORD *)*v3;
        while (1)
        {
          v7 = (_QWORD *)*v9;
          if (!*v9)
            break;
          v8 = v9;
          v9 = (_QWORD *)*v9;
          if (*((__int16 *)v7 + 4) > a2)
            goto LABEL_14;
        }
        *v9 = v5;
      }
      else
      {
        v8 = 0;
LABEL_14:
        if (v8)
          v10 = v8;
        else
          v10 = v3;
        *v10 = v5;
        *(_QWORD *)v5 = v7;
      }
    }
    else
    {
      *v3 = v5;
    }
  }
  else
  {
    puts("e: Out of memory");
  }
  return v5;
}

uint64_t sub_10000F0C8(uint64_t a1, unsigned __int16 a2, unsigned __int16 *a3, _WORD *a4)
{
  unsigned int v4;
  uint64_t result;
  unint64_t v6;
  int v7;
  int v8;
  BOOL v9;
  int v10;

  v4 = (unsigned __int16)*a4;
  if (v4 <= 0xA)
  {
    if (*a4)
    {
      v6 = 0;
      v7 = a2;
      while (1)
      {
        v8 = a3[v6];
        if (v8 == a2)
          return 1;
        v9 = (__int16)v8 <= (__int16)a2 && v7 == a2;
        v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          v10 = v8;
        }
        ++v6;
        v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 10)
            goto LABEL_2;
          if ((__int16)a3[(unsigned __int16)v4 - 1] < (__int16)v10)
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_10000F184(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  __int16 *v6;
  __int16 v7;
  unsigned __int16 *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  int *v18;
  int v19;
  uint64_t i;
  char *v21;
  uint64_t j;
  int v23;
  BOOL v24;
  uint64_t k;
  uint64_t m;
  int v27;
  BOOL v28;
  uint64_t n;
  int v30;
  const char *v31;
  uint64_t result;
  int v33;
  __int16 v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v37;
  char v38;
  int v39;
  uint64_t v40;
  char v41;
  int v42;
  _BYTE v43[578];
  _BYTE __b[578];
  __int128 v45;
  uint64_t v46;

  v2 = *(unsigned __int16 *)(a2 + 6);
  v3 = *(_DWORD *)(a1 + 28);
  if (v3)
    v4 = v2 == v3;
  else
    v4 = 1;
  if (!v4)
  {
    printf("e: unexpected block version %d\n");
    return 0;
  }
  v5 = a1;
  *(_DWORD *)(a1 + 28) = 3;
  if (*(_DWORD *)(a2 + 8) != 336)
  {
    printf("e: unexpected block size %d\n");
    return 0;
  }
  v6 = *(__int16 **)(a1 + 3896);
  v7 = *v6;
  *(_QWORD *)(a1 + 3896) = v6 + 1;
  *(_WORD *)(a1 + 244) = v7;
  v45 = *(_OWORD *)(v6 + 1);
  v46 = *(_QWORD *)(v6 + 9);
  v8 = (unsigned __int16 *)(v6 + 13);
  *(_QWORD *)(a1 + 3896) = v6 + 13;
  if (!*(_BYTE *)(a1 + 2136))
  {
    a1 = sub_100008A34(a1, (uint64_t)&v45, 6);
    v8 = *(unsigned __int16 **)(v5 + 3896);
  }
  v9 = *v8;
  v10 = v8[1];
  v11 = v8[2];
  v12 = v8[3];
  v13 = *((_DWORD *)v8 + 2);
  *(_QWORD *)(v5 + 3896) = v8 + 6;
  v14 = sub_100008D00(a1, v13);
  if (!v14)
  {
    v31 = "e: useless PDC table";
LABEL_37:
    puts(v31);
    return 0;
  }
  v15 = v14;
  v16 = 0;
  v17 = (v10 << 16) / 10;
  v18 = *(int **)(v5 + 3896);
  do
  {
    v19 = *v18++;
    *(_DWORD *)(v5 + 260 + 4 * v16++) = v19;
  }
  while (v16 != 10);
  *(_DWORD *)(v5 + 300) = *v18;
  for (i = 76; i != 80; ++i)
    *(_DWORD *)(v5 + i * 4) = v18[i - 75];
  v21 = (char *)v18 + 30;
  for (j = 176; j != 210; j += 2)
  {
    v23 = *((unsigned __int16 *)v21 - 5);
    if (*(_WORD *)(v5 + j))
      v24 = v23 == *(unsigned __int16 *)(v5 + j);
    else
      v24 = 1;
    if (!v24)
    {
      *(_QWORD *)(v5 + 3896) = v21 - 8;
      v31 = "e: inconsistent DC index";
      goto LABEL_37;
    }
    *(_WORD *)(v5 + j) = v23;
    v21 += 2;
  }
  *(_WORD *)(v5 + 250) = 17;
  memset(__b, 170, sizeof(__b));
  for (k = 0; k != 578; k += 2)
  {
    *(_WORD *)&__b[k] = *((_WORD *)v21 - 5);
    v21 += 2;
  }
  for (m = 210; m != 244; m += 2)
  {
    v27 = *((unsigned __int16 *)v21 - 5);
    if (*(_WORD *)(v5 + m))
      v28 = v27 == *(unsigned __int16 *)(v5 + m);
    else
      v28 = 1;
    if (!v28)
    {
      *(_QWORD *)(v5 + 3896) = v21 - 8;
      v31 = "e: inconsistent PM index";
      goto LABEL_37;
    }
    *(_WORD *)(v5 + m) = v27;
    v21 += 2;
  }
  *(_WORD *)(v5 + 252) = 17;
  memset(v43, 170, sizeof(v43));
  for (n = 0; n != 578; n += 2)
  {
    *(_WORD *)&v43[n] = *((_WORD *)v21 - 5);
    v21 += 2;
  }
  v30 = *((unsigned __int16 *)v21 - 5);
  *(_QWORD *)(v5 + 3896) = v21 - 8;
  if ((v30 - 3) < 0xFFFFFFFE)
  {
    printf("e: illegal frame count %d\n");
    return 0;
  }
  v33 = *((_DWORD *)v21 - 2);
  *(_WORD *)(v5 + 320) = *((_WORD *)v21 - 2);
  v34 = *((_WORD *)v21 - 1);
  *(_QWORD *)(v5 + 3896) = v21;
  *(_WORD *)(v5 + 322) = v34;
  result = (uint64_t)sub_100008D8C(v5, v2, v9, v17, v12 << 16, v15, v11, v33);
  if (result)
  {
    v35 = result;
    if (*(_WORD *)(result + 3508))
      v36 = v30 == *(unsigned __int16 *)(result + 3508);
    else
      v36 = 1;
    if (!v36)
    {
      v31 = "e: inconsistent nframes value";
      goto LABEL_37;
    }
    v37 = 0;
    *(_DWORD *)(result + 20) |= v15;
    v38 = 1;
    do
    {
      if ((v15 & 1) != 0)
        *(_WORD *)(result + v37 + 40) = *(_WORD *)&__b[v37];
      if ((v15 & 2) != 0)
        *(_WORD *)(result + v37 + 618) = *(_WORD *)&__b[v37];
      v39 = *(unsigned __int16 *)&__b[v37];
      if ((v15 & 4) != 0)
        *(_WORD *)(result + v37 + 1196) = v39;
      v38 &= v39 == 0;
      v37 += 2;
    }
    while (v37 != 578);
    if ((v38 & 1) != 0)
    {
      printf("e: DCLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
      return 0;
    }
    v40 = 0;
    v41 = 1;
    do
    {
      if ((v15 & 1) != 0)
        *(_WORD *)(result + v40 + 1774) = *(_WORD *)&v43[v40];
      if ((v15 & 2) != 0)
        *(_WORD *)(result + v40 + 2352) = *(_WORD *)&v43[v40];
      v42 = *(unsigned __int16 *)&v43[v40];
      if ((v15 & 4) != 0)
        *(_WORD *)(result + v40 + 2930) = v42;
      v41 &= v42 == 0;
      v40 += 2;
    }
    while (v40 != 578);
    if ((v41 & 1) != 0)
    {
      printf("e: PMLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
      return 0;
    }
    *(_WORD *)(result + 3508) = v30;
    result = sub_100010190(v5, *(_DWORD *)(result + 8), (int *)(v5 + 36), (_WORD *)(v5 + 246));
    if ((_DWORD)result)
    {
      result = sub_100010190(v5, *(_DWORD *)(v35 + 16), (int *)(v5 + 76), (_WORD *)(v5 + 248));
      if ((_DWORD)result)
      {
        result = sub_100010238(v5, *(unsigned __int16 *)(v35 + 12), (_WORD *)(v5 + 116), (_WORD *)(v5 + 254));
        if ((_DWORD)result)
          return sub_1000102E8(v5, *(_DWORD *)(v35 + 24), (unsigned int *)(v5 + 136), (_WORD *)(v5 + 256));
      }
    }
  }
  return result;
}

uint64_t sub_10000F610(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  __int16 *v6;
  __int16 v7;
  unsigned __int16 *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  _WORD *v19;
  _BOOL4 v20;
  uint64_t result;
  const char *v22;
  unsigned int v23;
  uint64_t i;
  _WORD *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  char v34;
  unsigned __int16 *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  BOOL v41;
  uint64_t v42;
  char v43;
  unsigned __int16 *v44;
  int v45;
  unsigned __int16 *v46;
  int v47;
  int v48;
  __int128 v49;
  uint64_t v50;

  v2 = *(unsigned __int16 *)(a2 + 6);
  v3 = *(_DWORD *)(a1 + 28);
  if (v3)
    v4 = v2 == v3;
  else
    v4 = 1;
  if (!v4)
  {
    printf("e: unexpected block version %d\n");
    return 0;
  }
  v5 = a1;
  *(_DWORD *)(a1 + 28) = 4;
  if (*(_DWORD *)(a2 + 8) != 219)
  {
    printf("e: unexpected block size %d\n");
    return 0;
  }
  v6 = *(__int16 **)(a1 + 3896);
  v7 = *v6;
  *(_QWORD *)(a1 + 3896) = v6 + 1;
  *(_WORD *)(a1 + 348) = v7;
  v49 = *(_OWORD *)(v6 + 1);
  v50 = *(_QWORD *)(v6 + 9);
  v8 = (unsigned __int16 *)(v6 + 13);
  *(_QWORD *)(a1 + 3896) = v8;
  if (!*(_BYTE *)(a1 + 2136))
  {
    a1 = sub_100008A34(a1, (uint64_t)&v49, 6);
    v8 = *(unsigned __int16 **)(v5 + 3896);
  }
  v9 = *v8;
  v10 = v8[1];
  v11 = v8[2];
  v12 = v8[3];
  v13 = *((_DWORD *)v8 + 2);
  *(_QWORD *)(v5 + 3896) = v8 + 6;
  v14 = sub_100008D00(a1, v13);
  if (!v14)
  {
    v22 = "e: channel not specified";
    goto LABEL_37;
  }
  v15 = v14;
  v16 = *(_QWORD *)(v5 + 3896);
  v18 = *(_DWORD *)(v16 + 48);
  v17 = *(_DWORD *)(v16 + 52);
  v19 = (_WORD *)(v16 + 56);
  *(_QWORD *)(v5 + 3896) = v19;
  v20 = v17 == 538988366;
  if (v18 == 1 && v17 != 538988366)
    return 1;
  v23 = (v10 << 16) / 10;
  for (i = 236; i != 258; i += 2)
  {
    v25 = (_WORD *)(v5 + i);
    *(v25 - 20) = *v19;
    v26 = v19[1];
    v19 += 2;
    *v25 = v26;
  }
  *(_QWORD *)(v5 + 3896) = v19;
  result = (uint64_t)sub_100008D8C(v5, v2, v9, v23, v12 << 16, v14, v11, v20);
  if (result)
  {
    v27 = result;
    v28 = 0;
    *(_DWORD *)(result + 20) |= v15;
    v29 = v5 + 280;
    v30 = *(_QWORD *)(v5 + 3896);
    do
    {
      v31 = *(unsigned __int16 *)(v30 + v28);
      if (*(_WORD *)(v29 + v28))
        v32 = v31 == *(unsigned __int16 *)(v29 + v28);
      else
        v32 = 1;
      if (!v32)
      {
        *(_QWORD *)(v5 + 3896) = v30 + v28 + 2;
        v22 = "e: inconsistent DC index";
        goto LABEL_37;
      }
      *(_WORD *)(v29 + v28) = v31;
      v28 += 2;
    }
    while (v28 != 34);
    v33 = 0;
    *(_QWORD *)(v5 + 3896) = v30 + 34;
    *(_WORD *)(v5 + 354) = 17;
    v34 = 1;
    while (1)
    {
      v35 = *(unsigned __int16 **)(v5 + 3896);
      v36 = *v35;
      *(_QWORD *)(v5 + 3896) = v35 + 1;
      if ((v15 & 1) != 0)
      {
        *(_WORD *)(result + v33 + 40) = v36;
        if ((v15 & 2) != 0)
        {
LABEL_35:
          *(_WORD *)(result + v33 + 618) = v36;
          if ((v15 & 4) == 0)
            goto LABEL_32;
LABEL_31:
          *(_WORD *)(result + v33 + 1196) = v36;
          goto LABEL_32;
        }
      }
      else if ((v15 & 2) != 0)
      {
        goto LABEL_35;
      }
      if ((v15 & 4) != 0)
        goto LABEL_31;
LABEL_32:
      v34 &= v36 == 0;
      v33 += 2;
      if (v33 == 578)
      {
        if ((v34 & 1) != 0)
        {
          printf("e: DCLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
          return 0;
        }
        v37 = 0;
        v38 = v5 + 314;
        v39 = *(_QWORD *)(v5 + 3896);
        do
        {
          v40 = *(unsigned __int16 *)(v39 + v37);
          if (*(_WORD *)(v38 + v37))
            v41 = v40 == *(unsigned __int16 *)(v38 + v37);
          else
            v41 = 1;
          if (!v41)
          {
            *(_QWORD *)(v5 + 3896) = v39 + v37 + 2;
            v22 = "e: inconsistent PM index";
            goto LABEL_37;
          }
          *(_WORD *)(v38 + v37) = v40;
          v37 += 2;
        }
        while (v37 != 34);
        v42 = 0;
        *(_QWORD *)(v5 + 3896) = v39 + 34;
        *(_WORD *)(v5 + 356) = 17;
        v43 = 1;
        while (1)
        {
          v44 = *(unsigned __int16 **)(v5 + 3896);
          v45 = *v44;
          *(_QWORD *)(v5 + 3896) = v44 + 1;
          if ((v15 & 1) != 0)
          {
            *(_WORD *)(result + v42 + 1774) = v45;
            if ((v15 & 2) != 0)
            {
LABEL_55:
              *(_WORD *)(result + v42 + 1842) = v45;
              if ((v15 & 4) == 0)
                goto LABEL_52;
LABEL_51:
              *(_WORD *)(result + v42 + 1910) = v45;
              goto LABEL_52;
            }
          }
          else if ((v15 & 2) != 0)
          {
            goto LABEL_55;
          }
          if ((v15 & 4) != 0)
            goto LABEL_51;
LABEL_52:
          v43 &= v45 == 0;
          v42 += 2;
          if (v42 == 68)
          {
            if ((v43 & 1) != 0)
            {
              printf("e: PMLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
              return 0;
            }
            v46 = *(unsigned __int16 **)(v5 + 3896);
            v48 = *v46;
            v47 = v48;
            *(_QWORD *)(v5 + 3896) = v46 + 1;
            if ((v48 - 3) <= 0xFFFFFFFD)
            {
              printf("e: illegal frame count %d\n");
              return 0;
            }
            if (!*(_WORD *)(result + 1978) || v47 == *(unsigned __int16 *)(result + 1978))
            {
              *(_WORD *)(result + 1978) = v47;
              result = sub_100010390(v5, *(_DWORD *)(result + 8), (int *)(v5 + 36), (_WORD *)(v5 + 350));
              if ((_DWORD)result)
              {
                result = sub_100010390(v5, *(_DWORD *)(v27 + 16), (int *)(v5 + 116), (_WORD *)(v5 + 352));
                if ((_DWORD)result)
                {
                  result = sub_100010438(v5, *(unsigned __int16 *)(v27 + 12), (_WORD *)(v5 + 2148), (_WORD *)(v5 + 358));
                  if ((_DWORD)result)
                    return sub_1000104E8(v5, *(unsigned __int16 *)(v27 + 24), (_WORD *)(v5 + 276), (_WORD *)(v5 + 360));
                }
              }
              return result;
            }
            v22 = "e: inconsistent nframes value";
LABEL_37:
            puts(v22);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000FA60(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  _WORD *v6;
  int v7;
  unsigned __int16 v8;
  __int16 v9;
  float *v10;
  __int128 v11;
  uint64_t v12;
  char *v13;
  size_t v14;
  const char *v15;
  unsigned __int16 *v16;
  float v17;
  float v18;
  unsigned int v20;
  unsigned int v21;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  int v29;
  int *v30;
  int v31;
  uint64_t result;
  uint64_t v33;
  unsigned __int16 *v34;
  uint64_t v35;
  unsigned __int16 *v36;
  int v37;
  int v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  _WORD *v45;
  size_t v46;
  uint64_t v47;
  int v48;
  int v49;
  unsigned __int16 *v50;
  uint64_t v51;
  char v52;
  _WORD *v53;
  int v54;
  int v55;
  uint64_t v56;
  unsigned __int16 *v57;
  int v58;
  int v59;
  unint64_t v61;
  int v62;
  uint64_t v63;
  char v64;
  _WORD *v65;
  int v66;
  int v67;
  _OWORD v68[5];
  _OWORD __dst[5];

  v2 = *(unsigned __int16 *)(a2 + 6);
  v3 = *(_DWORD *)(a1 + 28);
  if (v3)
    v4 = v2 == v3;
  else
    v4 = 1;
  if (!v4)
  {
    printf("e: unexpected block version %d\n");
    return 0;
  }
  v5 = a1;
  *(_DWORD *)(a1 + 28) = 5;
  v6 = *(_WORD **)(a1 + 3896);
  *(_WORD *)(a1 + 412) = v6[2];
  *(_WORD *)(a1 + 2188) = v6[3];
  *(_WORD *)(a1 + 2190) = v6[4];
  v7 = (unsigned __int16)v6[5];
  *(_WORD *)(a1 + 2194) = v7;
  *(_WORD *)(a1 + 2192) = v6[6];
  v8 = v6[7] + 1;
  *(_WORD *)(a1 + 2198) = v8;
  v9 = v6[8];
  v10 = (float *)(v6 + 9);
  *(_QWORD *)(a1 + 3896) = v6 + 9;
  *(_WORD *)(a1 + 2196) = v9;
  if (v7 != 3)
  {
    v15 = "e: unsupported number of color channels";
    goto LABEL_85;
  }
  *(_QWORD *)&v11 = -1;
  *((_QWORD *)&v11 + 1) = -1;
  __dst[3] = v11;
  __dst[4] = v11;
  __dst[1] = v11;
  __dst[2] = v11;
  __dst[0] = v11;
  if (v8)
  {
    memcpy(__dst, v10, 4 * v8);
    v12 = 4 * (v8 - 1) + 4;
    v13 = (char *)v10 + v12;
    *(_QWORD *)(v5 + 3896) = v13;
    if (v8 <= 0x13u)
      v14 = 80 - 4 * v8;
    else
      v14 = 0;
    memset((char *)v68 + 4 * v8, 255, v14);
    a1 = (uint64_t)memcpy(v68, v13, 4 * v8);
    v10 = (float *)&v13[v12];
  }
  else
  {
    v68[3] = v11;
    v68[4] = v11;
    v68[1] = v11;
    v68[2] = v11;
    v68[0] = v11;
  }
  v17 = *v10;
  v16 = (unsigned __int16 *)(v10 + 1);
  v18 = v17;
  *(_QWORD *)(v5 + 3896) = v16;
  if (v17 < 0.0 || v18 > 1.0)
  {
    v15 = "e: bin mix factor must be between 0 and 1";
    goto LABEL_85;
  }
  if (!*(_BYTE *)(v5 + 2136))
  {
    a1 = sub_100008B08(v5, (uint64_t)__dst, (uint64_t)v68, v8, v18);
    v16 = *(unsigned __int16 **)(v5 + 3896);
  }
  v20 = *v16;
  *(_WORD *)(v5 + 418) = v20;
  v21 = v16[1];
  *(_QWORD *)(v5 + 3896) = v16 + 2;
  *(_WORD *)(v5 + 420) = v21;
  if (v20 > 0x18 || v21 >= 0x19)
  {
    v15 = "e: DC or PM LUT size too big";
    goto LABEL_85;
  }
  v23 = v16[2];
  v24 = v16[3];
  v25 = v16[4];
  v26 = v16[5];
  v27 = *((_DWORD *)v16 + 3);
  *(_QWORD *)(v5 + 3896) = v16 + 8;
  v28 = sub_100008D00(a1, v27);
  if (!v28)
  {
    v15 = "e: channel not specified";
    goto LABEL_85;
  }
  v29 = v28;
  v30 = *(int **)(v5 + 3896);
  v31 = *v30;
  *(_QWORD *)(v5 + 3896) = v30 + 1;
  result = (uint64_t)sub_100008D8C(v5, v2, v23, (v24 << 16) / 0xAu, v26 << 16, v28, v25, v31 == 538988366);
  if (!result)
    return result;
  v33 = result;
  *(_DWORD *)(result + 20) |= v29;
  if (*(_WORD *)(v5 + 418))
  {
    v34 = *(unsigned __int16 **)(v5 + 3896);
    v35 = 158;
    v36 = v34;
    do
    {
      v38 = *v36++;
      v37 = v38;
      if (*(_WORD *)(v5 + 2 * v35))
        v39 = v37 == *(unsigned __int16 *)(v5 + 2 * v35);
      else
        v39 = 1;
      if (!v39)
      {
        *(_QWORD *)(v5 + 3896) = v34 + 1;
        v15 = "e: inconsistent DC index";
        goto LABEL_85;
      }
      *(_WORD *)(v5 + 2 * v35) = v37;
      v40 = *(unsigned __int16 *)(v5 + 418);
      v41 = v35 - 157;
      ++v35;
      v34 = v36;
    }
    while (v41 < v40);
    *(_QWORD *)(v5 + 3896) = v36;
  }
  else
  {
    LODWORD(v40) = 0;
  }
  v42 = (v40 * v40);
  v43 = *(unsigned __int16 *)(v5 + 420);
  v44 = (v43 * v43);
  v45 = *(_WORD **)(result + 48);
  if (!v45)
  {
    v46 = ((6 * ((_DWORD)v44 + (_DWORD)v42)) & 0xFFFFC000) + ((((6 * ((_DWORD)v44 + (_DWORD)v42)) & 0x3FFE) != 0) << 14);
    *(_DWORD *)(v33 + 40) = v46;
    v47 = (v43 * v43);
    v48 = v43;
    v45 = malloc_type_aligned_alloc(0x4000uLL, v46, 0x6CC983A8uLL);
    v43 = v48;
    v44 = v47;
    *(_QWORD *)(v33 + 48) = v45;
    if (!v45)
    {
      v15 = "e: no memory for LUTs";
      goto LABEL_85;
    }
  }
  if (!(_DWORD)v40)
  {
LABEL_57:
    printf("e: DCLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
    return 0;
  }
  v49 = 2 * v42;
  v50 = *(unsigned __int16 **)(v5 + 3896);
  if (v42 <= 1)
    v51 = 1;
  else
    v51 = v42;
  v52 = 1;
  v53 = v45;
  do
  {
    v55 = *v50++;
    v54 = v55;
    if ((v29 & 1) != 0)
    {
      *v53 = v54;
      if ((v29 & 2) == 0)
      {
LABEL_49:
        if ((v29 & 4) == 0)
          goto LABEL_51;
LABEL_50:
        v45[v49] = v54;
        goto LABEL_51;
      }
    }
    else if ((v29 & 2) == 0)
    {
      goto LABEL_49;
    }
    v53[v42] = v54;
    if ((v29 & 4) != 0)
      goto LABEL_50;
LABEL_51:
    v52 &= v54 == 0;
    ++v49;
    ++v53;
    --v51;
  }
  while (v51);
  *(_QWORD *)(v5 + 3896) = v50;
  if ((v52 & 1) != 0)
    goto LABEL_57;
  if (*(_WORD *)(v5 + 420))
  {
    v56 = 182;
    v57 = v50;
    while (1)
    {
      v59 = *v57++;
      v58 = v59;
      if (*(_WORD *)(v5 + 2 * v56) && v58 != *(unsigned __int16 *)(v5 + 2 * v56))
        break;
      *(_WORD *)(v5 + 2 * v56) = v58;
      v61 = v56 - 181;
      ++v56;
      v50 = v57;
      if (v61 >= *(unsigned __int16 *)(v5 + 420))
      {
        *(_QWORD *)(v5 + 3896) = v57;
        goto LABEL_69;
      }
    }
    *(_QWORD *)(v5 + 3896) = v50 + 1;
    v15 = "e: inconsistent PM index";
LABEL_85:
    puts(v15);
    return 0;
  }
  v57 = v50;
LABEL_69:
  if (!v43)
    goto LABEL_84;
  v62 = 2 * v44;
  if (v44 <= 1)
    v63 = 1;
  else
    v63 = v44;
  v64 = 1;
  v65 = &v45[(3 * v42)];
  while (2)
  {
    v67 = *v57++;
    v66 = v67;
    if ((v29 & 1) == 0)
    {
      if ((v29 & 2) == 0)
        goto LABEL_76;
LABEL_81:
      v65[v44] = v66;
      if ((v29 & 4) == 0)
        goto LABEL_78;
LABEL_77:
      v45[(3 * v42) + v62] = v66;
      goto LABEL_78;
    }
    *v65 = v66;
    if ((v29 & 2) != 0)
      goto LABEL_81;
LABEL_76:
    if ((v29 & 4) != 0)
      goto LABEL_77;
LABEL_78:
    v64 &= v66 == 0;
    ++v62;
    ++v65;
    if (--v63)
      continue;
    break;
  }
  *(_QWORD *)(v5 + 3896) = v57;
  if ((v64 & 1) != 0)
  {
LABEL_84:
    printf("e: PMLUT[%d, %d, %d, %d, %d, %d] is all zeros\n");
    return 0;
  }
  result = sub_100010390(v5, *(_DWORD *)(v33 + 8), (int *)(v5 + 36), (_WORD *)(v5 + 414));
  if ((_DWORD)result)
  {
    result = sub_100010390(v5, *(_DWORD *)(v33 + 16), (int *)(v5 + 116), (_WORD *)(v5 + 416));
    if ((_DWORD)result)
    {
      result = sub_100010438(v5, *(unsigned __int16 *)(v33 + 12), (_WORD *)(v5 + 196), (_WORD *)(v5 + 422));
      if ((_DWORD)result)
        return sub_100010438(v5, *(unsigned __int16 *)(v33 + 24), (_WORD *)(v5 + 276), (_WORD *)(v5 + 426));
    }
  }
  return result;
}

uint64_t sub_10000FFC0(uint64_t a1, uint64_t a2)
{
  int v2;
  BOOL v3;
  unsigned __int16 *v5;
  int v6;
  unsigned __int16 *v7;
  int v8;
  int v9;
  uint64_t v10;
  unsigned __int16 *v11;
  _DWORD *v12;
  uint64_t v13;
  int v14;
  unsigned __int16 *v15;
  int v16;
  int v17;
  _DWORD *v18;
  int v19;
  int v20;
  uint64_t v21;
  unsigned __int16 *v22;
  char v24;
  char v25;
  uint64_t v26;
  _WORD *v27;
  int v28;

  v2 = *(_DWORD *)(a1 + 28);
  if (v2)
    v3 = *(unsigned __int16 *)(a2 + 6) == v2;
  else
    v3 = 1;
  if (!v3)
  {
    printf("e: unexpected block version %d\n");
    return 0;
  }
  *(_DWORD *)(a1 + 28) = 5;
  v5 = *(unsigned __int16 **)(a1 + 3896);
  v6 = *v5;
  *(_QWORD *)(a1 + 3896) = v5 + 1;
  printf("i: PDC params version %d\n", v6);
  v7 = *(unsigned __int16 **)(a1 + 3896);
  v8 = *v7;
  v9 = v7[1];
  v10 = v7[2];
  v11 = v7 + 3;
  *(_QWORD *)(a1 + 3896) = v11;
  *(_WORD *)(a1 + 424) = v10;
  if ((_DWORD)v10)
  {
    v12 = (_DWORD *)(a1 + 436);
    v13 = v10;
    do
    {
      v14 = *(_DWORD *)v11;
      v11 += 2;
      *v12++ = v14;
      --v13;
    }
    while (v13);
    *(_QWORD *)(a1 + 3896) = v11;
  }
  if (*(_DWORD *)(a1 + 436) != v8 || *(_DWORD *)(a1 + 4 * v10 + 432) != v9)
  {
    printf("e: provided min or max durations (%d, %d) invalid\n");
    return 0;
  }
  *(_WORD *)(a1 + 428) = *v11;
  *(_WORD *)(a1 + 430) = v11[1];
  *(_WORD *)(a1 + 2116) = v11[2];
  *(_WORD *)(a1 + 432) = v11[3];
  v15 = v11 + 5;
  *(_WORD *)(a1 + 434) = v11[4];
  if ((_DWORD)v10)
  {
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = (_DWORD *)(a1 + 516 + 4 * v17);
      v17 += v10;
      v19 = v10;
      do
      {
        v20 = *(_DWORD *)v15;
        v15 += 2;
        *v18++ = v20;
        --v19;
      }
      while (v19);
      ++v16;
    }
    while (v16 != (_DWORD)v10);
  }
  *(_WORD *)(a1 + 2118) = *v15;
  v21 = v15[1];
  v22 = v15 + 2;
  *(_QWORD *)(a1 + 3896) = v22;
  if (v21 < v10)
  {
    printf("e: frame repeat LUT incomplete, only %d/%d provided\n");
    return 0;
  }
  v24 = 1;
  do
  {
    v25 = v24;
    v26 = v21;
    v27 = (_WORD *)(a1 + 236);
    if ((_DWORD)v21)
    {
      do
      {
        if ((v25 & 1) == 0)
          *v27 = *v22;
        *(_QWORD *)(a1 + 3896) = ++v22;
        ++v27;
        --v26;
      }
      while (v26);
    }
    v24 = 0;
  }
  while ((v25 & 1) != 0);
  *(_DWORD *)(a1 + 2120) = *v22 << 16;
  v28 = v22[1];
  *(_QWORD *)(a1 + 3896) = v22 + 2;
  *(_DWORD *)(a1 + 2124) = v28 << 16;
  return 1;
}

uint64_t sub_100010190(uint64_t a1, int a2, int *a3, _WORD *a4)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  int *v7;
  int v8;
  int v9;
  BOOL v10;
  int v11;

  v4 = (unsigned __int16)*a4;
  if (v4 <= 0xA)
  {
    if (*a4)
    {
      v6 = (unsigned __int16)*a4;
      v7 = a3;
      v8 = a2;
      while (1)
      {
        v9 = *v7;
        if (*v7 == a2)
          return 1;
        v10 = v9 <= a2 && v8 == a2;
        v11 = a2;
        if (!v10)
        {
          *v7 = v8;
          v11 = v9;
        }
        ++v7;
        v8 = v11;
        if (!--v6)
        {
          if ((_DWORD)v4 == 10)
            goto LABEL_2;
          if (v11 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v11;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100010238(uint64_t a1, unsigned int a2, _WORD *a3, _WORD *a4)
{
  unsigned int v4;
  uint64_t result;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  v4 = (unsigned __int16)*a4;
  if (v4 <= 0xA)
  {
    if (*a4)
    {
      v6 = 0;
      v7 = a2;
      while (1)
      {
        v8 = (unsigned __int16)a3[v6];
        if (v8 == a2)
          return 1;
        v9 = v8 <= a2 && v7 == a2;
        v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          v10 = v8;
        }
        ++v6;
        v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 10)
            goto LABEL_2;
          if (v10 > (unsigned __int16)a3[(unsigned __int16)v4 - 1])
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_1000102E8(uint64_t a1, unsigned int a2, unsigned int *a3, _WORD *a4)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  unsigned int v11;

  v4 = (unsigned __int16)*a4;
  if (v4 <= 0xA)
  {
    if (*a4)
    {
      v6 = (unsigned __int16)*a4;
      v7 = a3;
      v8 = a2;
      while (1)
      {
        v9 = *v7;
        if (*v7 == a2)
          return 1;
        v10 = v9 <= a2 && v8 == a2;
        v11 = a2;
        if (!v10)
        {
          *v7 = v8;
          v11 = v9;
        }
        ++v7;
        v8 = v11;
        if (!--v6)
        {
          if ((_DWORD)v4 == 10)
            goto LABEL_2;
          if (v11 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v11;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100010390(uint64_t a1, int a2, int *a3, _WORD *a4)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  int *v7;
  int v8;
  int v9;
  BOOL v10;
  int v11;

  v4 = (unsigned __int16)*a4;
  if (v4 <= 0x14)
  {
    if (*a4)
    {
      v6 = (unsigned __int16)*a4;
      v7 = a3;
      v8 = a2;
      while (1)
      {
        v9 = *v7;
        if (*v7 == a2)
          return 1;
        v10 = v9 <= a2 && v8 == a2;
        v11 = a2;
        if (!v10)
        {
          *v7 = v8;
          v11 = v9;
        }
        ++v7;
        v8 = v11;
        if (!--v6)
        {
          if ((_DWORD)v4 == 20)
            goto LABEL_2;
          if (v11 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v11;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100010438(uint64_t a1, unsigned int a2, _WORD *a3, _WORD *a4)
{
  unsigned int v4;
  uint64_t result;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  v4 = (unsigned __int16)*a4;
  if (v4 <= 0x14)
  {
    if (*a4)
    {
      v6 = 0;
      v7 = a2;
      while (1)
      {
        v8 = (unsigned __int16)a3[v6];
        if (v8 == a2)
          return 1;
        v9 = v8 <= a2 && v7 == a2;
        v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          v10 = v8;
        }
        ++v6;
        v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 20)
            goto LABEL_2;
          if (v10 > (unsigned __int16)a3[(unsigned __int16)v4 - 1])
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_1000104E8(uint64_t a1, unsigned int a2, _WORD *a3, _WORD *a4)
{
  unsigned int v4;
  uint64_t result;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  v4 = (unsigned __int16)*a4;
  if (v4 <= 2)
  {
    if (*a4)
    {
      v6 = 0;
      v7 = a2;
      while (1)
      {
        v8 = (unsigned __int16)a3[v6];
        if (v8 == a2)
          return 1;
        v9 = v8 <= a2 && v7 == a2;
        v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          v10 = v8;
        }
        ++v6;
        v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 2)
            goto LABEL_2;
          if (v10 > (unsigned __int16)a3[(unsigned __int16)v4 - 1])
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100010598(uint64_t a1, unsigned int a2, _BYTE *a3, _WORD *a4)
{
  unsigned int v4;
  uint64_t result;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  v4 = (unsigned __int16)*a4;
  if (v4 <= 2)
  {
    if (*a4)
    {
      v6 = 0;
      v7 = a2;
      while (1)
      {
        v8 = a3[v6];
        if (v8 == a2)
          return 1;
        v9 = v8 <= a2 && v7 == a2;
        v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          LOWORD(v4) = *a4;
          v10 = v8;
        }
        ++v6;
        v7 = v10;
        if (v6 >= (unsigned __int16)v4)
        {
          if ((unsigned __int16)v4 == 2)
            goto LABEL_2;
          if (v10 > a3[(unsigned __int16)v4 - 1])
          {
            *a4 = v4 + 1;
            a3[(unsigned __int16)v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100010648(uint64_t a1, int *a2, uint64_t a3)
{
  unsigned int v3;
  int *v5;
  int v6;
  uint64_t i;
  int *v8;
  int v9;
  uint64_t j;
  int *v11;
  int v12;

  v3 = a2[1];
  if (v3 >= 0x40000)
  {
    printf("e: unexpected LLMT block version %d\n");
    return 0;
  }
  if (HIWORD(v3) == 3)
  {
    if (a2[2] != 52)
    {
      printf("e: unexpected PRCW block size %d\n");
      return 0;
    }
    v5 = *(int **)(a1 + 3896);
    v6 = *v5;
    *(_QWORD *)(a1 + 3896) = v5 + 1;
    if (v6)
    {
      for (i = 0; i != 96; i += 4)
      {
        v8 = *(int **)(a1 + 3896);
        v9 = *v8;
        *(_QWORD *)(a1 + 3896) = v8 + 1;
        *(_DWORD *)(a3 + 2916 + i) = v9;
      }
      for (j = 0; j != 96; j += 4)
      {
        v11 = *(int **)(a1 + 3896);
        v12 = *v11;
        *(_QWORD *)(a1 + 3896) = v11 + 1;
        *(_DWORD *)(a3 + 3012 + j) = v12;
      }
    }
  }
  else
  {
    sub_100009158(a1, a2, (_DWORD *)(a3 + 2784), 0x10u, 0, 0);
  }
  return 1;
}

BOOL sub_100010720(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  int v5;
  unsigned __int16 *v6;
  unsigned int v7;
  uint64_t v8;
  unsigned __int16 *v9;
  _DWORD *v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint16x4_t *v15;
  __int32 *v16;
  uint64_t v17;
  __int32 v18;
  uint16x4_t v19;
  unsigned int *v20;
  unsigned int *v21;
  uint64_t v22;
  unsigned int *v23;
  uint64_t i;
  __int16 *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t *v28;
  int v29;
  int v30;
  const char *v31;
  int v33;

  v3 = *(_DWORD *)(a2 + 8);
  v4 = (*(uint64_t (**)(const __CFString *, _QWORD))(a1 + 8))(CFSTR("PRCBinningDebugEnable"), *(_QWORD *)(a1 + 16));
  v5 = (*(uint64_t (**)(const __CFString *, _QWORD))(a1 + 8))(CFSTR("dcvrr-version-control"), *(_QWORD *)(a1 + 16));
  v6 = *(unsigned __int16 **)(a1 + 3896);
  v7 = v6[1];
  *(_QWORD *)(a1 + 3896) = v6 + 2;
  if (v7 >= 6)
  {
    printf("e: unexpected number of bins %d\n");
    return 0;
  }
  v8 = v6[2];
  v9 = v6 + 3;
  *(_QWORD *)(a1 + 3896) = v9;
  if (v8 >= 5)
  {
    printf("e: unexpected number of backlight sections %d\n");
    return 0;
  }
  if (v3 - 3 != (3 * v8 + 784) >> 1)
  {
    v31 = "e: PRC table not well formed";
LABEL_35:
    puts(v31);
    return 0;
  }
  if ((_DWORD)v8 != 1)
  {
    v10 = (_DWORD *)(a1 + 3968);
    v11 = (v8 - 1);
    do
    {
      v12 = *v9++;
      *v10++ = v12;
      --v11;
    }
    while (v11);
    if ((((_BYTE)v8 - 1) & 1) != 0)
      ++v9;
  }
  v13 = *v9;
  *(_QWORD *)(a1 + 3896) = v9 + 1;
  if (v5 != v13)
  {
    printf("e: Undefined EEPROM version 0x%x, expected 0x%x\n");
    return 0;
  }
  v14 = v9[1];
  v15 = (uint16x4_t *)(v9 + 2);
  if ((_DWORD)v8)
  {
    v16 = (__int32 *)(a1 + 4 * v14 + 3980);
    v17 = v8;
    do
    {
      v18 = v15->i32[0];
      v15 = (uint16x4_t *)((char *)v15 + 4);
      *v16 = v18;
      v16 += 5;
      --v17;
    }
    while (v17);
  }
  v19 = *v15;
  *(_QWORD *)(a1 + 3896) = (char *)v15 + 10;
  v20 = (unsigned int *)malloc_type_calloc(1uLL, 0x628uLL, 0x10200404B1403A4uLL);
  if (!v20)
  {
    v31 = "e: out of memory for PRC table";
    goto LABEL_35;
  }
  v21 = v20;
  v22 = 0;
  v20[6] = 2;
  *(uint32x4_t *)(v20 + 2) = vmovl_u16(v19);
  v23 = v20 + 7;
  do
  {
    for (i = 0; i != 514; i += 2)
    {
      v25 = *(__int16 **)(a1 + 3896);
      v26 = *v25;
      *(_QWORD *)(a1 + 3896) = v25 + 1;
      *(_WORD *)((char *)v23 + i) = v26;
    }
    *(_QWORD *)(a1 + 3896) += 2;
    ++v22;
    v23 = (unsigned int *)((char *)v23 + 514);
  }
  while (v22 != 3);
  v27 = a1 + 8 * v14;
  v28 = *(uint64_t **)(v27 + 3928);
  if (v28)
  {
    while (v20[2] != *((_DWORD *)v28 + 2)
         || v20[3] != *((_DWORD *)v28 + 3)
         || v20[4] != *((_DWORD *)v28 + 4)
         || v20[5] != *((_DWORD *)v28 + 5))
    {
      v28 = (uint64_t *)*v28;
      if (!v28)
        goto LABEL_26;
    }
    puts("e: duplicate PRC table found in input");
    goto LABEL_33;
  }
LABEL_26:
  if (!(_DWORD)v14)
  {
    *(_DWORD *)(a1 + 3912) = v7;
    *(_DWORD *)(a1 + 3916) = v8;
    sub_100010A78(a1, v20[2], (unsigned int *)(a1 + 2520), (unsigned int *)(a1 + 2616));
    sub_100010A78(a1, v21[3], (unsigned int *)(a1 + 2720), (unsigned int *)(a1 + 2816));
    sub_100010A78(a1, v21[4], (unsigned int *)(a1 + 2620), (unsigned int *)(a1 + 2716));
    v29 = *(_DWORD *)(a1 + 2512) | (1 << v21[5]);
    *(_DWORD *)(a1 + 2512) = v29;
    if (v29 == 3)
      v30 = 2;
    else
      v30 = 1;
    *(_DWORD *)(a1 + 2820) = v30;
  }
  if (v21[5] >= 2)
  {
    printf("e: unexpected value for polarity %d\n", v21[5]);
LABEL_33:
    free(v21);
    return 0;
  }
  *(_QWORD *)v21 = *(_QWORD *)(v27 + 3928);
  *(_QWORD *)(v27 + 3928) = v21;
  v33 = *(_DWORD *)(a1 + 3920) + 1;
  *(_DWORD *)(a1 + 3920) = v33;
  return v33 != *(_DWORD *)(a1 + 2616)
              * *(_DWORD *)(a1 + 3912)
              * *(_DWORD *)(a1 + 2716)
              * *(_DWORD *)(a1 + 2816)
              * *(_DWORD *)(a1 + 2820)
      || sub_100010B24(a1, v4 != 0);
}

uint64_t sub_100010A78(uint64_t a1, unsigned int a2, unsigned int *a3, unsigned int *a4)
{
  unsigned int v4;
  uint64_t result;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  v4 = *a4;
  if (*a4 <= 0x18)
  {
    if (v4)
    {
      v6 = 0;
      v7 = a2;
      while (1)
      {
        v8 = a3[v6];
        if (v8 == a2)
          return 1;
        v9 = v8 <= a2 && v7 == a2;
        v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          v4 = *a4;
          v10 = v8;
        }
        ++v6;
        v7 = v10;
        if (v6 >= v4)
        {
          if (v4 == 24)
            goto LABEL_2;
          if (v10 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

BOOL sub_100010B24(uint64_t a1, int a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;

  v4 = (*(uint64_t (**)(const __CFString *, _QWORD))(a1 + 8))(CFSTR("dcvrr-a"), *(_QWORD *)(a1 + 16));
  v5 = (*(uint64_t (**)(const __CFString *, _QWORD))(a1 + 8))(CFSTR("dcvrr-b"), *(_QWORD *)(a1 + 16));
  v6 = (*(uint64_t (**)(const __CFString *, _QWORD))(a1 + 8))(CFSTR("dcvrr-c"), *(_QWORD *)(a1 + 16));
  v7 = (*(uint64_t (**)(const __CFString *, _QWORD))(a1 + 8))(CFSTR("dcvrr-d"), *(_QWORD *)(a1 + 16));
  v8 = v7;
  if (a2)
    printf("%s dcvrr_a 0x%x dcvrr_b 0x%x dcvrr_c 0x%x dcvrr_d 0x%x\n", "prc_binning_impl", v4, v5, v6, v7);
  if (!*(_DWORD *)(a1 + 2716))
    return *(_QWORD *)(a1 + 2824) != 0;
  v9 = 0;
  while (1)
  {
    v10 = *(unsigned int *)(a1 + 2620 + 4 * v9);
    v11 = *(unsigned int *)(a1 + 3916);
    if ((_DWORD)v11)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_DWORD *)(a1 + 3968 + 4 * i) > v10)
          goto LABEL_10;
      }
      LODWORD(i) = *(_DWORD *)(a1 + 3916);
LABEL_10:
      v13 = v4;
      switch((int)i)
      {
        case 0:
          goto LABEL_15;
        case 1:
          v13 = v6;
          goto LABEL_15;
        case 2:
          v13 = v5;
          goto LABEL_15;
        case 3:
          v13 = v8;
          goto LABEL_15;
        default:
          printf("e: unknown backlight section %d\n", i);
          return 0;
      }
    }
    LODWORD(i) = 0;
    v13 = v4;
LABEL_15:
    if ((sub_100010CAC((_DWORD *)a1, a2, v13, v10, i) & 1) == 0)
      return 0;
    if (++v9 >= (unint64_t)*(unsigned int *)(a1 + 2716))
      return *(_QWORD *)(a1 + 2824) != 0;
  }
}

uint64_t sub_100010CAC(_DWORD *a1, int a2, int a3, uint64_t a4, unsigned int a5)
{
  uint64_t v5;
  _DWORD *v10;
  _DWORD *v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  unsigned int *v15;
  unsigned int *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  float v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  _DWORD *v26;
  _DWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  unsigned int v37;
  double v38;
  _DWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *__p[3];
  void *v48;
  void *v49;
  uint64_t v50;

  v10 = a1;
  v11 = &a1[5 * a5 + 995];
  v12 = a1[978];
  v49 = 0;
  v50 = 0;
  v48 = 0;
  sub_100019304(&v48, v11, (uint64_t)&v11[v12], v12);
  memset(__p, 170, sizeof(__p));
  sub_10001117C((uint64_t *)&v48, (char **)__p);
  v13 = v10[978];
  if (v13)
  {
    v14 = 0;
    v5 = (uint64_t)"%s thresholds[sec:%d][bin:%d] 0x%x\n";
    do
    {
      if (a2)
      {
        if (v14 >= ((char *)__p[1] - (char *)__p[0]) >> 2)
          goto LABEL_62;
        printf("%s thresholds[sec:%d][bin:%d] 0x%x\n", "interpolate_prc_bins", a5, *((_DWORD *)__p[0] + v14), v11[*((unsigned int *)__p[0] + v14)]);
        v13 = v10[978];
      }
      ++v14;
    }
    while (v14 < v13);
    v15 = (unsigned int *)__p[0];
    v16 = (unsigned int *)__p[1];
    if (v13)
    {
      v17 = 0;
      v18 = ((char *)__p[1] - (char *)__p[0]) >> 2;
      while (v18 != v17)
      {
        if (v11[*((unsigned int *)__p[0] + v17)] >= a3)
        {
          if ((_DWORD)v17)
            goto LABEL_17;
          goto LABEL_15;
        }
        if (v13 == ++v17)
        {
          v17 = v13 - 1;
          if (v18 <= v17)
            goto LABEL_62;
          a3 = v11[*((unsigned int *)__p[0] + v17)];
          goto LABEL_17;
        }
      }
      goto LABEL_62;
    }
  }
  else
  {
    v15 = (unsigned int *)__p[0];
    v16 = (unsigned int *)__p[1];
  }
LABEL_15:
  if (v16 == v15)
    goto LABEL_62;
  a3 = v11[*v15];
  v18 = v16 - v15;
  LODWORD(v17) = 1;
LABEL_17:
  if (v18 <= v17 || (v19 = v17, v20 = (v17 - 1), v18 <= v20))
  {
LABEL_62:
    __break(1u);
LABEL_63:
    puts("e: out of memory for PRC table");
    goto LABEL_55;
  }
  v45 = v15[v20];
  v46 = v15[v19];
  v21 = v11[v46];
  v22 = 1.0;
  v23 = v21 - v11[v45];
  if (v23)
    v22 = (float)(v21 - a3) / (float)v23;
  if (a2)
  {
    puts("======================================");
    printf("%s For backlight %d: \n         section %d metric 0x%x falls between \n         {thresholds[sec:%d][bin:%d]:0x%x , thresholds[sec:%d][bin:%d]:0x%x} \n         weight = %f\n", "interpolate_prc_bins", a4, a5, a3, a5, v45, v10[5 * a5 + 995 + v45], a5, v46, v10[5 * a5 + 995 + v46], v22);
    puts("======================================\n");
  }
  v24 = v10[704];
  if ((_DWORD)v24)
  {
    v25 = 0;
    v26 = v10 + 630;
    v27 = v10 + 680;
    v28 = &v10[2 * v45 + 982];
    v29 = &v10[2 * v46 + 982];
    LODWORD(v30) = v10[654];
    while (!(_DWORD)v30)
    {
LABEL_51:
      ++v25;
      v5 = 1;
      if (v25 >= v24)
        goto LABEL_55;
    }
    v43 = v28;
    v44 = 0;
    v42 = v29;
    while (1)
    {
      v31 = (uint64_t *)*v28;
      if (*v28)
      {
        do
        {
          if (*((_DWORD *)v31 + 2) == v26[v44]
            && *((_DWORD *)v31 + 3) == v27[v25]
            && *((_DWORD *)v31 + 4) == (_DWORD)a4)
          {
            break;
          }
          v31 = (uint64_t *)*v31;
        }
        while (v31);
      }
      v32 = (uint64_t *)*v29;
      if (!*v29)
        break;
      while (*((_DWORD *)v32 + 2) != v26[v44] || *((_DWORD *)v32 + 3) != v27[v25] || *((_DWORD *)v32 + 4) != (_DWORD)a4)
      {
        v32 = (uint64_t *)*v32;
        if (!v32)
          goto LABEL_53;
      }
      if (!v31)
        break;
      v33 = (char *)malloc_type_calloc(1uLL, 0x628uLL, 0x10200404B1403A4uLL);
      v5 = (uint64_t)v33;
      if (!v33)
        goto LABEL_63;
      v40 = v10;
      v41 = a4;
      v34 = 0;
      *((_DWORD *)v33 + 6) = 2;
      *(_OWORD *)(v33 + 8) = *(_OWORD *)(v31 + 1);
      v35 = (uint64_t)v31 + 28;
      do
      {
        if (a2)
          printf("%s Interpolated LUT[temp:%d][subframe:%d][backlight:%d][channel:%d]: ", "interpolate_prc_bins", *(_DWORD *)(v5 + 8), *(_DWORD *)(v5 + 12), *(_DWORD *)(v5 + 16), v34);
        for (i = 0; i != 257; ++i)
        {
          while (1)
          {
            v37 = *((unsigned __int16 *)v32 + 257 * v34 + i + 14);
            v38 = (float)((float)v37 + (float)(v22 * (float)(int)(*(unsigned __int16 *)(v35 + 514 * v34 + 2 * i) - v37)))
                + 0.5;
            *(_WORD *)(v5 + 28 + 514 * v34 + 2 * i) = (int)v38;
            if (a2)
              break;
            if (++i == 257)
              goto LABEL_48;
          }
          printf("%d ", (int)v38);
        }
        puts("\n ");
LABEL_48:
        ++v34;
      }
      while (v34 != 3);
      v10 = v40;
      a4 = v41;
      *(_QWORD *)v5 = *((_QWORD *)v40 + 353);
      *((_QWORD *)v40 + 353) = v5;
      v28 = v43;
      v30 = v40[654];
      ++v44;
      v29 = v42;
      if (v44 >= v30)
      {
        v24 = v40[704];
        goto LABEL_51;
      }
    }
LABEL_53:
    printf("e: Could not find PRC tables [%d:%d:%d] for bins [%d:%d]\n", v26[v44], v27[v25], a4, v45, v46);
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
LABEL_55:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v48)
  {
    v49 = v48;
    operator delete(v48);
  }
  return v5;
}

void sub_100011148(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  uint64_t v29;
  void *v31;

  if (__p)
    operator delete(__p);
  v31 = *(void **)(v29 - 128);
  if (v31)
  {
    *(_QWORD *)(v29 - 120) = v31;
    operator delete(v31);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001117C(uint64_t *a1@<X0>, char **a2@<X8>)
{
  _QWORD *v4;
  unsigned int *v5;
  unint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  unsigned int *v14;
  int v15;
  unsigned int *v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;

  a2[2] = 0;
  v4 = a2 + 2;
  *a2 = 0;
  a2[1] = 0;
  if (a1[1] == *a1)
  {
    v5 = 0;
    v16 = 0;
  }
  else
  {
    v5 = 0;
    LODWORD(v6) = 0;
    do
    {
      if ((unint64_t)v5 >= *v4)
      {
        v7 = (unsigned int *)*a2;
        v8 = ((char *)v5 - *a2) >> 2;
        v9 = v8 + 1;
        if ((unint64_t)(v8 + 1) >> 62)
          sub_100008578();
        v10 = *v4 - (_QWORD)v7;
        if (v10 >> 1 > v9)
          v9 = v10 >> 1;
        if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL)
          v11 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
        {
          v12 = (char *)sub_1000193BC((uint64_t)v4, v11);
          v7 = (unsigned int *)*a2;
          v5 = (unsigned int *)a2[1];
        }
        else
        {
          v12 = 0;
        }
        v13 = &v12[4 * v8];
        *(_DWORD *)v13 = v6;
        v14 = (unsigned int *)(v13 + 4);
        while (v5 != v7)
        {
          v15 = *--v5;
          *((_DWORD *)v13 - 1) = v15;
          v13 -= 4;
        }
        *a2 = v13;
        a2[1] = (char *)v14;
        a2[2] = &v12[4 * v11];
        if (v7)
          operator delete(v7);
        v5 = v14;
      }
      else
      {
        *v5++ = v6;
      }
      a2[1] = (char *)v5;
      v6 = (v6 + 1);
    }
    while (v6 < (a1[1] - *a1) >> 2);
    v16 = (unsigned int *)*a2;
  }
  v20 = a1;
  if ((char *)v5 - (char *)v16 < 513)
  {
    v17 = 0;
    v19 = 0;
  }
  else
  {
    v17 = (unsigned int *)sub_1000193F0(v5 - v16);
    v19 = v18;
  }
  sub_100019450(v16, v5, &v20, v5 - v16, v17, v19);
  if (v17)
    operator delete(v17);
}

void sub_100011304(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v2;
  void *v4;

  if (v2)
    operator delete(v2);
  v4 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100011338(uint64_t a1, uint64_t a2)
{
  _DWORD *v3;
  unsigned __int8 *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;

  if (*(_DWORD *)(a2 + 4) == 0x10000)
  {
    v3 = *(_DWORD **)(a1 + 2840);
    if (*v3 == 1)
    {
      if ((4 * *(_DWORD *)(a2 + 8) - 12) > 0x14)
      {
        v5 = *(unsigned __int8 **)(a1 + 3896);
        *(_QWORD *)(a1 + 3896) = v5 + 4;
        *(_QWORD *)(a1 + 3896) = v5 + 5;
        v6 = v5[5];
        *(_QWORD *)(a1 + 3896) = v5 + 6;
        if (v6 < 5)
        {
          v7 = v5[6];
          *(_QWORD *)(a1 + 3896) = v5 + 7;
          if (v7 < 7)
          {
            v8 = v3 + 581884;
            v9 = v5[7];
            *(_QWORD *)(a1 + 3896) = v5 + 8;
            v10 = v5[8];
            *(_QWORD *)(a1 + 3896) = v5 + 9;
            v11 = v5[9];
            *(_QWORD *)(a1 + 3896) = v5 + 10;
            v12 = v5[10];
            *(_QWORD *)(a1 + 3896) = v5 + 11;
            v13 = v5[11];
            *(_QWORD *)(a1 + 3896) = v5 + 12;
            v14 = v5[12];
            *(_QWORD *)(a1 + 3896) = v5 + 13;
            v15 = v5[13];
            *(_QWORD *)(a1 + 3896) = v5 + 14;
            v16 = v5[14];
            *(_QWORD *)(a1 + 3896) = v5 + 15;
            v17 = v5[15];
            *(_QWORD *)(a1 + 3896) = v5 + 16;
            v18 = v5[16];
            *(_QWORD *)(a1 + 3896) = v5 + 17;
            v19 = v5[17];
            *(_QWORD *)(a1 + 3896) = v5 + 21;
            *v8 = v6;
            v8[1] = v7;
            v8[2] = v9;
            *(_QWORD *)(v8 + 3) = 0;
            v8[5] = v13;
            v8[6] = v18;
            v8[7] = v19;
            *((_QWORD *)v8 + 4) = 0;
            *((_BYTE *)v8 + 48) = (v14 | v16) != 0;
            *((_BYTE *)v8 + 49) = v14 != 0;
            *((_BYTE *)v8 + 50) = v15 != 0;
            *((_BYTE *)v8 + 51) = v16 != 0;
            *((_BYTE *)v8 + 52) = v17 != 0;
            *((_BYTE *)v8 + 53) = v10 != 0;
            *((_BYTE *)v8 + 54) = v11 != 0;
            *((_BYTE *)v8 + 55) = v12 != 0;
            operator new();
          }
          printf("e: unsupported sensor channel count: %u > %u\n");
        }
        else
        {
          printf("e: unsupported region count: %u > %u\n");
        }
      }
      else
      {
        puts("e: cannot read data in CNST");
      }
    }
    else
    {
      printf("e: mismatching versions: %u != %u\n");
    }
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_1000115F0(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char v20;
  char *v21;
  char v22;
  char *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char v34;
  char *v35;
  char v36;
  char *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int16 *v43;
  int v44;
  unsigned __int16 *v45;
  int v46;
  unsigned __int16 *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int16 *v52;
  int v53;
  unsigned __int16 *v54;
  int v55;
  unsigned __int16 *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unsigned __int16 *v61;
  int v62;
  unsigned __int16 *v63;
  int v64;
  unsigned __int16 *v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned __int16 *v70;
  int v71;
  unsigned __int16 *v72;
  int v73;
  unsigned __int16 *v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unsigned __int8 *v80;
  int v81;
  unsigned __int8 *v82;
  int v83;
  unsigned __int8 *v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unsigned __int8 *v89;
  int v90;
  unsigned __int8 *v91;
  int v92;
  unsigned __int8 *v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  BOOL v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;

  if (*(_DWORD *)(a2 + 4) != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  v2 = *(_DWORD *)(a1 + 2832);
  switch(v2)
  {
    case 1:
      v3 = (unsigned int *)(*(_QWORD *)(a1 + 2840) + 2327536);
      break;
    case 6:
      v3 = (unsigned int *)(*(_QWORD *)(a1 + 2840) + 1876064);
      break;
    case 3:
      v3 = (unsigned int *)(*(_QWORD *)(a1 + 2840) + 1918576);
      break;
    case 2:
      v3 = (unsigned int *)(*(_QWORD *)(a1 + 2840) + 12416);
      break;
    default:
      printf("e: mismatching versions: %u != 1,2,3,6\n");
      return 0;
  }
  v4 = 4 * *(_DWORD *)(a2 + 8);
  v5 = (v4 - 12);
  if (v4 == 12)
  {
    v8 = "e: cannot read NR and NC";
    goto LABEL_103;
  }
  v6 = *v3;
  v7 = v3[1];
  if (v5 < 2 * (int)v6 * (int)v7)
  {
    v8 = "e: underflow while reading num_svds and shift_bits";
LABEL_103:
    puts(v8);
    return 0;
  }
  v9 = *(_QWORD *)(a1 + 3896);
  v10 = v9 + v5;
  if ((_DWORD)v6)
  {
    v11 = 0;
    v12 = 33;
    v13 = 33;
    v14 = 33;
    do
    {
      v15 = v7;
      v16 = v12;
      v17 = v13;
      v18 = v14;
      if ((_DWORD)v7)
      {
        do
        {
          switch(v2)
          {
            case 1:
              goto LABEL_19;
            case 6:
              v23 = *(char **)(a1 + 3896);
              v24 = *v23;
              *(_QWORD *)(a1 + 3896) = v23 + 1;
              *(_BYTE *)(*(_QWORD *)(a1 + 2840) + v18) = v24;
              break;
            case 3:
LABEL_19:
              v19 = *(char **)(a1 + 3896);
              v20 = *v19;
              *(_QWORD *)(a1 + 3896) = v19 + 1;
              *(_BYTE *)(*(_QWORD *)(a1 + 2840) + v17) = v20;
              break;
            default:
              v21 = *(char **)(a1 + 3896);
              v22 = *v21;
              *(_QWORD *)(a1 + 3896) = v21 + 1;
              *(_BYTE *)(*(_QWORD *)(a1 + 2840) + v16) = v22;
              break;
          }
          v18 += 4;
          v17 += 4;
          v16 += 4;
          --v15;
        }
        while (v15);
      }
      ++v11;
      v14 += 52;
      v13 += 48;
      v12 += 28;
    }
    while (v11 != v6);
    v25 = 0;
    v26 = 32;
    v27 = 32;
    v28 = 32;
    while (1)
    {
      v29 = v7;
      v30 = v26;
      v31 = v27;
      v32 = v28;
      if ((_DWORD)v7)
        break;
LABEL_37:
      ++v25;
      v28 += 52;
      v27 += 48;
      v26 += 28;
      if (v25 == v6)
        goto LABEL_38;
    }
    while (1)
    {
      switch(v2)
      {
        case 1:
          goto LABEL_30;
        case 6:
          v37 = *(char **)(a1 + 3896);
          v38 = *v37;
          *(_QWORD *)(a1 + 3896) = v37 + 1;
          *(_BYTE *)(*(_QWORD *)(a1 + 2840) + v32) = v38;
          break;
        case 3:
LABEL_30:
          v33 = *(char **)(a1 + 3896);
          v34 = *v33;
          *(_QWORD *)(a1 + 3896) = v33 + 1;
          *(_BYTE *)(*(_QWORD *)(a1 + 2840) + v31) = v34;
          break;
        default:
          v35 = *(char **)(a1 + 3896);
          v36 = *v35;
          *(_QWORD *)(a1 + 3896) = v35 + 1;
          *(_BYTE *)(*(_QWORD *)(a1 + 2840) + v30) = v36;
          break;
      }
      v32 += 4;
      v31 += 4;
      v30 += 4;
      if (!--v29)
        goto LABEL_37;
    }
  }
LABEL_38:
  if (v10 - *(_QWORD *)(a1 + 3896) < (8 * v6))
  {
    v8 = "e: underflow while reading regions";
    goto LABEL_103;
  }
  if ((_DWORD)v6)
  {
    v39 = 0;
    v40 = 28 * v6;
    v41 = 8;
    v42 = 8;
    while (1)
    {
      switch(v2)
      {
        case 1:
          goto LABEL_43;
        case 6:
          v47 = *(unsigned __int16 **)(a1 + 3896);
          v48 = *v47;
          *(_QWORD *)(a1 + 3896) = v47 + 1;
          *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v42) = v48;
          break;
        case 3:
LABEL_43:
          v43 = *(unsigned __int16 **)(a1 + 3896);
          v44 = *v43;
          *(_QWORD *)(a1 + 3896) = v43 + 1;
          *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v41) = v44;
          break;
        default:
          v45 = *(unsigned __int16 **)(a1 + 3896);
          v46 = *v45;
          *(_QWORD *)(a1 + 3896) = v45 + 1;
          *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v39 + 8) = v46;
          break;
      }
      v42 += 52;
      v41 += 48;
      v39 += 28;
      if (v40 == v39)
      {
        v49 = 0;
        v50 = 12;
        v51 = 12;
        while (1)
        {
          switch(v2)
          {
            case 1:
              goto LABEL_52;
            case 6:
              v56 = *(unsigned __int16 **)(a1 + 3896);
              v57 = *v56;
              *(_QWORD *)(a1 + 3896) = v56 + 1;
              *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v51) = v57;
              break;
            case 3:
LABEL_52:
              v52 = *(unsigned __int16 **)(a1 + 3896);
              v53 = *v52;
              *(_QWORD *)(a1 + 3896) = v52 + 1;
              *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v50) = v53;
              break;
            default:
              v54 = *(unsigned __int16 **)(a1 + 3896);
              v55 = *v54;
              *(_QWORD *)(a1 + 3896) = v54 + 1;
              *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v49 + 12) = v55;
              break;
          }
          v51 += 52;
          v50 += 48;
          v49 += 28;
          if (v40 == v49)
          {
            v58 = 0;
            v59 = 16;
            v60 = 16;
            while (1)
            {
              switch(v2)
              {
                case 1:
                  goto LABEL_60;
                case 6:
                  v65 = *(unsigned __int16 **)(a1 + 3896);
                  v66 = *v65;
                  *(_QWORD *)(a1 + 3896) = v65 + 1;
                  *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v60) = v66;
                  break;
                case 3:
LABEL_60:
                  v61 = *(unsigned __int16 **)(a1 + 3896);
                  v62 = *v61;
                  *(_QWORD *)(a1 + 3896) = v61 + 1;
                  *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v59) = v62;
                  break;
                default:
                  v63 = *(unsigned __int16 **)(a1 + 3896);
                  v64 = *v63;
                  *(_QWORD *)(a1 + 3896) = v63 + 1;
                  *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v58 + 16) = v64;
                  break;
              }
              v60 += 52;
              v59 += 48;
              v58 += 28;
              if (v40 == v58)
              {
                v67 = 0;
                v68 = 20;
                v69 = 20;
                while (1)
                {
                  switch(v2)
                  {
                    case 1:
                      goto LABEL_68;
                    case 6:
                      v74 = *(unsigned __int16 **)(a1 + 3896);
                      v75 = *v74;
                      *(_QWORD *)(a1 + 3896) = v74 + 1;
                      *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v69) = v75;
                      break;
                    case 3:
LABEL_68:
                      v70 = *(unsigned __int16 **)(a1 + 3896);
                      v71 = *v70;
                      *(_QWORD *)(a1 + 3896) = v70 + 1;
                      *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v68) = v71;
                      break;
                    default:
                      v72 = *(unsigned __int16 **)(a1 + 3896);
                      v73 = *v72;
                      *(_QWORD *)(a1 + 3896) = v72 + 1;
                      *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v67 + 20) = v73;
                      break;
                  }
                  v69 += 52;
                  v68 += 48;
                  v67 += 28;
                  if (v40 == v67)
                    goto LABEL_75;
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_75:
  if (v10 - *(_QWORD *)(a1 + 3896) < (2 * v6))
  {
    v8 = "e: underflow while reading interp_factor";
    goto LABEL_103;
  }
  if ((_DWORD)v6)
  {
    v76 = 0;
    v77 = 28 * v6;
    v78 = 24;
    v79 = 24;
    while (1)
    {
      switch(v2)
      {
        case 1:
          goto LABEL_83;
        case 6:
          v84 = *(unsigned __int8 **)(a1 + 3896);
          v85 = *v84;
          *(_QWORD *)(a1 + 3896) = v84 + 1;
          *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v79) = v85;
          break;
        case 3:
LABEL_83:
          v82 = *(unsigned __int8 **)(a1 + 3896);
          v83 = *v82;
          *(_QWORD *)(a1 + 3896) = v82 + 1;
          *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v78) = v83;
          break;
        default:
          v80 = *(unsigned __int8 **)(a1 + 3896);
          v81 = *v80;
          *(_QWORD *)(a1 + 3896) = v80 + 1;
          *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v76 + 24) = v81;
          break;
      }
      v79 += 52;
      v78 += 48;
      v76 += 28;
      if (v77 == v76)
      {
        v86 = 0;
        v87 = 28;
        v88 = 28;
        while (1)
        {
          switch(v2)
          {
            case 1:
              goto LABEL_91;
            case 6:
              v93 = *(unsigned __int8 **)(a1 + 3896);
              v94 = *v93;
              *(_QWORD *)(a1 + 3896) = v93 + 1;
              *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v88) = v94;
              break;
            case 3:
LABEL_91:
              v91 = *(unsigned __int8 **)(a1 + 3896);
              v92 = *v91;
              *(_QWORD *)(a1 + 3896) = v91 + 1;
              *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v87) = v92;
              break;
            default:
              v89 = *(unsigned __int8 **)(a1 + 3896);
              v90 = *v89;
              *(_QWORD *)(a1 + 3896) = v89 + 1;
              *(_DWORD *)(*(_QWORD *)(a1 + 2840) + v86 + 28) = v90;
              break;
          }
          v88 += 52;
          v87 += 48;
          v86 += 28;
          if (v77 == v86)
            goto LABEL_95;
        }
      }
    }
  }
LABEL_95:
  v95 = *(_QWORD *)(a1 + 3896) + 2;
  v96 = v95 - v9;
  v97 = v96 & 3;
  v99 = -v96;
  v98 = v99 < 0;
  v100 = v99 & 3;
  if (v98)
    v101 = v97;
  else
    v101 = -v100;
  if ((_DWORD)v101)
    v102 = 4 - v101;
  else
    v102 = 0;
  v103 = v95 + v102;
  *(_QWORD *)(a1 + 3896) = v103;
  if (v103 != v10)
  {
    v8 = "e: parsing did not consume the full RCFG size";
    goto LABEL_103;
  }
  return 1;
}

uint64_t sub_100011C44(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  unsigned int *v5;
  int v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int16 *v13;
  __int16 v14;
  unsigned __int8 *v15;
  const char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  __int16 v24;
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
  uint64_t v38;
  uint64_t v39;
  __int16 *v40;
  __int16 v41;
  __int16 *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int16 *v55;
  __int16 v56;
  uint64_t v57;
  __int16 *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int16 *v75;
  __int16 v76;
  __int16 *v77;
  __int16 v78;
  __int16 v79;
  uint64_t i;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __int16 *v90;
  __int16 v91;
  uint64_t v92;
  __int16 *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  BOOL v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;

  if (*(_DWORD *)(a2 + 4) != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  v3 = *(_DWORD *)(a1 + 2832);
  switch(v3)
  {
    case 1:
      v4 = *(_QWORD *)(a1 + 2840);
      v5 = (unsigned int *)(v4 + 2327536);
      break;
    case 6:
      v4 = *(_QWORD *)(a1 + 2840);
      v5 = (unsigned int *)(v4 + 1876064);
      break;
    case 3:
      v4 = *(_QWORD *)(a1 + 2840);
      v5 = (unsigned int *)(v4 + 1918576);
      break;
    default:
      printf("e: mismatching versions: %u != 1,3,6\n");
      return 0;
  }
  v6 = 4 * *(_DWORD *)(a2 + 8);
  v7 = (v6 - 12);
  if (v6 == 12)
  {
    v16 = "e: underflow while temperature / brightness";
    goto LABEL_15;
  }
  v8 = *(char **)(a1 + 3896);
  v9 = &v8[v7];
  v10 = *v5;
  v11 = v5[2];
  if (v3 == 6)
  {
    *(_BYTE *)(v4 + 184538) = *v8;
    v24 = *(_WORD *)(v8 + 1);
    *(_QWORD *)(a1 + 3896) = v8 + 3;
    *(_WORD *)(*(_QWORD *)(a1 + 2840) + 184536) = v24;
  }
  else
  {
    v12 = *v8;
    *(_QWORD *)(a1 + 3896) = v8 + 1;
    *(_BYTE *)(v4 + 319690) = v12;
    v13 = *(__int16 **)(a1 + 3896);
    v14 = *v13;
    *(_QWORD *)(a1 + 3896) = v13 + 1;
    *(_WORD *)(*(_QWORD *)(a1 + 2840) + 319688) = v14;
  }
  v15 = *(unsigned __int8 **)(a1 + 3896);
  if (v9 - (char *)v15 <= 5)
  {
    v16 = "e: underflow while reading sizes";
LABEL_15:
    puts(v16);
    return 0;
  }
  v18 = *v15;
  *(_QWORD *)(a1 + 3896) = v15 + 1;
  v19 = v15[1];
  *(_QWORD *)(a1 + 3896) = v15 + 2;
  v20 = v15[2];
  *(_QWORD *)(a1 + 3896) = v15 + 3;
  v21 = v15[3];
  v22 = *((unsigned __int16 *)v15 + 2);
  v23 = v15 + 6;
  *(_QWORD *)(a1 + 3896) = v23;
  if (v3 == 6 && v18 >= 6 || v3 != 6 && v18 >= 5)
  {
    printf("e: unsupported NAC: %u > %u\n");
    return 0;
  }
  if (v19 >= 5)
  {
    printf("e: unsupported NASVD: %u > %u\n");
    return 0;
  }
  if (v20 >= 3)
  {
    printf("e: unsupported NBC: %u > %u\n");
    return 0;
  }
  if (v21 >= 6)
  {
    printf("e: unsupported NBSVD: %u > %u\n");
    return 0;
  }
  if (v3 == 6 && v22 >= 0x81 || v3 != 6 && v22 >= 0x101)
  {
    printf("e: unsupported NHS: %u > %u\n");
    return 0;
  }
  if (v9 - (char *)v23 < (4 * v10 * v11 * v18 * v19 * v22))
  {
    v16 = "e: underflow while reading WgTypeA";
    goto LABEL_15;
  }
  if ((_DWORD)v10)
  {
    v25 = 0;
    v26 = 216;
    v27 = 200;
    do
    {
      if ((_DWORD)v18)
      {
        v28 = 0;
        v29 = v27;
        v30 = v26;
        do
        {
          if ((_DWORD)v19)
          {
            v31 = 0;
            v32 = v29;
            v33 = v30;
            do
            {
              if ((_DWORD)v11)
              {
                v34 = 0;
                v35 = v32;
                v36 = v33;
                do
                {
                  v37 = v22;
                  v38 = v35;
                  v39 = v36;
                  if ((_DWORD)v22)
                  {
                    do
                    {
                      if (v3 == 1 || v3 == 3)
                      {
                        v40 = *(__int16 **)(a1 + 3896);
                        v41 = *v40;
                        *(_QWORD *)(a1 + 3896) = v40 + 1;
                        *(_WORD *)(*(_QWORD *)(a1 + 2840) + v38) = v41;
                      }
                      else
                      {
                        v42 = *(__int16 **)(a1 + 3896);
                        v43 = *v42;
                        *(_QWORD *)(a1 + 3896) = v42 + 1;
                        *(_WORD *)(*(_QWORD *)(a1 + 2840) + v39) = v43;
                      }
                      v39 += 4;
                      v38 += 4;
                      --v37;
                    }
                    while (v37);
                  }
                  ++v34;
                  v36 += 512;
                  v35 += 1024;
                }
                while (v34 != v11);
              }
              ++v31;
              v33 += 1536;
              v32 += 3072;
            }
            while (v31 != v19);
          }
          ++v28;
          v30 += 6144;
          v29 += 12288;
        }
        while (v28 != v18);
      }
      ++v25;
      v26 += 30720;
      v27 += 49152;
    }
    while (v25 != v10);
    v44 = 0;
    v45 = 216;
    do
    {
      if ((_DWORD)v18)
      {
        v46 = 0;
        v47 = v45;
        do
        {
          if ((_DWORD)v19)
          {
            v48 = 0;
            v49 = v47;
            do
            {
              if ((_DWORD)v11)
              {
                v50 = 0;
                v51 = v49;
                do
                {
                  if ((_DWORD)v22)
                  {
                    v52 = 0;
                    v53 = v22;
                    v54 = v51;
                    do
                    {
                      if (v3 == 1 || v3 == 3)
                      {
                        v55 = *(__int16 **)(a1 + 3896);
                        v56 = *v55;
                        *(_QWORD *)(a1 + 3896) = v55 + 1;
                        v57 = *(_QWORD *)(a1 + 2840)
                            + 49152 * v44
                            + 12288 * v46
                            + 3072 * v48
                            + (v50 << 10)
                            + 4 * v52
                            + 200;
                      }
                      else
                      {
                        v58 = *(__int16 **)(a1 + 3896);
                        v56 = *v58;
                        *(_QWORD *)(a1 + 3896) = v58 + 1;
                        v57 = *(_QWORD *)(a1 + 2840) + v54;
                      }
                      *(_WORD *)(v57 + 2) = v56;
                      ++v52;
                      v54 += 4;
                      --v53;
                    }
                    while (v53);
                  }
                  ++v50;
                  v51 += 512;
                }
                while (v50 != v11);
              }
              ++v48;
              v49 += 1536;
            }
            while (v48 != v19);
          }
          ++v46;
          v47 += 6144;
        }
        while (v46 != v18);
      }
      ++v44;
      v45 += 30720;
    }
    while (v44 != v10);
  }
  if ((uint64_t)&v9[-*(_QWORD *)(a1 + 3896)] < (4 * v10 * v11 * v20 * v21 * v22))
  {
    v16 = "e: underflow while reading WgTypeB";
    goto LABEL_15;
  }
  if ((_DWORD)v10)
  {
    v59 = 0;
    v60 = 196808;
    v61 = 123096;
    v62 = 123096;
    do
    {
      if ((_DWORD)v20)
      {
        v63 = 0;
        v64 = v60;
        v65 = v62;
        do
        {
          if ((_DWORD)v21)
          {
            v66 = 0;
            v67 = v64;
            v68 = v65;
            do
            {
              if ((_DWORD)v11)
              {
                v69 = 0;
                v70 = v67;
                v71 = v68;
                do
                {
                  v72 = v22;
                  v73 = v70;
                  v74 = v71;
                  if ((_DWORD)v22)
                  {
                    do
                    {
                      if (v3 == 1)
                      {
                        v75 = *(__int16 **)(a1 + 3896);
                        v76 = *v75;
                        *(_QWORD *)(a1 + 3896) = v75 + 1;
                        *(_WORD *)(*(_QWORD *)(a1 + 2840) + v73) = v76;
                      }
                      else
                      {
                        v77 = *(__int16 **)(a1 + 3896);
                        if (v3 == 3)
                        {
                          v78 = *v77;
                          *(_QWORD *)(a1 + 3896) = v77 + 1;
                          *(_WORD *)(*(_QWORD *)(a1 + 2840) + v73) = v78;
                        }
                        else
                        {
                          v79 = *v77;
                          *(_QWORD *)(a1 + 3896) = v77 + 1;
                          *(_WORD *)(*(_QWORD *)(a1 + 2840) + v74) = v79;
                        }
                      }
                      v74 += 4;
                      v73 += 4;
                      --v72;
                    }
                    while (v72);
                  }
                  ++v69;
                  v71 += 512;
                  v70 += 1024;
                }
                while (v69 != v11);
              }
              ++v66;
              v68 += 1536;
              v67 += 3072;
            }
            while (v66 != v21);
          }
          ++v63;
          v65 += 7680;
          v64 += 15360;
        }
        while (v63 != v20);
      }
      ++v59;
      v62 += 15360;
      v60 += 30720;
    }
    while (v59 != v10);
    for (i = 0; i != v10; ++i)
    {
      if ((_DWORD)v20)
      {
        v81 = 0;
        v82 = v61;
        do
        {
          if ((_DWORD)v21)
          {
            v83 = 0;
            v84 = v82;
            do
            {
              if ((_DWORD)v11)
              {
                v85 = 0;
                v86 = v84;
                do
                {
                  if ((_DWORD)v22)
                  {
                    v87 = 0;
                    v88 = v22;
                    v89 = v86;
                    do
                    {
                      if (v3 == 1 || v3 == 3)
                      {
                        v90 = *(__int16 **)(a1 + 3896);
                        v91 = *v90;
                        *(_QWORD *)(a1 + 3896) = v90 + 1;
                        v92 = *(_QWORD *)(a1 + 2840)
                            + 30720 * i
                            + 15360 * v81
                            + 3072 * v83
                            + (v85 << 10)
                            + 4 * v87
                            + 196808;
                      }
                      else
                      {
                        v93 = *(__int16 **)(a1 + 3896);
                        v91 = *v93;
                        *(_QWORD *)(a1 + 3896) = v93 + 1;
                        v92 = *(_QWORD *)(a1 + 2840) + v89;
                      }
                      *(_WORD *)(v92 + 2) = v91;
                      ++v87;
                      v89 += 4;
                      --v88;
                    }
                    while (v88);
                  }
                  ++v85;
                  v86 += 512;
                }
                while (v85 != v11);
              }
              ++v83;
              v84 += 1536;
            }
            while (v83 != v21);
          }
          ++v81;
          v82 += 7680;
        }
        while (v81 != v20);
      }
      v61 += 15360;
    }
  }
  v94 = *(_QWORD *)(a1 + 3896) + 2;
  v95 = v94 - (_QWORD)v8;
  v96 = v95 & 3;
  v98 = -v95;
  v97 = v98 < 0;
  v99 = v98 & 3;
  if (v97)
    v100 = v96;
  else
    v100 = -v99;
  if ((_DWORD)v100)
    v101 = 4 - v100;
  else
    v101 = 0;
  v102 = (char *)(v94 + v101);
  *(_QWORD *)(a1 + 3896) = v102;
  if (v102 == v9)
    return 1;
  puts("e: parsing did not consume the full HTMP size");
  result = 0;
  *(_QWORD *)(a1 + 3896) = v9;
  return result;
}

uint64_t sub_1000123A8(_QWORD *a1, uint64_t a2)
{
  _DWORD *v4;
  int v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __int16 v14;
  unsigned int *v15;
  char *v16;
  unint64_t v17;
  char *v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  _BOOL4 v23;
  _BOOL4 v24;
  float v25;
  unsigned int v26;
  uint64_t v27;
  _BYTE *v28;
  unint64_t v29;
  _BYTE *v30;
  unint64_t v31;
  _BYTE *v32;
  unint64_t v33;
  _BOOL4 v35;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  void **v40;
  _QWORD *v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v4 = (_DWORD *)a1[355];
  v5 = *(_DWORD *)(a2 + 4);
  if (v5 != 0x10000 && v5 != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  if (*v4 != 1)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  v6 = malloc_type_calloc(1uLL, 0x2888uLL, 0x1000040BB29BD8AuLL);
  if (!v6)
  {
    v39 = "e: out of memory for EMMK table";
LABEL_80:
    puts(v39);
    return 0;
  }
  if (4 * *(_DWORD *)(a2 + 8) == 12)
  {
    v39 = "e: underflow while reading indices";
    goto LABEL_80;
  }
  v7 = v6;
  v8 = 0;
  v9 = a1[487];
  v10 = v9 + (4 * *(_DWORD *)(a2 + 8) - 12);
  v11 = v4[581889];
  v13 = v4[581884];
  v12 = v4[581885];
  v6[10370] = *(_BYTE *)v9;
  v14 = *(_WORD *)(v9 + 1);
  v15 = (unsigned int *)(v9 + 3);
  a1[487] = v9 + 3;
  *((_WORD *)v6 + 5184) = v14;
  v16 = v6 + 6912;
  do
  {
    if (*((_BYTE *)v4 + v8 + 2327589))
    {
      if (v10 - (uint64_t)v15 < (4 * v11 * v13 * v12))
      {
        v39 = "e: underflow while reading R/G/BGLALS";
        goto LABEL_80;
      }
      v17 = 0;
      v18 = v16;
      do
      {
        v19 = 0;
        v20 = v18;
        do
        {
          v21 = 0;
          v23 = v17 < v13 && v19 < v11;
          do
          {
            v24 = v21 < v12 && v23;
            v25 = 0.0;
            if (v24)
            {
              v26 = *v15++;
              a1[487] = v15;
              v25 = (float)v26 * 0.00048828;
            }
            *(float *)&v20[4 * v21++] = v25;
          }
          while (v21 != 6);
          ++v19;
          v20 += 24;
        }
        while (v19 != 12);
        ++v17;
        v18 += 288;
      }
      while (v17 != 4);
    }
    ++v8;
    v16 += 1152;
  }
  while (v8 != 3);
  v27 = 0;
  v28 = v7;
  do
  {
    if (*((_BYTE *)v4 + v27 + 2327589))
    {
      if (v10 - (uint64_t)v15 < (8 * v11 * v13 * v12))
      {
        v39 = "e: underflow while reading R/G/BGLACSS";
        goto LABEL_80;
      }
      v29 = 0;
      v30 = v28;
      do
      {
        v31 = 0;
        v32 = v30;
        do
        {
          v33 = 0;
          v35 = v29 < v13 && v31 < v11;
          do
          {
            if (v33 < v12 && v35)
            {
              v38 = *(_QWORD *)v15;
              v15 += 2;
              v37 = v38;
              a1[487] = v15;
            }
            else
            {
              v37 = 0;
            }
            *(_QWORD *)&v32[8 * v33++] = v37;
          }
          while (v33 != 6);
          ++v31;
          v32 += 48;
        }
        while (v31 != 12);
        ++v29;
        v30 += 576;
      }
      while (v29 != 4);
    }
    ++v27;
    v28 += 2304;
  }
  while (v27 != 3);
  if (v10 - (uint64_t)v15 <= 5)
  {
    v39 = "e: underflow while reading GSC scalers";
    goto LABEL_80;
  }
  a1[487] = (char *)v15 + 6;
  if (v10 - ((uint64_t)v15 + 6) <= 1)
  {
    v39 = "e: underflow while reading GSC spare";
    goto LABEL_80;
  }
  a1[487] = v15 + 2;
  v40 = (void **)a1[478];
  v41 = v40[1];
  v42 = (unint64_t)v40[2];
  if ((unint64_t)v41 >= v42)
  {
    v44 = ((char *)v41 - (_BYTE *)*v40) >> 3;
    if ((unint64_t)(v44 + 1) >> 61)
      sub_100008578();
    v45 = v42 - (_QWORD)*v40;
    v46 = v45 >> 2;
    if (v45 >> 2 <= (unint64_t)(v44 + 1))
      v46 = v44 + 1;
    if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8)
      v47 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v47 = v46;
    if (v47)
      v48 = (char *)sub_10001A0D0((uint64_t)(v40 + 2), v47);
    else
      v48 = 0;
    v49 = &v48[8 * v44];
    v50 = &v48[8 * v47];
    *(_QWORD *)v49 = v7;
    v43 = v49 + 8;
    v52 = (char *)*v40;
    v51 = (char *)v40[1];
    if (v51 != *v40)
    {
      do
      {
        v53 = *((_QWORD *)v51 - 1);
        v51 -= 8;
        *((_QWORD *)v49 - 1) = v53;
        v49 -= 8;
      }
      while (v51 != v52);
      v51 = (char *)*v40;
    }
    *v40 = v49;
    v40[1] = v43;
    v40[2] = v50;
    if (v51)
      operator delete(v51);
  }
  else
  {
    *v41 = v7;
    v43 = v41 + 1;
  }
  v40[1] = v43;
  v54 = a1[487];
  if (v9 - v54 >= 0)
    v55 = -((v9 - v54) & 3);
  else
    v55 = (v54 - v9) & 3;
  if ((_DWORD)v55)
  {
    v54 = v54 - v55 + 4;
    a1[487] = v54;
  }
  if (v54 != v10)
  {
    v39 = "e: parsing did not consume the full GSC size";
    goto LABEL_80;
  }
  return 1;
}

uint64_t sub_100012778(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  __int16 v12;
  __int16 *v13;
  unint64_t v14;
  int v15;
  const char *v16;
  unint64_t v17;
  char *v18;
  unint64_t i;
  __int16 v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  char *v27;
  unint64_t j;
  __int16 v29;
  __int16 v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t k;
  unint64_t v34;
  char v35;
  int v36;
  char v37;
  int v38;
  _WORD *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v44;

  if (*(_DWORD *)(a2 + 4) != 196608)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  v3 = *(_QWORD *)(a1 + 2840);
  if (*(_DWORD *)v3 != 1)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  v5 = malloc_type_calloc(1uLL, 0x248uLL, 0x10000402A0B50A7uLL);
  v44 = v5;
  if (!v5)
  {
    v16 = "e: out of memory for EMMK table";
    goto LABEL_61;
  }
  v6 = 4 * *(_DWORD *)(a2 + 8);
  v7 = (v6 - 12);
  if (v6 == 12)
  {
    v16 = "e: underflow while reading indices";
    goto LABEL_61;
  }
  v8 = *(_QWORD *)(a1 + 3896);
  v9 = *(unsigned int *)(v3 + 2327560);
  v10 = *(unsigned int *)(v3 + 2327564);
  v11 = *(_DWORD *)(v3 + 2327540);
  v5[578] = *(_BYTE *)v8;
  v12 = *(_WORD *)(v8 + 1);
  v13 = (__int16 *)(v8 + 3);
  *(_QWORD *)(a1 + 3896) = v8 + 3;
  *((_WORD *)v5 + 288) = v12;
  if (*(_BYTE *)(v3 + 2327584))
  {
    v14 = (v10 + 1);
    v15 = 2 * v9;
    if (v7 - 3 < (2 * v9 * v14))
    {
      v16 = "e: underflow while reading EM mask delay";
LABEL_61:
      puts(v16);
      return 0;
    }
    v17 = 0;
    v18 = v5 + 288;
    do
    {
      for (i = 0; i != 4; ++i)
      {
        v20 = 0;
        if (v17 < v9 && i < v14)
        {
          v21 = *v13++;
          v20 = v21;
          *(_QWORD *)(a1 + 3896) = v13;
        }
        *(_WORD *)&v18[2 * i] = v20;
      }
      ++v17;
      v18 += 8;
    }
    while (v17 != 9);
  }
  else
  {
    v15 = 2 * v9;
  }
  v22 = 0;
  v23 = v8 + v7;
  v24 = (v15 * v10);
  v25 = v5 + 360;
  do
  {
    if (*(_BYTE *)(v3 + v22 + 2327585))
    {
      if (v23 - (uint64_t)v13 < v24)
      {
        v16 = "e: underflow while reading EM mask";
        goto LABEL_61;
      }
      v26 = 0;
      v27 = v25;
      do
      {
        for (j = 0; j != 3; ++j)
        {
          v29 = 0;
          if (v26 < v9 && j < v10)
          {
            v30 = *v13++;
            v29 = v30;
            *(_QWORD *)(a1 + 3896) = v13;
          }
          *(_WORD *)&v27[2 * j] = v29;
        }
        ++v26;
        v27 += 6;
      }
      while (v26 != 9);
    }
    ++v22;
    v25 += 54;
  }
  while (v22 != 4);
  v31 = 0;
  v32 = (v10 - 1);
  do
  {
    if (*(_BYTE *)(v3 + v31 + 2327585))
    {
      if (v23 - (uint64_t)v13 < (4 * v9 * v32))
      {
        v16 = "e: underflow while reading EM band steps";
        goto LABEL_61;
      }
      for (k = 0; k != 9; ++k)
      {
        v34 = 0;
        v35 = 1;
        do
        {
          v36 = 0;
          v37 = v35;
          if (k < v9 && v34 < v32)
          {
            v38 = *(_DWORD *)v13;
            v13 += 2;
            v36 = v38;
            *(_QWORD *)(a1 + 3896) = v13;
          }
          v35 = 0;
          *(_DWORD *)&v5[72 * v31 + 8 * k + 4 * v34] = v36;
          v34 = 1;
        }
        while ((v37 & 1) != 0);
      }
    }
    ++v31;
  }
  while (v31 != 4);
  if (v23 - (uint64_t)v13 <= 5)
  {
    v16 = "e: underflow while reading EMMK scalers";
    goto LABEL_61;
  }
  v39 = v13 + 3;
  *(_QWORD *)(a1 + 3896) = v13 + 3;
  if (v23 - (uint64_t)(v13 + 3) < (16 * v11))
  {
    v16 = "e: underflow while reading EM Counts";
    goto LABEL_61;
  }
  v40 = 4;
  do
  {
    if (v11)
    {
      v39 += 2 * (v11 - 1) + 2;
      *(_QWORD *)(a1 + 3896) = v39;
    }
    --v40;
  }
  while (v40);
  if (v23 - (uint64_t)v39 < 2)
  {
    v16 = "e: underflow while reading EMMK spare";
    goto LABEL_61;
  }
  *(_QWORD *)(a1 + 3896) = v39 + 1;
  sub_100015B54(*(void ***)(a1 + 3832), &v44);
  v41 = *(_QWORD *)(a1 + 3896);
  if (v8 - v41 >= 0)
    v42 = -((v8 - v41) & 3);
  else
    v42 = (v41 - v8) & 3;
  if ((_DWORD)v42)
  {
    v41 = v41 - v42 + 4;
    *(_QWORD *)(a1 + 3896) = v41;
  }
  if (v41 != v23)
  {
    v16 = "e: parsing did not consume the full EMMK size";
    goto LABEL_61;
  }
  return 1;
}

uint64_t sub_100012AE8(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  uint64_t v3;
  const char *v4;
  unsigned __int8 *v6;
  unsigned int v7;
  unsigned int v8;
  int v9;

  if (*(_DWORD *)(a2 + 4) == 0x20000)
  {
    v2 = *(_DWORD **)(a1 + 2840);
    if (*v2 == 2)
    {
      v3 = (4 * *(_DWORD *)(a2 + 8) - 12);
      if (v3 > 5)
      {
        v6 = *(unsigned __int8 **)(a1 + 3896);
        *(_QWORD *)(a1 + 3896) = v6 + 3;
        v7 = v6[3];
        *(_QWORD *)(a1 + 3896) = v6 + 4;
        if (v7 >= 5)
        {
          printf("e: unsupported region count: %u > %u\n");
          return 0;
        }
        v8 = v6[4];
        *(_QWORD *)(a1 + 3896) = v6 + 5;
        if (v8 >= 2)
        {
          printf("e: unsupported sensor channel count: %u > %u\n");
          return 0;
        }
        v9 = v6[5];
        v2[3104] = v7;
        v2[3105] = v8;
        v2[3106] = v9;
        *(_QWORD *)(a1 + 3896) = v6 + 8;
        if (v6 + 8 == &v6[v3])
          return 1;
        v4 = "e: parsing did not consume the full CNST size";
      }
      else
      {
        v4 = "e: cannot read data in CNST";
      }
      puts(v4);
    }
    else
    {
      printf("e: mismatching versions: %u != %u\n");
    }
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_100012C00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int16 *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  __int16 *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  if (*(_DWORD *)(a2 + 4) == 196608)
  {
    v2 = *(_QWORD *)(a1 + 2840);
    if (*(_DWORD *)v2 == 2)
    {
      v3 = (4 * *(_DWORD *)(a2 + 8) - 12);
      if (4 * *(_DWORD *)(a2 + 8) == 12)
      {
        v8 = "e: underflow while temperature / brightness";
      }
      else
      {
        v4 = *(_QWORD *)(a1 + 3896);
        v5 = *(unsigned int *)(v2 + 12416);
        v6 = *(unsigned int *)(v2 + 12424);
        *(_BYTE *)(v2 + 12410) = *(_BYTE *)v4;
        v7 = *(_WORD *)(v4 + 1);
        *(_QWORD *)(a1 + 3896) = v4 + 3;
        *(_WORD *)(v2 + 12408) = v7;
        if (v3 > 6)
        {
          v10 = *(unsigned __int8 *)(v4 + 3);
          *(_QWORD *)(a1 + 3896) = v4 + 4;
          v11 = *(unsigned __int8 *)(v4 + 4);
          v12 = *(unsigned __int16 *)(v4 + 5);
          *(_QWORD *)(a1 + 3896) = v4 + 7;
          if (v10 != 1)
          {
            printf("e: unsupported NAC: %u != %u\n");
            return 0;
          }
          if (v11 != 4)
          {
            printf("e: unsupported NASVD: %u != %u\n");
            return 0;
          }
          if (v12 != 64)
          {
            printf("e: unsupported NHS: %u != %u\n");
            return 0;
          }
          if (v3 - 7 >= (((_DWORD)v5 * (_DWORD)v6) << 10))
          {
            if ((_DWORD)v5)
            {
              v13 = 0;
              v14 = v2 + 120;
              do
              {
                v15 = 0;
                v16 = v14;
                do
                {
                  if ((_DWORD)v6)
                  {
                    v17 = 0;
                    v18 = v16;
                    do
                    {
                      for (i = 0; i != 256; i += 4)
                      {
                        v20 = *(__int16 **)(a1 + 3896);
                        v21 = *v20;
                        *(_QWORD *)(a1 + 3896) = v20 + 1;
                        *(_WORD *)(v18 + i) = v21;
                      }
                      ++v17;
                      v18 += 256;
                    }
                    while (v17 != v6);
                  }
                  ++v15;
                  v16 += 768;
                }
                while (v15 != 4);
                ++v13;
                v14 += 3072;
              }
              while (v13 != v5);
              v22 = 0;
              v23 = v2 + 122;
              do
              {
                v24 = 0;
                v25 = v23;
                do
                {
                  if ((_DWORD)v6)
                  {
                    v26 = 0;
                    v27 = v25;
                    do
                    {
                      for (j = 0; j != 256; j += 4)
                      {
                        v29 = *(__int16 **)(a1 + 3896);
                        v30 = *v29;
                        *(_QWORD *)(a1 + 3896) = v29 + 1;
                        *(_WORD *)(v27 + j) = v30;
                      }
                      ++v26;
                      v27 += 256;
                    }
                    while (v26 != v6);
                  }
                  ++v24;
                  v25 += 768;
                }
                while (v24 != 4);
                ++v22;
                v23 += 3072;
              }
              while (v22 != v5);
            }
            v31 = v4 + v3;
            v32 = *(_QWORD *)(a1 + 3896);
            v33 = v32 - v4;
            v34 = v33 & 3;
            v36 = -v33;
            v35 = v36 < 0;
            v37 = v36 & 3;
            if (v35)
              v38 = v34;
            else
              v38 = -v37;
            if ((_DWORD)v38)
            {
              v32 = v32 - v38 + 4;
              *(_QWORD *)(a1 + 3896) = v32;
            }
            if (v32 == v31)
              return 1;
            v8 = "e: parsing did not consume the full HTMP size";
          }
          else
          {
            v8 = "e: underflow while reading WgTypeA";
          }
        }
        else
        {
          v8 = "e: underflow while reading sizes";
        }
      }
      puts(v8);
    }
    else
    {
      printf("e: mismatching versions: %u != %u\n");
    }
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_100012E74(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  int v3;
  uint64_t v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;
  char *v8;
  int v9;
  const char *v10;
  uint64_t v12;
  unsigned __int16 *v13;
  _DWORD *v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;
  int64_t v18;
  int64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (*(_DWORD *)(a2 + 4) == 0x10000)
  {
    v2 = *(_DWORD **)(a1 + 2840);
    if (*v2 == 2)
    {
      v3 = 4 * *(_DWORD *)(a2 + 8);
      v4 = (v3 - 12);
      if (v3 == 12)
      {
        v10 = "e: underflow while reading sizes";
LABEL_25:
        puts(v10);
        return 0;
      }
      v5 = *(char **)(a1 + 3896);
      v6 = v2[3105];
      v7 = v2[3106];
      v9 = *v5;
      v8 = v5 + 1;
      *(_QWORD *)(a1 + 3896) = v5 + 1;
      if (v9 == 128)
      {
        if (v4 - 1 >= (v6 * (unint64_t)v7) << 8)
        {
          v12 = 0;
          v13 = (unsigned __int16 *)&v5[v4];
          v14 = v2 + 3116;
          do
          {
            v15 = v7;
            v16 = v14;
            if ((_DWORD)v7)
            {
              do
              {
                v17 = *(unsigned __int16 *)v8;
                v8 += 2;
                *v16 = v17;
                v16 += 128;
                --v15;
              }
              while (v15);
              *(_QWORD *)(a1 + 3896) = v8;
            }
            ++v12;
            ++v14;
          }
          while (v12 != 128);
          v18 = v8 - v5;
          v19 = v18 & 3;
          v21 = -v18;
          v20 = v21 < 0;
          v22 = v21 & 3;
          if (v20)
            v23 = v19;
          else
            v23 = -v22;
          if ((_DWORD)v23)
          {
            v8 = &v8[-v23 + 4];
            *(_QWORD *)(a1 + 3896) = v8;
          }
          if (v8 == (char *)v13)
            return 1;
          v10 = "e: parsing did not consume the full MTNC size";
        }
        else
        {
          v10 = "e: underflow while reading multi nit LUT";
        }
        goto LABEL_25;
      }
      printf("e: unsupported NNIT: %u != %u\n");
    }
    else
    {
      printf("e: mismatching versions: %u != %u\n");
    }
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_100012FC8(_QWORD *a1, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  BOOL v19;
  int v20;
  BOOL v21;
  int v22;
  int v23;

  if (*(_DWORD *)(a2 + 4) == 196608)
  {
    v3 = (_DWORD *)a1[355];
    if (*v3 == 3)
    {
      printf("i: Processing CNST version 0x%x\n", 196608);
      if ((4 * *(_DWORD *)(a2 + 8) - 12) > 0x17)
      {
        v6 = a1[487];
        v7 = *(unsigned __int16 *)(v6 + 2);
        a1[487] = v6 + 4;
        v8 = *(unsigned __int8 *)(v6 + 4);
        v9 = *(unsigned __int16 *)(v6 + 5);
        a1[487] = v6 + 7;
        v10 = *(unsigned __int8 *)(v6 + 7);
        a1[487] = v6 + 10;
        v11 = *(unsigned __int8 *)(v6 + 10);
        a1[487] = v6 + 11;
        v12 = *(unsigned __int8 *)(v6 + 11);
        a1[487] = v6 + 12;
        if (v7 < 0x79)
        {
          if (v8 < 3)
          {
            if (v9 < 0x79)
            {
              if (v10 < 3)
              {
                if (v11 < 0x25)
                {
                  if (v12 < 6)
                  {
                    v13 = *(unsigned __int8 *)(v6 + 12);
                    a1[487] = v6 + 13;
                    if (v13 < 5)
                    {
                      v14 = *(unsigned __int8 *)(v6 + 13);
                      a1[487] = v6 + 14;
                      if (v14 < 7)
                      {
                        v15 = v3 + 479644;
                        v16 = *(unsigned __int8 *)(v6 + 14);
                        a1[487] = v6 + 19;
                        v17 = *(unsigned __int8 *)(v6 + 19);
                        a1[487] = v6 + 20;
                        v18 = *(unsigned __int8 *)(v6 + 20);
                        a1[487] = v6 + 21;
                        *v15 = v13;
                        v15[1] = v14;
                        v15[2] = v16;
                        v15[3] = v12;
                        v15[4] = v11;
                        v15[6] = v18;
                        v15[7] = v17;
                        v15[8] = v8;
                        v15[9] = v7;
                        if (v7)
                          v19 = v8 == 0;
                        else
                          v19 = 1;
                        v20 = !v19;
                        if (v12)
                          v21 = v11 == 0;
                        else
                          v21 = 1;
                        v22 = v21;
                        if (v21)
                          v23 = 0;
                        else
                          v23 = 2;
                        v15[12] = v23 | v20 | v15[12] & 0xFFFFFFFC;
                        if (v20 && !v22)
                        {
                          if (v10 | v9 && !a1[356])
                            operator new();
                          operator new();
                        }
                        printf("e: missing EMMP (T%d B%d) or gray scales (T%d B%d)\n");
                      }
                      else
                      {
                        printf("e: unsupported sensor channel count: %u > %u\n");
                      }
                    }
                    else
                    {
                      printf("e: unsupported region count: %u > %u\n");
                    }
                  }
                  else
                  {
                    printf("e: unsupported PCS temperature count: %u > %u\n");
                  }
                }
                else
                {
                  printf("e: unsupported PCS brightness count: %u > %u\n");
                }
              }
              else
              {
                printf("e: unsupported EMMP ALSS temperature count: %u > %u\n");
              }
            }
            else
            {
              printf("e: unsupported EMMP ALSS brightness count: %u > %u\n");
            }
          }
          else
          {
            printf("e: unsupported EMMP ACSS temperature count: %u > %u\n");
          }
        }
        else
        {
          printf("e: unsupported EMMP ACSS brightness count: %u > %u\n");
        }
      }
      else
      {
        printf("e: unexpected size for CNST %u < %u\n");
      }
    }
    else
    {
      printf("e: mismatching versions: %u != %u\n");
    }
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_1000133C8(_QWORD *a1, uint64_t a2)
{
  _DWORD *v3;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  unint64_t *v16;
  float *v17;
  uint64_t v18;
  float *v19;
  uint64_t v20;
  float *v21;
  unint64_t v22;
  const char *v23;
  void **v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  if (*(_DWORD *)(a2 + 4) != 0x10000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  v3 = (_DWORD *)a1[355];
  if (*v3 != 3)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  v5 = malloc_type_calloc(1uLL, 0x128uLL, 0x1000040CB3E114FuLL);
  if (!v5)
  {
    v23 = "e: out of memory for PCS table";
LABEL_44:
    puts(v23);
    return 0;
  }
  v6 = 4 * *(_DWORD *)(a2 + 8);
  v7 = (v6 - 12);
  if (v6 == 12)
  {
    v23 = "e: underflow while reading indices";
    goto LABEL_44;
  }
  v8 = v5;
  v9 = 0;
  v10 = v3 + 479644;
  v11 = a1[487];
  v12 = v11 + v7;
  v14 = *v10;
  v13 = v10[1];
  v5[290] = *(_BYTE *)v11;
  v15 = *(_WORD *)(v11 + 1);
  v16 = (unint64_t *)(v11 + 3);
  a1[487] = v11 + 3;
  *((_WORD *)v5 + 144) = v15;
  v17 = (float *)v5;
  do
  {
    if (v12 - (uint64_t)v16 < 4 * (unint64_t)(v13 * v14))
    {
      v23 = "e: underflow while reading PCS scales";
      goto LABEL_44;
    }
    if ((_DWORD)v14)
    {
      v18 = 0;
      v19 = v17;
      do
      {
        v20 = v13;
        v21 = v19;
        if ((_DWORD)v13)
        {
          do
          {
            v22 = *v16++;
            *v21++ = (float)v22 * 1.4552e-11;
            --v20;
          }
          while (v20);
          a1[487] = v16;
        }
        ++v18;
        v19 += 6;
      }
      while (v18 != v14);
    }
    ++v9;
    v17 += 24;
  }
  while (v9 != 3);
  if (v12 - (uint64_t)v16 < 36)
  {
    v23 = "e: underflow while reading PCS spare";
    goto LABEL_44;
  }
  a1[487] = (char *)v16 + 36;
  v24 = (void **)a1[480];
  v25 = v24[1];
  v26 = (unint64_t)v24[2];
  if ((unint64_t)v25 >= v26)
  {
    v28 = ((char *)v25 - (_BYTE *)*v24) >> 3;
    if ((unint64_t)(v28 + 1) >> 61)
      sub_100008578();
    v29 = v26 - (_QWORD)*v24;
    v30 = v29 >> 2;
    if (v29 >> 2 <= (unint64_t)(v28 + 1))
      v30 = v28 + 1;
    if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
      v31 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v31 = v30;
    if (v31)
      v32 = (char *)sub_10001A0D0((uint64_t)(v24 + 2), v31);
    else
      v32 = 0;
    v33 = &v32[8 * v28];
    v34 = &v32[8 * v31];
    *(_QWORD *)v33 = v8;
    v27 = v33 + 8;
    v36 = (char *)*v24;
    v35 = (char *)v24[1];
    if (v35 != *v24)
    {
      do
      {
        v37 = *((_QWORD *)v35 - 1);
        v35 -= 8;
        *((_QWORD *)v33 - 1) = v37;
        v33 -= 8;
      }
      while (v35 != v36);
      v35 = (char *)*v24;
    }
    *v24 = v33;
    v24[1] = v27;
    v24[2] = v34;
    if (v35)
      operator delete(v35);
  }
  else
  {
    *v25 = v8;
    v27 = v25 + 1;
  }
  v24[1] = v27;
  v38 = a1[487];
  if (v11 - v38 >= 0)
    v39 = -((v11 - v38) & 3);
  else
    v39 = (v38 - v11) & 3;
  if ((_DWORD)v39)
  {
    v38 = v38 - v39 + 4;
    a1[487] = v38;
  }
  if (v38 != v12)
  {
    v23 = "e: parsing did not consume the full PCS size";
    goto LABEL_44;
  }
  return 1;
}

uint64_t sub_100013660(uint64_t a1, uint64_t a2)
{
  _DWORD *v3;
  char *v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  int v13;
  int v14;
  unsigned __int8 *v15;
  __int16 v16;
  char *v17;
  int v18;
  _BYTE *v19;
  char v20;
  __int16 *v21;
  _WORD *v22;
  int v23;
  __int16 *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  int v32;
  int *v33;
  int v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;

  if (*(_DWORD *)(a2 + 4) != 0x10000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  v3 = *(_DWORD **)(a1 + 2840);
  if (*v3 != 3)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  v5 = (char *)malloc_type_calloc(1uLL, 0x1928uLL, 0x1000040B1E0D9D0uLL);
  v42 = v5;
  if (!v5)
  {
    v8 = "e: out of memory for EMMP table";
    goto LABEL_10;
  }
  v6 = v3[479646];
  if (v6 >= 4)
  {
    printf("e: too many EM color channels %d\n");
    return 0;
  }
  v9 = v3[479651];
  if (v9 >= 0x11)
  {
    printf("e: too many EM gray levels %d\n");
    return 0;
  }
  v10 = v3[479650];
  if (v10 >= 0x41)
  {
    printf("e: too many EM lines %d\n");
    return 0;
  }
  v11 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v11 < (2 * (int)v9 + 4 * ((int)v9 - 1) + 7) * (int)v6 + 3)
  {
    printf("e: provided data size smaller than expected %d < %d\n");
    return 0;
  }
  v12 = *(unsigned __int8 **)(a1 + 3896);
  v14 = *v12;
  v13 = v14;
  *(_QWORD *)(a1 + 3896) = v12 + 1;
  if (v14 == 2)
  {
    if (!*(_BYTE *)(a1 + 2856))
      goto LABEL_22;
    v8 = "e: ACSS and ALSS should share either none or all of EMMP data";
LABEL_10:
    puts(v8);
    return 0;
  }
  if (v13 == 3)
    *(_BYTE *)(a1 + 2856) = 1;
LABEL_22:
  v15 = &v12[v11];
  v5[6434] = v12[1];
  v16 = *((_WORD *)v12 + 1);
  v17 = (char *)(v12 + 4);
  *(_QWORD *)(a1 + 3896) = v12 + 4;
  *((_WORD *)v5 + 3216) = v16;
  if ((_DWORD)v6)
  {
    v18 = v6;
    v19 = v5;
    do
    {
      v20 = *v17++;
      *v19++ = v20;
      --v18;
    }
    while (v18);
    v21 = (__int16 *)(*(_QWORD *)(a1 + 3896) + v6);
    v22 = v5 + 4;
    v23 = v6;
    v24 = v21;
    do
    {
      v25 = *v24++;
      *v22++ = v25;
      --v23;
    }
    while (v23);
    v17 = (char *)&v21[v6];
    *(_QWORD *)(a1 + 3896) = v17;
    v26 = 0;
    v27 = 2 * v9;
    v28 = v5 + 12;
    do
    {
      if ((_DWORD)v9)
      {
        v29 = 0;
        do
        {
          *(_WORD *)&v28[2 * v29] = *(_WORD *)&v17[2 * v29];
          ++v29;
        }
        while ((_DWORD)v9 != (_DWORD)v29);
      }
      v17 += v27;
      ++v26;
      v28 += 32;
    }
    while (v26 != v6);
    v30 = 0;
    *(_QWORD *)(a1 + 3896) = v17;
    do
    {
      if ((_DWORD)v9 != 1)
      {
        v31 = &v5[60 * v30 + 108];
        v32 = v9 - 1;
        v33 = (int *)v17;
        do
        {
          v34 = *v33++;
          *(_DWORD *)v31 = v34;
          v31 += 4;
          --v32;
        }
        while (v32);
      }
      v17 += 4 * (v9 - 1);
      ++v30;
    }
    while (v30 != v6);
    v35 = 0;
    *(_QWORD *)(a1 + 3896) = v17;
    v36 = v5 + 288;
    do
    {
      if ((_DWORD)v10)
      {
        v37 = 0;
        v38 = v36;
        do
        {
          if ((_DWORD)v9)
          {
            v39 = 0;
            do
            {
              *(_WORD *)&v38[2 * v39] = *(_WORD *)&v17[2 * v39];
              ++v39;
            }
            while ((_DWORD)v9 != (_DWORD)v39);
          }
          v17 += v27;
          ++v37;
          v38 += 32;
        }
        while (v37 != v10);
        *(_QWORD *)(a1 + 3896) = v17;
      }
      ++v35;
      v36 += 2048;
    }
    while (v35 != v6);
  }
  if (v15 - (unsigned __int8 *)v17 < 6)
  {
    v8 = "e: underflow while reading EMMK spare";
    goto LABEL_10;
  }
  *(_QWORD *)(a1 + 3896) = v17 + 6;
  if ((v13 & 1) != 0)
    sub_100015B54(*(void ***)(a1 + 3864), &v42);
  if ((v13 & 2) != 0)
    sub_100015B54(*(void ***)(a1 + 3872), &v42);
  v40 = *(_QWORD *)(a1 + 3896);
  if ((uint64_t)&v12[-v40] >= 0)
    v41 = -(uint64_t)((unint64_t)&v12[-v40] & 3);
  else
    v41 = (v40 - (_QWORD)v12) & 3;
  if ((_DWORD)v41)
  {
    v40 = v40 - v41 + 4;
    *(_QWORD *)(a1 + 3896) = v40;
  }
  if ((unsigned __int8 *)v40 != v15)
  {
    v8 = "e: parsing did not consume the full EMMK size";
    goto LABEL_10;
  }
  return 1;
}

uint64_t sub_1000139B4(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (*(_DWORD *)(a2 + 4) == 0x40000)
  {
    v2 = *(_DWORD **)(a1 + 2840);
    if (*v2 == 4)
    {
      v3 = (4 * *(_DWORD *)(a2 + 8) - 12);
      if (v3 > 0xE)
      {
        v5 = *(_QWORD *)(a1 + 3896);
        *(_QWORD *)(a1 + 3896) = v5 + 1;
        v6 = *(unsigned __int8 *)(v5 + 1);
        *(_QWORD *)(a1 + 3896) = v5 + 2;
        v7 = *(unsigned __int8 *)(v5 + 2);
        *(_QWORD *)(a1 + 3896) = v5 + 3;
        v8 = *(unsigned __int8 *)(v5 + 3);
        *(_QWORD *)(a1 + 3896) = v5 + 4;
        v9 = *(unsigned __int8 *)(v5 + 4);
        *(_QWORD *)(a1 + 3896) = v5 + 5;
        v10 = *(unsigned __int8 *)(v5 + 5);
        *(_QWORD *)(a1 + 3896) = v5 + 6;
        v11 = *(unsigned __int8 *)(v5 + 6);
        *(_QWORD *)(a1 + 3896) = v5 + 7;
        v12 = *(unsigned __int8 *)(v5 + 7);
        *(_QWORD *)(a1 + 3896) = v5 + 8;
        v13 = *(unsigned __int8 *)(v5 + 8);
        *(_QWORD *)(a1 + 3896) = v5 + 9;
        v14 = *(unsigned __int8 *)(v5 + 9);
        *(_QWORD *)(a1 + 3896) = v5 + 10;
        v15 = *(unsigned __int8 *)(v5 + 10);
        v16 = *(unsigned __int16 *)(v5 + 11);
        v17 = *(unsigned __int16 *)(v5 + 13);
        *(_QWORD *)(a1 + 3896) = v5 + 15;
        if (v13 >= 5)
        {
          printf("e: unsupported region count: %u > %u\n");
          return 0;
        }
        if (v14 >= 2)
        {
          printf("e: unsupported sensor channel count: %u > %u\n");
          return 0;
        }
        if (v15 >= 4)
        {
          printf("e: unsupported color count: %u > %u\n");
          return 0;
        }
        if (v16 >= 0x81)
        {
          printf("e: unsupported gray value count: %u > %u\n");
          return 0;
        }
        if (v17 >= 0x80)
        {
          printf("e: unsupported gray step count: %u > %u\n");
          return 0;
        }
        if (v6 != 1)
        {
          printf("e: unsupported htmp emission freq count: %u != %u\n");
          return 0;
        }
        if (v7)
        {
          printf("e: unsupported benl emission freq count: %u != %u\n");
          return 0;
        }
        if (v8)
        {
          printf("e: unsupported benl brightness count: %u != %u\n");
          return 0;
        }
        if (v9 != 1)
        {
          printf("e: unsupported pdcc emission freq: %u != %u\n");
          return 0;
        }
        if (v10 != 1)
        {
          printf("e: unsupported pdcc temperature count: %u != %u\n");
          return 0;
        }
        if (v11)
        {
          printf("e: unsupported pdmc emission freq: %u != %u\n");
          return 0;
        }
        if (v12)
        {
          printf("e: unsupported pdmc temperature count: %u != %u\n");
          return 0;
        }
        v19 = v2 + 5022;
        v20 = v5 + v3;
        *v19 = v13;
        v19[1] = v14;
        v19[2] = v15;
        *((_WORD *)v19 + 14) = v16;
        *((_WORD *)v19 + 15) = v17;
        v21 = *(_QWORD *)(a1 + 3896);
        v22 = v21 - v5;
        v23 = v22 & 3;
        v25 = -v22;
        v24 = v25 < 0;
        v26 = v25 & 3;
        if (v24)
          v27 = v23;
        else
          v27 = -v26;
        if ((_DWORD)v27)
        {
          v21 = v21 - v27 + 4;
          *(_QWORD *)(a1 + 3896) = v21;
        }
        if (v21 == v20)
          return 1;
        v4 = "e: parsing did not consume the full CNST size";
      }
      else
      {
        v4 = "e: cannot read data in CNST";
      }
      puts(v4);
    }
    else
    {
      printf("e: mismatching versions: %u != %u\n");
    }
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_100013C54(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  _DWORD *v4;
  unsigned int *v5;
  unint64_t *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char *v10;
  char v11;
  char *v12;
  char v13;
  char *v14;
  char v15;
  char *v16;
  char v17;
  unsigned __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  const char *v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  _BYTE *v26;
  char v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  _BYTE *v31;
  char v32;
  uint64_t v33;
  _DWORD *v34;
  int v35;
  _DWORD *v36;
  _DWORD *v37;
  uint64_t v38;
  int v39;
  _DWORD *v40;
  uint64_t v41;
  int v42;
  _DWORD *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  _DWORD *v47;
  int v48;
  unsigned __int8 *v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned __int8 *v57;

  if (*(_DWORD *)(a2 + 4) != 196608)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  v2 = *(_DWORD *)(a1 + 2832);
  if (v2 != 5)
  {
    if (v2 == 4)
    {
      v3 = *(_QWORD *)(a1 + 2840);
      v4 = (_DWORD *)(v3 + 8);
      v5 = (unsigned int *)(v3 + 20088);
      v6 = (unint64_t *)(v3 + 20136);
      goto LABEL_7;
    }
    printf("e: mismatching versions: %u != 4,5\n");
    return 0;
  }
  v7 = *(_QWORD *)(a1 + 2840);
  v5 = (unsigned int *)(v7 + 172032);
  v4 = (_DWORD *)(v7 + 8);
  v6 = (unint64_t *)(v7 + 172080);
LABEL_7:
  v8 = 4 * *(_DWORD *)(a2 + 8);
  v9 = (v8 - 12);
  if (v8 == 12)
  {
    v22 = "e: underflow while reading feature enable flags";
    goto LABEL_49;
  }
  v10 = *(char **)(a1 + 3896);
  v11 = *v10;
  *(_QWORD *)(a1 + 3896) = v10 + 1;
  *v6 = *v6 & 0xFFFFFFFFFFFFFFFELL | v11 & 1;
  v12 = *(char **)(a1 + 3896);
  v13 = *v12;
  *(_QWORD *)(a1 + 3896) = v12 + 1;
  *v6 = *v6 & 0xFFFFFFFFFFFFFFFDLL | (2 * (v13 & 1));
  v14 = *(char **)(a1 + 3896);
  v15 = *v14;
  *(_QWORD *)(a1 + 3896) = v14 + 1;
  *v6 = *v6 & 0xFFFFFFFFFFFFFFFBLL | (4 * (v15 & 1));
  v16 = *(char **)(a1 + 3896);
  v17 = *v16;
  v18 = (unsigned __int8 *)&v10[v9];
  *(_QWORD *)(a1 + 3896) = v16 + 1;
  *v6 = *v6 & 0xFFFFFFFFFFFFFFE7 | (8 * (v17 & 3));
  v19 = *v5;
  v20 = v5[1];
  v21 = *(char **)(a1 + 3896);
  if (v18 - (unsigned __int8 *)v21 < (2 * v19 * v20))
  {
    v22 = "e: underflow while reading num_svds and shift_bits";
LABEL_49:
    puts(v22);
    return 0;
  }
  if ((_DWORD)v19)
  {
    v23 = 0;
    v24 = (char *)v4 + 25;
    do
    {
      v25 = v20;
      v26 = v24;
      if ((_DWORD)v20)
      {
        do
        {
          v27 = *v21++;
          *(_QWORD *)(a1 + 3896) = v21;
          *v26 = v27;
          v26 += 4;
          --v25;
        }
        while (v25);
      }
      ++v23;
      v24 += 28;
    }
    while (v23 != v19);
    v28 = 0;
    v29 = v4 + 6;
    do
    {
      v30 = v20;
      v31 = v29;
      if ((_DWORD)v20)
      {
        do
        {
          v32 = *v21++;
          *(_QWORD *)(a1 + 3896) = v21;
          *v31 = v32;
          v31 += 4;
          --v30;
        }
        while (v30);
      }
      ++v28;
      v29 += 28;
    }
    while (v28 != v19);
  }
  if (v18 - (unsigned __int8 *)v21 < (8 * v19))
  {
    v22 = "e: underflow while reading regions";
    goto LABEL_49;
  }
  if ((_DWORD)v19)
  {
    v33 = v19;
    v34 = v4;
    do
    {
      v35 = *(unsigned __int16 *)v21;
      v21 += 2;
      *v34 = v35;
      v34 += 7;
      --v33;
    }
    while (v33);
    *(_QWORD *)(a1 + 3896) = v21;
    v36 = v4 + 1;
    do
    {
      *v36 = *(unsigned __int16 *)&v21[v33];
      v36 += 7;
      v33 += 2;
    }
    while (2 * v19 != v33);
    v21 += v33;
    *(_QWORD *)(a1 + 3896) = v21;
    v37 = v4 + 2;
    v38 = v19;
    do
    {
      v39 = *(unsigned __int16 *)v21;
      v21 += 2;
      *v37 = v39;
      v37 += 7;
      --v38;
    }
    while (v38);
    *(_QWORD *)(a1 + 3896) = v21;
    v40 = v4 + 3;
    v41 = v19;
    do
    {
      v42 = *(unsigned __int16 *)v21;
      v21 += 2;
      *v40 = v42;
      v40 += 7;
      --v41;
    }
    while (v41);
    *(_QWORD *)(a1 + 3896) = v21;
  }
  if (v18 - (unsigned __int8 *)v21 < (2 * v19))
  {
    v22 = "e: underflow while reading interp_factor";
    goto LABEL_49;
  }
  if ((_DWORD)v19)
  {
    v43 = v4 + 4;
    v44 = v19;
    do
    {
      v45 = *v21++;
      *(_QWORD *)(a1 + 3896) = v21;
      *v43 = v45;
      v43 += 7;
      --v44;
    }
    while (v44);
    v46 = 0;
    v47 = v4 + 5;
    do
    {
      v48 = v21[v46];
      *(_QWORD *)(a1 + 3896) = &v21[v46 + 1];
      *v47 = v48;
      v47 += 7;
      ++v46;
    }
    while (v19 != v46);
    v21 += v46;
  }
  v49 = (unsigned __int8 *)(v21 + 2);
  v50 = v21 + 2 - v10;
  v51 = v50 & 3;
  v53 = -v50;
  v52 = v53 < 0;
  v54 = v53 & 3;
  if (v52)
    v55 = v51;
  else
    v55 = -v54;
  if ((_DWORD)v55)
    v56 = 4 - v55;
  else
    v56 = 0;
  v57 = &v49[v56];
  *(_QWORD *)(a1 + 3896) = v57;
  if (v57 != v18)
  {
    v22 = "e: parsing did not consume the full RCFG size";
    goto LABEL_49;
  }
  return 1;
}

uint64_t sub_100013F4C(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int16 *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  __int16 *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  if (*(_DWORD *)(a2 + 4) == 0x40000)
  {
    v2 = *(_DWORD *)(a1 + 2832);
    if (v2 == 5)
    {
      v3 = *(_QWORD *)(a1 + 2840);
      v4 = (unsigned int *)(v3 + 172032);
    }
    else
    {
      if (v2 != 4)
      {
        printf("e: mismatching versions: %u != 4,5\n");
        return 0;
      }
      v3 = *(_QWORD *)(a1 + 2840);
      v4 = (unsigned int *)(v3 + 20088);
    }
    v5 = v3 + 120;
    v6 = (4 * *(_DWORD *)(a2 + 8) - 12);
    if (v6 > 4)
    {
      v8 = *(_QWORD *)(a1 + 3896);
      v9 = *v4;
      v10 = v4[2];
      *(_BYTE *)(v5 + 12290) = *(_BYTE *)v8;
      *(_WORD *)(v5 + 12288) = *(_WORD *)(v8 + 1);
      *(_QWORD *)(a1 + 3896) = v8 + 5;
      if (v6 > 8)
      {
        v12 = *(unsigned __int8 *)(v8 + 5);
        *(_QWORD *)(a1 + 3896) = v8 + 6;
        v13 = *(unsigned __int8 *)(v8 + 6);
        v14 = *(unsigned __int16 *)(v8 + 7);
        *(_QWORD *)(a1 + 3896) = v8 + 9;
        if (v12 != 1)
        {
          printf("e: unsupported NAC: %u != %u\n");
          return 0;
        }
        if (v13 != 4)
        {
          printf("e: unsupported NASVD: %u != %u\n");
          return 0;
        }
        if (v14 != 64)
        {
          printf("e: unsupported NHS: %u != %u\n");
          return 0;
        }
        if (v6 - 9 >= (((_DWORD)v9 * (_DWORD)v10) << 10))
        {
          if ((_DWORD)v9)
          {
            v15 = 0;
            v16 = v5;
            do
            {
              v17 = 0;
              v18 = v16;
              do
              {
                if ((_DWORD)v10)
                {
                  v19 = 0;
                  v20 = v18;
                  do
                  {
                    for (i = 0; i != 256; i += 4)
                    {
                      v22 = *(__int16 **)(a1 + 3896);
                      v23 = *v22;
                      *(_QWORD *)(a1 + 3896) = v22 + 1;
                      *(_WORD *)(v20 + i) = v23;
                    }
                    ++v19;
                    v20 += 256;
                  }
                  while (v19 != v10);
                }
                ++v17;
                v18 += 768;
              }
              while (v17 != 4);
              ++v15;
              v16 += 3072;
            }
            while (v15 != v9);
            v24 = 0;
            v25 = v5 + 2;
            do
            {
              v26 = 0;
              v27 = v25;
              do
              {
                if ((_DWORD)v10)
                {
                  v28 = 0;
                  v29 = v27;
                  do
                  {
                    for (j = 0; j != 256; j += 4)
                    {
                      v31 = *(__int16 **)(a1 + 3896);
                      v32 = *v31;
                      *(_QWORD *)(a1 + 3896) = v31 + 1;
                      *(_WORD *)(v29 + j) = v32;
                    }
                    ++v28;
                    v29 += 256;
                  }
                  while (v28 != v10);
                }
                ++v26;
                v27 += 768;
              }
              while (v26 != 4);
              ++v24;
              v25 += 3072;
            }
            while (v24 != v9);
          }
          v33 = v8 + v6;
          v34 = *(_QWORD *)(a1 + 3896);
          v35 = v34 - v8;
          v36 = v35 & 3;
          v38 = -v35;
          v37 = v38 < 0;
          v39 = v38 & 3;
          if (v37)
            v40 = v36;
          else
            v40 = -v39;
          if ((_DWORD)v40)
          {
            v34 = v34 - v40 + 4;
            *(_QWORD *)(a1 + 3896) = v34;
          }
          if (v34 == v33)
            return 1;
          v7 = "e: parsing did not consume the full HTMP size";
        }
        else
        {
          v7 = "e: underflow while reading WgTypeA";
        }
      }
      else
      {
        v7 = "e: underflow while reading sizes";
      }
    }
    else
    {
      v7 = "e: underflow while temperature / brightness / emission freq";
    }
    puts(v7);
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_1000141DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unsigned __int8 *v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  _DWORD *v15;
  uint64_t v16;
  _DWORD *v17;
  int v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  _DWORD *v22;
  int v23;
  uint64_t v24;
  _DWORD *v25;
  uint64_t v26;
  _DWORD *v27;
  int v28;
  uint64_t v29;
  _DWORD *v30;
  uint64_t v31;
  _DWORD *v32;
  int v33;
  uint64_t v34;
  _DWORD *v35;
  uint64_t v36;
  _DWORD *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  if (*(_DWORD *)(a2 + 4) != 0x10000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  v2 = *(_QWORD *)(a1 + 2840);
  if (*(_DWORD *)v2 != 4)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  v3 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v3 <= 6)
  {
    v4 = "e: underflow while reading limits";
LABEL_46:
    puts(v4);
    return 0;
  }
  v5 = *(_QWORD *)(a1 + 3896);
  v6 = *(unsigned __int16 *)(v2 + 20116);
  v7 = *(unsigned __int16 *)(v2 + 20118);
  v9 = *(unsigned int *)(v2 + 20092);
  v8 = *(unsigned int *)(v2 + 20096);
  *(_WORD *)(v2 + 20084) = *(_WORD *)v5;
  *(_QWORD *)(a1 + 3896) = v5 + 6;
  v10 = *(_BYTE *)(v5 + 6);
  v11 = (unsigned __int8 *)(v5 + 7);
  *(_QWORD *)(a1 + 3896) = v5 + 7;
  *(_BYTE *)(v2 + 20086) = v10;
  v12 = 5 * v9 * (unint64_t)v8 * v6;
  if (v3 - 7 < v12)
  {
    v4 = "e: underflow while reading LUT entries";
    goto LABEL_46;
  }
  v13 = (unsigned __int8 *)(v5 + v3);
  if ((_DWORD)v6)
  {
    v14 = 0;
    v15 = (_DWORD *)(v2 + 12416);
    do
    {
      v16 = v8;
      v17 = v15;
      if ((_DWORD)v8)
      {
        do
        {
          v18 = *(_DWORD *)v11;
          v11 += 4;
          *v17 = v18;
          v17 += 128;
          --v16;
        }
        while (v16);
        *(_QWORD *)(a1 + 3896) = v11;
      }
      ++v14;
      ++v15;
    }
    while (v14 != v6);
    v19 = 0;
    v20 = (_DWORD *)(v2 + 13952);
    do
    {
      v21 = v8;
      v22 = v20;
      if ((_DWORD)v8)
      {
        do
        {
          v23 = *v11++;
          *(_QWORD *)(a1 + 3896) = v11;
          *v22 = v23;
          v22 += 128;
          --v21;
        }
        while (v21);
      }
      ++v19;
      ++v20;
    }
    while (v19 != v6);
  }
  if (v13 - v11 < v12)
  {
    v4 = "e: underflow while reading LUT coords";
    goto LABEL_46;
  }
  if ((_DWORD)v6)
  {
    v24 = 0;
    v25 = (_DWORD *)(v2 + 15488);
    do
    {
      v26 = v8;
      v27 = v25;
      if ((_DWORD)v8)
      {
        do
        {
          v28 = *(_DWORD *)v11;
          v11 += 4;
          *v27 = v28;
          v27 += 128;
          --v26;
        }
        while (v26);
        *(_QWORD *)(a1 + 3896) = v11;
      }
      ++v24;
      ++v25;
    }
    while (v24 != v6);
    v29 = 0;
    v30 = (_DWORD *)(v2 + 17024);
    do
    {
      v31 = v8;
      v32 = v30;
      if ((_DWORD)v8)
      {
        do
        {
          v33 = *v11++;
          *(_QWORD *)(a1 + 3896) = v11;
          *v32 = v33;
          v32 += 128;
          --v31;
        }
        while (v31);
      }
      ++v29;
      ++v30;
    }
    while (v29 != v6);
  }
  if (v13 - v11 < 4 * v8 * (unint64_t)v7 * v9)
  {
    v4 = "e: underflow while reading LUT steps";
    goto LABEL_46;
  }
  if ((_DWORD)v7)
  {
    v34 = 0;
    v35 = (_DWORD *)(v2 + 18560);
    do
    {
      v36 = v8;
      v37 = v35;
      if ((_DWORD)v8)
      {
        do
        {
          v38 = *(_DWORD *)v11;
          v11 += 4;
          *v37 = v38;
          v37 += 127;
          --v36;
        }
        while (v36);
        *(_QWORD *)(a1 + 3896) = v11;
      }
      ++v34;
      ++v35;
    }
    while (v34 != v7);
  }
  v39 = (uint64_t)&v11[-v5];
  v40 = v39 & 3;
  v42 = -v39;
  v41 = v42 < 0;
  v43 = v42 & 3;
  if (v41)
    v44 = v40;
  else
    v44 = -v43;
  if ((_DWORD)v44)
  {
    v11 = &v11[-v44 + 4];
    *(_QWORD *)(a1 + 3896) = v11;
  }
  if (v11 != v13)
  {
    v4 = "e: parsing did not consume the full PDCC size";
    goto LABEL_46;
  }
  return 1;
}

uint64_t sub_100014484(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (*(_DWORD *)(a2 + 4) == 327680)
  {
    v2 = *(_DWORD **)(a1 + 2840);
    if (*v2 == 5)
    {
      v3 = (4 * *(_DWORD *)(a2 + 8) - 12);
      if (v3 > 0xB)
      {
        v6 = *(_QWORD *)(a1 + 3896);
        *(_QWORD *)(a1 + 3896) = v6 + 1;
        v7 = *(unsigned __int8 *)(v6 + 1);
        *(_QWORD *)(a1 + 3896) = v6 + 2;
        v8 = *(unsigned __int8 *)(v6 + 2);
        *(_QWORD *)(a1 + 3896) = v6 + 3;
        v9 = *(unsigned __int8 *)(v6 + 3);
        *(_QWORD *)(a1 + 3896) = v6 + 4;
        v10 = *(unsigned __int8 *)(v6 + 4);
        *(_QWORD *)(a1 + 3896) = v6 + 5;
        v11 = *(unsigned __int8 *)(v6 + 5);
        *(_QWORD *)(a1 + 3896) = v6 + 6;
        v12 = *(unsigned __int8 *)(v6 + 6);
        *(_QWORD *)(a1 + 3896) = v6 + 7;
        v13 = *(unsigned __int8 *)(v6 + 7);
        v14 = *(unsigned __int16 *)(v6 + 8);
        v15 = *(unsigned __int16 *)(v6 + 10);
        *(_QWORD *)(a1 + 3896) = v6 + 12;
        if (v11 >= 5)
        {
          printf("e: unsupported region count: %u > %u\n");
          return 0;
        }
        if (v12 >= 2)
        {
          printf("e: unsupported sensor channel count: %u > %u\n");
          return 0;
        }
        if (v13 >= 4)
        {
          printf("e: unsupported color count: %u > %u\n");
          return 0;
        }
        if (v14 >= 0x81)
        {
          printf("e: unsupported gray value count: %u > %u\n");
          return 0;
        }
        if (v15 >= 0x80)
        {
          printf("e: unsupported gray step count: %u > %u\n");
          return 0;
        }
        if (v7 >= 2)
        {
          printf("e: unsupported htmp emission freq count: %u > %u\n");
          return 0;
        }
        if (v8 >= 3)
        {
          printf("e: unsupported benl emission freq count: %u > %u\n");
          return 0;
        }
        if (v9 >= 3)
        {
          printf("e: unsupported pdcc emission freq count: %u > %u\n");
          return 0;
        }
        if (v10 >= 3)
        {
          printf("e: unsupported pdmc emission freq count: %u > %u\n");
          return 0;
        }
        v16 = v2 + 43008;
        v17 = v6 + v3;
        *v16 = v11;
        v16[1] = v12;
        v16[2] = v13;
        *((_WORD *)v16 + 14) = v14;
        *((_WORD *)v16 + 15) = v15;
        *((_BYTE *)v16 + 24) = v8;
        *((_BYTE *)v16 + 25) = v9;
        *((_BYTE *)v16 + 26) = v10;
        *(_WORD *)(a1 + 3888) = 0;
        *(_BYTE *)(a1 + 3890) = 0;
        v18 = *(_QWORD *)(a1 + 3896);
        v19 = v18 - v6;
        v20 = v19 & 3;
        v22 = -v19;
        v21 = v22 < 0;
        v23 = v22 & 3;
        if (v21)
          v24 = v20;
        else
          v24 = -v23;
        if ((_DWORD)v24)
        {
          v18 = v18 - v24 + 4;
          *(_QWORD *)(a1 + 3896) = v18;
        }
        if (v18 == v17)
          return 1;
        v4 = "e: parsing did not consume the full CNST size";
      }
      else
      {
        v4 = "e: cannot read data in CNST";
      }
      puts(v4);
    }
    else
    {
      printf("e: mismatching versions: %u != %u\n");
    }
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_1000146DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  unsigned __int16 *v13;
  const char *v15;
  unint64_t v16;
  unsigned __int16 *v17;
  uint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _WORD *v25;
  uint64_t v26;
  _WORD *v27;
  __int16 v28;
  unint64_t v29;
  int *v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _DWORD *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  if (*(_DWORD *)(a2 + 4) != 0x10000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  if (*(_DWORD *)(a1 + 2832) != 5)
  {
    printf("e: mismatching versions: %u != 5\n");
    return 0;
  }
  v2 = *(_QWORD *)(a1 + 2840);
  v3 = *(unsigned __int8 *)(a1 + 3888);
  if (v3 >= *(unsigned __int8 *)(v2 + 172056))
  {
    printf("e: Too many BENL blocks, expected %u\n");
    return 0;
  }
  v4 = 4 * *(_DWORD *)(a2 + 8);
  v5 = (v4 - 12);
  if (v4 == 12)
  {
    v15 = "e: underflow while temperature / emission_freq / NBBL";
LABEL_59:
    puts(v15);
    return 0;
  }
  v6 = *(_QWORD *)(a1 + 3896);
  v7 = *(unsigned __int16 *)(v2 + 172060);
  v8 = *(unsigned __int16 *)(v2 + 172062);
  v9 = *(unsigned int *)(v2 + 172040);
  v10 = v2 + 16200 * *(unsigned __int8 *)(a1 + 3888) + 12416;
  v11 = *(_WORD *)(v6 + 1);
  *(_QWORD *)(a1 + 3896) = v6 + 3;
  *(_WORD *)v10 = v11;
  v12 = *(unsigned __int8 *)(v6 + 3);
  v13 = (unsigned __int16 *)(v6 + 4);
  *(_QWORD *)(a1 + 3896) = v6 + 4;
  *(_BYTE *)(v10 + 2) = v12;
  if (v12 >= 0x13)
  {
    printf("e: unsupported NBBL: %u > %u\n");
    return 0;
  }
  v16 = v5 - 4;
  if (v5 - 4 < (unint64_t)(2 * v12))
  {
    v15 = "e: underflow while reading bright taps";
    goto LABEL_59;
  }
  v17 = (unsigned __int16 *)(v6 + v5);
  v18 = 2 * v12;
  if (!(_DWORD)v12)
  {
    if (v16 >= v9 * (unint64_t)v7 * v18)
      goto LABEL_29;
LABEL_28:
    v15 = "e: underflow while reading BENL LUT";
    goto LABEL_59;
  }
  v19 = (_DWORD *)(v2 + 16200 * v3 + 12419);
  v20 = v12;
  do
  {
    v21 = *v13++;
    *v19++ = v21 << 16;
    v16 -= 2;
    --v20;
  }
  while (v20);
  *(_QWORD *)(a1 + 3896) = v13;
  if (v16 < v9 * (unint64_t)v7 * v18)
    goto LABEL_28;
  v22 = 0;
  v23 = v2 + 16200 * v3 + 14792;
  do
  {
    if ((_DWORD)v7)
    {
      v24 = 0;
      v25 = (_WORD *)v23;
      do
      {
        v26 = v9;
        v27 = v25;
        if ((_DWORD)v9)
        {
          do
          {
            v28 = *v13++;
            *v27 = v28;
            v27 += 128;
            --v26;
          }
          while (v26);
          *(_QWORD *)(a1 + 3896) = v13;
        }
        ++v24;
        ++v25;
      }
      while (v24 != v7);
    }
    ++v22;
    v23 += 768;
  }
  while (v22 != v12);
  v16 = (char *)v17 - (char *)v13;
LABEL_29:
  if (v16 < 2 * v7 * (unint64_t)v9)
  {
    v15 = "e: underflow while reading BENL coords";
    goto LABEL_59;
  }
  if ((_DWORD)v7)
  {
    v29 = 0;
    do
    {
      if ((_DWORD)v9)
      {
        v30 = (int *)(v2 + 16200 * v3 + 12496 + 4 * (v29 >> 1));
        if ((v29 & 1) != 0)
          v31 = -268369921;
        else
          v31 = -4096;
        v32 = v9;
        do
        {
          v33 = *v13++;
          v34 = (v33 & 0xFFF) << 16;
          v35 = v33 & 0xFFF;
          if ((v29 & 1) != 0)
            v35 = v34;
          *v30 = *v30 & v31 | v35;
          v30 += 64;
          --v32;
        }
        while (v32);
        *(_QWORD *)(a1 + 3896) = v13;
      }
      ++v29;
    }
    while ((_DWORD)v29 != (_DWORD)v7);
    v16 = (char *)v17 - (char *)v13;
  }
  if (v16 < 4 * v8 * (unint64_t)v9)
  {
    v15 = "e: underflow while reading BENL steps";
    goto LABEL_59;
  }
  if ((_DWORD)v8)
  {
    v36 = 0;
    v37 = v2 + 16200 * v3 + 13264;
    do
    {
      v38 = v9;
      v39 = (_DWORD *)v37;
      if ((_DWORD)v9)
      {
        do
        {
          v40 = *(_DWORD *)v13;
          v13 += 2;
          *v39 = v40;
          v39 += 127;
          --v38;
        }
        while (v38);
        *(_QWORD *)(a1 + 3896) = v13;
      }
      ++v36;
      v37 += 4;
    }
    while (v36 != v8);
  }
  v41 = (uint64_t)v13 - v6;
  v42 = v41 & 3;
  v44 = -v41;
  v43 = v44 < 0;
  v45 = v44 & 3;
  if (v43)
    v46 = v42;
  else
    v46 = -v45;
  if ((_DWORD)v46)
  {
    v13 = (unsigned __int16 *)((char *)v13 - v46 + 4);
    *(_QWORD *)(a1 + 3896) = v13;
  }
  if (v13 != v17)
  {
    v15 = "e: parsing did not consume the full BENL size";
    goto LABEL_59;
  }
  ++*(_BYTE *)(a1 + 3888);
  return 1;
}

uint64_t sub_100014A14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  const char *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  unint64_t v13;
  unsigned __int8 *v14;
  unint64_t v15;
  _DWORD *v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  unsigned int v33;
  unsigned __int8 *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _DWORD *v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _DWORD *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _DWORD *v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  if (*(_DWORD *)(a2 + 4) != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  if (*(_DWORD *)(a1 + 2832) != 5)
  {
    printf("e: mismatching versions: %u != 5\n");
    return 0;
  }
  v2 = *(_QWORD *)(a1 + 2840);
  v3 = *(unsigned __int8 *)(a1 + 3889);
  if (v3 >= *(unsigned __int8 *)(v2 + 172057))
  {
    printf("e: Too many PDCC blocks, expected %u\n");
    return 0;
  }
  v4 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v4 < 7)
  {
    v5 = "e: underflow while temperature / emission_freq / NPCT";
LABEL_6:
    puts(v5);
    return 0;
  }
  v7 = *(_QWORD *)(a1 + 3896);
  v8 = *(unsigned __int16 *)(v2 + 172060);
  v9 = *(unsigned __int16 *)(v2 + 172062);
  v10 = *(unsigned int *)(v2 + 172040);
  v11 = v2 + 47672 * *(unsigned __int8 *)(a1 + 3889) + 44816;
  *(_WORD *)v11 = *(_WORD *)v7;
  v12 = *(_WORD *)(v7 + 4);
  *(_QWORD *)(a1 + 3896) = v7 + 6;
  *(_WORD *)(v11 + 2) = v12;
  v13 = *(unsigned __int8 *)(v7 + 6);
  v14 = (unsigned __int8 *)(v7 + 7);
  *(_QWORD *)(a1 + 3896) = v7 + 7;
  *(_BYTE *)(v11 + 4) = v13;
  if (v13 >= 0xF)
  {
    printf("e: unsupported NPCT: %u > %u\n");
    return 0;
  }
  v15 = v4 - 7;
  if (v4 - 7 < v13)
  {
    v5 = "e: underflow while reading temp taps";
    goto LABEL_6;
  }
  if (!(_DWORD)v13)
  {
    v19 = v10 * (unint64_t)v8;
    if (v15 >= 5 * v19 * v13)
      goto LABEL_37;
LABEL_36:
    v5 = "e: underflow while reading PDCC LUT";
    goto LABEL_6;
  }
  v16 = (_DWORD *)(v2 + 47672 * v3 + 44821);
  v17 = v13;
  do
  {
    v18 = *v14++;
    *(_QWORD *)(a1 + 3896) = v14;
    *v16++ = v18 << 16;
    --v15;
    --v17;
  }
  while (v17);
  v19 = v10 * (unint64_t)v8;
  if (v15 < 5 * v19 * v13)
    goto LABEL_36;
  v20 = 0;
  v21 = v2 + 47672 * v3 + 49480;
  do
  {
    if ((_DWORD)v8)
    {
      v22 = 0;
      v23 = (_QWORD *)v21;
      do
      {
        v24 = v10;
        v25 = v23;
        if ((_DWORD)v10)
        {
          do
          {
            v26 = *(_DWORD *)v14;
            v14 += 4;
            *v25 = v26;
            v25 += 128;
            --v24;
          }
          while (v24);
          *(_QWORD *)(a1 + 3896) = v14;
        }
        ++v22;
        ++v23;
      }
      while (v22 != v8);
    }
    ++v20;
    v21 += 3072;
  }
  while (v20 != v13);
  v27 = 0;
  v28 = v2 + 47672 * v3 + 49480;
  do
  {
    if ((_DWORD)v8)
    {
      v29 = 0;
      v30 = (_QWORD *)v28;
      do
      {
        v31 = v10;
        v32 = v30;
        if ((_DWORD)v10)
        {
          do
          {
            v33 = *v14++;
            *(_QWORD *)(a1 + 3896) = v14;
            *v32 |= (unint64_t)v33 << 32;
            v32 += 128;
            --v31;
          }
          while (v31);
        }
        ++v29;
        ++v30;
      }
      while (v29 != v8);
    }
    ++v27;
    v28 += 3072;
  }
  while (v27 != v13);
LABEL_37:
  v34 = (unsigned __int8 *)(v7 + v4);
  v35 = v34 - v14;
  if (v34 - v14 < 4 * v19)
  {
    v5 = "e: underflow while reading PDCC coords LSB";
    goto LABEL_6;
  }
  if (!(_DWORD)v8)
  {
    if (v35 >= v19)
      goto LABEL_53;
LABEL_52:
    v5 = "e: underflow while reading PDCC coords MSB";
    goto LABEL_6;
  }
  v36 = 0;
  v37 = v2 + 47672 * v3 + 44880;
  do
  {
    v38 = v10;
    v39 = (_DWORD *)v37;
    if ((_DWORD)v10)
    {
      do
      {
        v40 = *(_DWORD *)v14;
        v14 += 4;
        *v39 = v40;
        v39 += 128;
        --v38;
      }
      while (v38);
      *(_QWORD *)(a1 + 3896) = v14;
    }
    ++v36;
    v37 += 4;
  }
  while (v36 != v8);
  if (v34 - v14 < v19)
    goto LABEL_52;
  v41 = 0;
  v42 = v2 + 47672 * v3 + 46416;
  do
  {
    v43 = v10;
    v44 = (_DWORD *)v42;
    if ((_DWORD)v10)
    {
      do
      {
        v45 = *v14++;
        *(_QWORD *)(a1 + 3896) = v14;
        *v44 = v45;
        v44 += 128;
        --v43;
      }
      while (v43);
    }
    ++v41;
    v42 += 4;
  }
  while (v41 != v8);
  v35 = v34 - v14;
LABEL_53:
  if (v35 < 4 * v9 * (unint64_t)v10)
  {
    v5 = "e: underflow while reading PDCC steps";
    goto LABEL_6;
  }
  if ((_DWORD)v9)
  {
    v46 = 0;
    v47 = v2 + 47672 * v3 + 47952;
    do
    {
      v48 = v10;
      v49 = (_DWORD *)v47;
      if ((_DWORD)v10)
      {
        do
        {
          v50 = *(_DWORD *)v14;
          v14 += 4;
          *v49 = v50;
          v49 += 127;
          --v48;
        }
        while (v48);
        *(_QWORD *)(a1 + 3896) = v14;
      }
      ++v46;
      v47 += 4;
    }
    while (v46 != v9);
  }
  v51 = (uint64_t)&v14[-v7];
  v52 = v51 & 3;
  v54 = -v51;
  v53 = v54 < 0;
  v55 = v54 & 3;
  if (v53)
    v56 = v52;
  else
    v56 = -v55;
  if ((_DWORD)v56)
  {
    v14 = &v14[-v56 + 4];
    *(_QWORD *)(a1 + 3896) = v14;
  }
  if (v14 != v34)
  {
    v5 = "e: parsing did not consume the full PDCC size";
    goto LABEL_6;
  }
  ++*(_BYTE *)(a1 + 3889);
  return 1;
}

uint64_t sub_100014E04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  const char *v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  unint64_t v12;
  unsigned __int8 *v13;
  unint64_t v14;
  _DWORD *v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  _QWORD *v21;
  unsigned int v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD *v26;
  unsigned int v27;
  unsigned __int8 *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 *v32;
  int v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned __int8 *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  if (*(_DWORD *)(a2 + 4) != 0x10000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  if (*(_DWORD *)(a1 + 2832) != 5)
  {
    printf("e: mismatching versions: %u != 5\n");
    return 0;
  }
  v2 = *(_QWORD *)(a1 + 2840);
  v3 = *(unsigned __int8 *)(a1 + 3890);
  if (v3 >= *(unsigned __int8 *)(v2 + 172058))
  {
    printf("e: Too many PDMC blocks, expected %u\n");
    return 0;
  }
  v4 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v4 < 7)
  {
    v5 = "e: underflow while temperature / emission_freq / NPMT";
LABEL_6:
    puts(v5);
    return 0;
  }
  v7 = *(_QWORD *)(a1 + 3896);
  v8 = *(unsigned __int16 *)(v2 + 172060);
  v9 = *(unsigned __int16 *)(v2 + 172062);
  v10 = v2 + 15936 * *(unsigned __int8 *)(a1 + 3890) + 140160;
  v11 = *(_WORD *)(v7 + 4);
  *(_QWORD *)(a1 + 3896) = v7 + 6;
  *(_WORD *)v10 = v11;
  v12 = *(unsigned __int8 *)(v7 + 6);
  v13 = (unsigned __int8 *)(v7 + 7);
  *(_QWORD *)(a1 + 3896) = v7 + 7;
  *(_BYTE *)(v10 + 2) = v12;
  if (v12 >= 0xF)
  {
    printf("e: unsupported NPMT: %u > %u\n");
    return 0;
  }
  v14 = v4 - 7;
  if (v4 - 7 < v12)
  {
    v5 = "e: underflow while reading temp taps";
    goto LABEL_6;
  }
  if ((_DWORD)v12)
  {
    v15 = (_DWORD *)(v2 + 15936 * v3 + 140163);
    v16 = v12;
    do
    {
      v17 = *v13++;
      *(_QWORD *)(a1 + 3896) = v13;
      *v15++ = v17 << 16;
      --v14;
      --v16;
    }
    while (v16);
    if (v14 < 5 * v8 * (unint64_t)v12)
    {
      v5 = "e: underflow while reading PDMC LUT";
      goto LABEL_6;
    }
    v18 = 0;
    v19 = (_QWORD *)(v2 + 15936 * v3 + 141760);
    do
    {
      v20 = v8;
      v21 = v19;
      if ((_DWORD)v8)
      {
        do
        {
          v22 = *(_DWORD *)v13;
          v13 += 4;
          *v21++ = v22;
          --v20;
        }
        while (v20);
        *(_QWORD *)(a1 + 3896) = v13;
      }
      ++v18;
      v19 += 128;
    }
    while (v18 != v12);
    v23 = 0;
    v24 = (_QWORD *)(v2 + 15936 * v3 + 141760);
    do
    {
      v25 = v8;
      v26 = v24;
      if ((_DWORD)v8)
      {
        do
        {
          v27 = *v13++;
          *(_QWORD *)(a1 + 3896) = v13;
          *v26++ |= (unint64_t)v27 << 32;
          --v25;
        }
        while (v25);
      }
      ++v23;
      v24 += 128;
    }
    while (v23 != v12);
  }
  v28 = (unsigned __int8 *)(v7 + v4);
  v29 = v28 - v13;
  if (v28 - v13 < 4 * v8)
  {
    v5 = "e: underflow while reading PDMC coords LSB";
    goto LABEL_6;
  }
  if (!(_DWORD)v8)
  {
    if (v29 >= v8)
    {
      v32 = v13;
      goto LABEL_43;
    }
LABEL_41:
    v5 = "e: underflow while reading PDMC coords MSB";
    goto LABEL_6;
  }
  v30 = 0;
  do
  {
    *(_DWORD *)(v2 + 15936 * v3 + 140224 + v30) = *(_DWORD *)&v13[v30];
    v30 += 4;
  }
  while (4 * v8 != v30);
  *(_QWORD *)(a1 + 3896) = &v13[v30];
  if (v29 - v30 < v8)
    goto LABEL_41;
  v31 = 0;
  v32 = &v13[v30];
  do
  {
    v33 = v13[v31 + v30];
    *(_QWORD *)(a1 + 3896) = &v13[v30 + 1 + v31];
    *(_DWORD *)(15936 * v3 + 141760 + v2 - 1024 + 4 * v31++) = v33;
    ++v32;
  }
  while (v8 != v31);
  v29 = v28 - v32;
  v13 += v30 + v31;
LABEL_43:
  if (v29 < 4 * v9)
  {
    v5 = "e: underflow while reading PDMC steps";
    goto LABEL_6;
  }
  if ((_DWORD)v9)
  {
    v34 = (unsigned int *)(v2 + 15936 * v3 + 141248);
    v32 = &v13[4 * v9];
    do
    {
      v35 = *(_DWORD *)v13;
      v13 += 4;
      *v34++ = v35;
      --v9;
    }
    while (v9);
    *(_QWORD *)(a1 + 3896) = v13;
  }
  v36 = &v32[-v7];
  v37 = v36 & 3;
  v39 = -(uint64_t)v36;
  v38 = v39 < 0;
  v40 = v39 & 3;
  if (v38)
    v41 = v37;
  else
    v41 = -v40;
  if ((_DWORD)v41)
  {
    v13 = &v13[-v41 + 4];
    *(_QWORD *)(a1 + 3896) = v13;
  }
  if (v13 != v28)
  {
    v5 = "e: parsing did not consume the full PDMC size";
    goto LABEL_6;
  }
  ++*(_BYTE *)(a1 + 3890);
  return 1;
}

uint64_t sub_100015178(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  int v16;
  int v17;
  __int16 v18;
  BOOL v19;
  int v20;
  BOOL v21;
  int v23;
  int v24;

  if (*(_DWORD *)(a2 + 4) == 393216)
  {
    v3 = *(_QWORD *)(a1 + 2840);
    if (*(_DWORD *)v3 == 6)
    {
      printf("i: Processing CNST version 0x%x\n", 393216);
      if ((4 * *(_DWORD *)(a2 + 8) - 12) > 0x13)
      {
        v6 = *(_QWORD *)(a1 + 3896);
        v7 = *(unsigned __int16 *)(v6 + 2);
        *(_QWORD *)(a1 + 3896) = v6 + 4;
        v8 = *(unsigned __int8 *)(v6 + 4);
        *(_QWORD *)(a1 + 3896) = v6 + 5;
        v9 = *(unsigned __int8 *)(v6 + 5);
        *(_QWORD *)(a1 + 3896) = v6 + 6;
        v10 = *(unsigned __int8 *)(v6 + 6);
        *(_QWORD *)(a1 + 3896) = v6 + 7;
        v11 = *(unsigned __int8 *)(v6 + 7);
        *(_QWORD *)(a1 + 3896) = v6 + 8;
        v12 = *(unsigned __int8 *)(v6 + 8);
        *(_QWORD *)(a1 + 3896) = v6 + 9;
        if (v7 < 0x79)
        {
          if (v8 < 3)
          {
            if (v9 < 0x25)
            {
              if (v10 < 6)
              {
                if (v11 < 0x25)
                {
                  if (v12 < 6)
                  {
                    v13 = *(unsigned __int8 *)(v6 + 9);
                    *(_QWORD *)(a1 + 3896) = v6 + 10;
                    if (v13 < 5)
                    {
                      v14 = *(unsigned __int8 *)(v6 + 10);
                      *(_QWORD *)(a1 + 3896) = v6 + 11;
                      if (v14 < 7)
                      {
                        v15 = *(unsigned __int8 *)(v6 + 11);
                        *(_QWORD *)(a1 + 3896) = v6 + 12;
                        v16 = *(unsigned __int8 *)(v6 + 12);
                        *(_QWORD *)(a1 + 3896) = v6 + 13;
                        v17 = *(unsigned __int8 *)(v6 + 13);
                        *(_QWORD *)(a1 + 3896) = v6 + 14;
                        v18 = *(unsigned __int8 *)(v6 + 14);
                        *(_QWORD *)(a1 + 3896) = v6 + 15;
                        *(_DWORD *)(v3 + 1876064) = v13;
                        *(_DWORD *)(v3 + 1876068) = v14;
                        *(_DWORD *)(v3 + 1876072) = v15;
                        *(_DWORD *)(v3 + 1876076) = v10;
                        *(_DWORD *)(v3 + 1876080) = v9;
                        *(_WORD *)(v3 + 1876106) = v12;
                        *(_WORD *)(v3 + 1876108) = v11;
                        *(_DWORD *)(v3 + 1876088) = v17;
                        *(_DWORD *)(v3 + 1876092) = v16;
                        *(_DWORD *)(v3 + 1876096) = v8;
                        *(_DWORD *)(v3 + 1876100) = v7;
                        *(_WORD *)(v3 + 1876104) = v18;
                        if (v7)
                          v19 = v8 == 0;
                        else
                          v19 = 1;
                        v20 = !v19;
                        if (v10)
                          v21 = v9 == 0;
                        else
                          v21 = 1;
                        v23 = !v21 && v12 != 0;
                        if ((v23 & (v11 != 0)) != 0)
                          v24 = 2;
                        else
                          v24 = 0;
                        *(_DWORD *)(v3 + 1876112) = v24 | v20 | *(_DWORD *)(v3 + 1876112) & 0xFFFFFFFC;
                        if (v20 && v23 && v11)
                          operator new();
                        printf("e: missing EMMP (T%d B%d) or gray scales (sync T%d B%d async T%d B%d)\n");
                      }
                      else
                      {
                        printf("e: unsupported sensor channel count: %u > %u\n");
                      }
                    }
                    else
                    {
                      printf("e: unsupported region count: %u > %u\n");
                    }
                  }
                  else
                  {
                    printf("e: unsupported async PCS temperature count: %u > %u\n");
                  }
                }
                else
                {
                  printf("e: unsupported async PCS brightness count: %u > %u\n");
                }
              }
              else
              {
                printf("e: unsupported sync PCS temperature count: %u > %u\n");
              }
            }
            else
            {
              printf("e: unsupported sync PCS brightness count: %u > %u\n");
            }
          }
          else
          {
            printf("e: unsupported EMMP ACSS temperature count: %u > %u\n");
          }
        }
        else
        {
          printf("e: unsupported EMMP ACSS brightness count: %u > %u\n");
        }
      }
      else
      {
        printf("e: unexpected size for CNST %u < %u\n");
      }
    }
    else
    {
      printf("e: mismatching versions: %u != %u\n");
    }
  }
  else
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
  }
  return 0;
}

uint64_t sub_100015524(uint64_t a1, uint64_t a2)
{
  _DWORD *v3;
  char *v5;
  unsigned int *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  __int16 v13;
  unint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  float *v17;
  uint64_t v18;
  float *v19;
  unint64_t v20;
  const char *v21;
  void **v22;
  void **p_src;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  void *__src;

  if (*(_DWORD *)(a2 + 4) == 0x20000)
  {
    v3 = *(_DWORD **)(a1 + 2840);
    if (*v3 != 6)
    {
      printf("e: mismatching versions: %u != %u\n");
      return 0;
    }
    v5 = (char *)malloc_type_calloc(1uLL, 0x158uLL, 0x1000040C3D918F4uLL);
    __src = v5;
    if (!v5)
    {
      v21 = "e: out of memory for PCS table";
      goto LABEL_37;
    }
    if (4 * *(_DWORD *)(a2 + 8) == 12)
    {
      v21 = "e: underflow while reading indices";
      goto LABEL_37;
    }
    v6 = v3 + 469016;
    v7 = *(char **)(a1 + 3896);
    v8 = &v7[4 * *(_DWORD *)(a2 + 8) - 12];
    v10 = v6[1];
    v9 = v6[2];
    v11 = *v6;
    v12 = *v7;
    *(_QWORD *)(a1 + 3896) = v7 + 1;
    v5[338] = v7[1];
    v13 = *((_WORD *)v7 + 1);
    v14 = (unint64_t *)(v7 + 4);
    *(_QWORD *)(a1 + 3896) = v7 + 4;
    *((_WORD *)v5 + 168) = v13;
    if ((_DWORD)v9)
    {
      v15 = 0;
      while (v8 - (char *)v14 >= 4 * (unint64_t)(v10 * v11))
      {
        if ((_DWORD)v11)
        {
          v16 = 0;
          v17 = (float *)v5;
          do
          {
            v18 = v10;
            v19 = v17;
            if ((_DWORD)v10)
            {
              do
              {
                v20 = *v14++;
                *v19++ = (float)v20 * 1.4552e-11;
                --v18;
              }
              while (v18);
              *(_QWORD *)(a1 + 3896) = v14;
            }
            ++v16;
            v17 += 7;
          }
          while (v16 != v11);
        }
        ++v15;
        v5 += 112;
        if (v15 == v9)
          goto LABEL_15;
      }
      v21 = "e: underflow while reading PCS scales";
      goto LABEL_37;
    }
LABEL_15:
    if (v8 - (char *)v14 < 36)
    {
      v21 = "e: underflow while reading PCS spare";
LABEL_37:
      puts(v21);
      return 0;
    }
    *(_QWORD *)(a1 + 3896) = (char *)v14 + 36;
    if ((v12 & 1) != 0)
    {
      sub_100015B54(*(void ***)(a1 + 3848), &__src);
      if ((v12 & 2) != 0)
      {
        v24 = malloc_type_calloc(1uLL, 0x158uLL, 0x1000040C3D918F4uLL);
        v28 = v24;
        if (!v24)
        {
          v21 = "e: out of memory for PCS table copy";
          goto LABEL_37;
        }
        memcpy(v24, __src, 0x158uLL);
        v22 = *(void ***)(a1 + 3856);
        p_src = &v28;
        goto LABEL_29;
      }
    }
    else if ((v12 & 2) != 0)
    {
      v22 = *(void ***)(a1 + 3856);
      p_src = &__src;
LABEL_29:
      sub_100015B54(v22, p_src);
    }
    v25 = *(_QWORD *)(a1 + 3896);
    if ((uint64_t)&v7[-v25] >= 0)
      v26 = -(uint64_t)((unint64_t)&v7[-v25] & 3);
    else
      v26 = (v25 - (_QWORD)v7) & 3;
    if ((_DWORD)v26)
    {
      v25 = v25 - v26 + 4;
      *(_QWORD *)(a1 + 3896) = v25;
    }
    if ((char *)v25 == v8)
      return 1;
    v21 = "e: parsing did not consume the full PCS size";
    goto LABEL_37;
  }
  printf("e: unsupported version: 0x%x != 0x%x\n");
  return 0;
}

uint64_t sub_10001577C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE *v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int16 *v22;
  uint64_t v23;
  _WORD *v24;
  int v25;
  __int16 *v26;
  __int16 v27;
  uint64_t v28;
  _DWORD *v29;
  int v30;
  int *v31;
  int v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;

  if (*(_DWORD *)(a2 + 4) != 0x20000)
  {
    printf("e: unsupported version: 0x%x != 0x%x\n");
    return 0;
  }
  v3 = *(_QWORD *)(a1 + 2840);
  if (*(_DWORD *)v3 != 6)
  {
    printf("e: mismatching versions: %u != %u\n");
    return 0;
  }
  v5 = malloc_type_calloc(1uLL, 0x1984uLL, 0x100004099D89073uLL);
  v40 = v5;
  if (!v5)
  {
    v8 = "e: out of memory for EMMP table";
LABEL_10:
    puts(v8);
    return 0;
  }
  v6 = *(unsigned int *)(v3 + 1876072);
  if (v6 >= 4)
  {
    printf("e: too many EM color channels %d\n");
    return 0;
  }
  v9 = *(unsigned int *)(v3 + 1876092);
  if (v9 >= 0x11)
  {
    printf("e: too many EM gray levels %d\n");
    return 0;
  }
  v10 = *(unsigned __int16 *)(v3 + 1876104);
  if (v10 >= 0x11)
  {
    printf("e: too many EM scale intervals %d\n");
    return 0;
  }
  v11 = *(unsigned int *)(v3 + 1876088);
  if (v11 >= 0x41)
  {
    printf("e: too many EM lines %d\n");
    return 0;
  }
  v12 = (4 * *(_DWORD *)(a2 + 8) - 12);
  if (v12 < (2 * ((int)v9 + (int)v9 * (int)v11 + (int)v10) + 4 * ((int)v9 - 1) + 2) * (int)v6 + 3)
  {
    printf("e: provided data size smaller than expected %d < %d\n");
    return 0;
  }
  v13 = *(_QWORD *)(a1 + 3896);
  v14 = v13 + v12;
  v5[6526] = *(_BYTE *)v13;
  v15 = v13 + 3;
  *((_WORD *)v5 + 3262) = *(_WORD *)(v13 + 1);
  if ((_DWORD)v6)
  {
    v16 = 0;
    v17 = 2 * v10;
    v18 = v5 + 8;
    do
    {
      if ((_DWORD)v10)
      {
        v19 = 0;
        do
        {
          *(_WORD *)&v18[v19] = *(_WORD *)(v15 + v19);
          v19 += 2;
        }
        while ((_DWORD)v17 != (_DWORD)v19);
      }
      v15 += v17;
      ++v16;
      v18 += 32;
    }
    while (v16 != v6);
    v20 = 0;
    do
    {
      *(_WORD *)&v5[2 * v20] = *(_WORD *)(v15 + 2 * v20);
      ++v20;
    }
    while ((_DWORD)v6 != (_DWORD)v20);
    v21 = 0;
    v22 = (__int16 *)(v15 + 2 * v6);
    *(_QWORD *)(a1 + 3896) = v22;
    v23 = 2 * v9;
    do
    {
      if ((_DWORD)v9)
      {
        v24 = &v5[32 * v21 + 104];
        v25 = v9;
        v26 = v22;
        do
        {
          v27 = *v26++;
          *v24++ = v27;
          --v25;
        }
        while (v25);
      }
      v22 = (__int16 *)((char *)v22 + v23);
      ++v21;
    }
    while (v21 != v6);
    v28 = 0;
    *(_QWORD *)(a1 + 3896) = v22;
    do
    {
      if ((_DWORD)v9 != 1)
      {
        v29 = &v5[60 * v28 + 200];
        v30 = v9 - 1;
        v31 = (int *)v22;
        do
        {
          v32 = *v31++;
          *v29++ = v32;
          --v30;
        }
        while (v30);
      }
      v22 += 2 * (v9 - 1);
      ++v28;
    }
    while (v28 != v6);
    v33 = 0;
    *(_QWORD *)(a1 + 3896) = v22;
    v34 = v5 + 380;
    do
    {
      if ((_DWORD)v11)
      {
        v35 = 0;
        v36 = v34;
        do
        {
          if ((_DWORD)v9)
          {
            v37 = 0;
            do
            {
              *(_WORD *)&v36[2 * v37] = v22[v37];
              ++v37;
            }
            while ((_DWORD)v9 != (_DWORD)v37);
          }
          v22 = (__int16 *)((char *)v22 + v23);
          ++v35;
          v36 += 32;
        }
        while (v35 != v11);
        *(_QWORD *)(a1 + 3896) = v22;
      }
      ++v33;
      v34 += 2048;
    }
    while (v33 != v6);
  }
  else
  {
    v22 = (__int16 *)(v15 + 2 * v6);
    *(_QWORD *)(a1 + 3896) = v22;
  }
  if (v14 - (uint64_t)v22 < 6)
  {
    v8 = "e: underflow while reading EMMP spare";
    goto LABEL_10;
  }
  *(_QWORD *)(a1 + 3896) = v22 + 3;
  sub_100015B54(*(void ***)(a1 + 3880), &v40);
  v38 = *(_QWORD *)(a1 + 3896);
  if (v13 - v38 >= 0)
    v39 = -((v13 - v38) & 3);
  else
    v39 = (v38 - v13) & 3;
  if ((_DWORD)v39)
  {
    v38 = v38 - v39 + 4;
    *(_QWORD *)(a1 + 3896) = v38;
  }
  if (v38 != v14)
  {
    v8 = "e: parsing did not consume the full EMMP size";
    goto LABEL_10;
  }
  return 1;
}

void sub_100015AC0(void **a1, unint64_t a2)
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
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      sub_100008578();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_10001A0D0(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_100015B54(void **a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = (unint64_t)a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    v9 = ((char *)v7 - (_BYTE *)*a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      sub_100008578();
    v10 = v5 - (_QWORD)*a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
      v13 = (char *)sub_10001A0D0(v4, v12);
    else
      v13 = 0;
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = *a2;
    v8 = v14 + 8;
    v17 = (char *)*a1;
    v16 = (char *)a1[1];
    if (v16 != *a1)
    {
      do
      {
        v18 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *((_QWORD *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      v16 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v8;
    a1[2] = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *v7 = *a2;
    v8 = v7 + 1;
  }
  a1[1] = v8;
}

uint64_t sub_100015C30(uint64_t a1)
{
  _DWORD *v2;
  BOOL v3;
  _QWORD *v5;
  unsigned int v6;

  v2 = *(_DWORD **)(a1 + 2848);
  if ((*(unsigned int (**)(const __CFString *, _QWORD))(a1 + 8))(CFSTR("ALSSSupported"), *(_QWORD *)(a1 + 16)))
  {
    v3 = v2 == 0;
  }
  else
  {
    v3 = 1;
  }
  if (v3)
    return 1;
  if (*v2 == 1)
  {
    v5 = *(_QWORD **)(a1 + 3872);
    if (v5)
      LODWORD(v5) = 16 * (*(_QWORD *)(*(_QWORD *)(a1 + 3872) + 8) != *v5);
    v6 = *(_WORD *)(a1 + 24) & 0xFFEF | v5;
    *(_WORD *)(a1 + 24) = v6;
  }
  else
  {
    v6 = *(unsigned __int16 *)(a1 + 24);
  }
  return (v6 >> 4) & 1;
}

uint64_t sub_100015CB4(uint64_t a1)
{
  uint64_t result;

  if (!(*(unsigned int (**)(const __CFString *, _QWORD))(a1 + 8))(CFSTR("ACSSSupported"), *(_QWORD *)(a1 + 16)))return 1;
  result = 1;
  switch(*(_DWORD *)(a1 + 2832))
  {
    case 0:
      return result;
    case 1:
      result = sub_100015DA8(a1);
      break;
    case 2:
      result = sub_100015E40(a1);
      break;
    case 3:
      result = sub_100015E9C(a1);
      break;
    case 4:
      result = sub_100015F2C(a1);
      break;
    case 5:
      result = sub_100015FA0(a1);
      break;
    case 6:
      result = sub_100016044(a1);
      break;
    default:
      printf("e: invalid acss_config version %u\n", *(_DWORD *)(a1 + 2832));
      result = 0;
      break;
  }
  return result;
}

unint64_t sub_100015DA8(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 3832);
  if (!v1)
    goto LABEL_12;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 3832) + 8) == *(_QWORD *)v1)
    goto LABEL_11;
  v1 = *(_QWORD *)(a1 + 3824);
  if (!v1)
  {
LABEL_12:
    LOWORD(v2) = 0;
    goto LABEL_13;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 3824) + 8) == *(_QWORD *)v1)
  {
LABEL_11:
    v1 = 0;
    goto LABEL_12;
  }
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 2327536);
  if (v2
    && (v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 2327540)) != 0
    && (v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 2327544)) != 0
    && (v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 2327556)) != 0
    && (v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 2327560)) != 0)
  {
    v1 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 2327564) != 0;
    LOWORD(v2) = 8 * v1;
  }
  else
  {
    v1 = 0;
  }
LABEL_13:
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | v2;
  return v1;
}

BOOL sub_100015E40(uint64_t a1)
{
  _DWORD *v1;
  int v2;
  _BOOL8 v3;

  v1 = *(_DWORD **)(a1 + 2840);
  if (*v1 == 2)
  {
    v2 = v1[3104];
    if (v2 && (v2 = v1[3105]) != 0)
    {
      v3 = v1[3106] != 0;
      LOWORD(v2) = 8 * v3;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
    LOWORD(v2) = 0;
  }
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | v2;
  return v3;
}

unint64_t sub_100015E9C(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 3864);
  if (!v1)
    goto LABEL_11;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 3864) + 8) == *(_QWORD *)v1)
    goto LABEL_10;
  v1 = *(_QWORD *)(a1 + 3840);
  if (!v1)
  {
LABEL_11:
    LOWORD(v2) = 0;
    goto LABEL_12;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 3840) + 8) == *(_QWORD *)v1)
  {
LABEL_10:
    v1 = 0;
    goto LABEL_11;
  }
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 1918576);
  if (v2
    && (v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 1918580)) != 0
    && (v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 1918584)) != 0
    && (v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 1918600)) != 0)
  {
    v1 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 1918604) != 0;
    LOWORD(v2) = 8 * v1;
  }
  else
  {
    v1 = 0;
  }
LABEL_12:
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | v2;
  return v1;
}

BOOL sub_100015F2C(uint64_t a1)
{
  _DWORD *v1;
  _DWORD *v2;
  int v3;
  _BOOL8 v4;

  v1 = *(_DWORD **)(a1 + 2840);
  if (*v1 == 4)
  {
    v2 = v1 + 5022;
    v3 = *v2;
    if (*v2 && (v3 = v2[1]) != 0 && (v3 = v2[2]) != 0 && (LOWORD(v3) = *((_WORD *)v2 + 14), (_WORD)v3))
    {
      v4 = *((unsigned __int16 *)v2 + 15) != 0;
      LOWORD(v3) = 8 * v4;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
    LOWORD(v3) = 0;
  }
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | v3;
  return v4;
}

BOOL sub_100015FA0(uint64_t a1)
{
  _DWORD *v1;
  _DWORD *v2;
  int v3;
  BOOL v4;

  v1 = *(_DWORD **)(a1 + 2840);
  if (*v1 != 5)
    goto LABEL_12;
  v2 = v1 + 43008;
  v3 = *v2;
  if (!*v2
    || (v3 = v2[1]) == 0
    || (v3 = v2[2]) == 0
    || (LOWORD(v3) = *((_WORD *)v2 + 14), !(_WORD)v3)
    || (LOWORD(v3) = *((_WORD *)v2 + 15), !(_WORD)v3))
  {
    v4 = 0;
    goto LABEL_14;
  }
  if (*(unsigned __int8 *)(a1 + 3888) == *((unsigned __int8 *)v2 + 24)
    && *(unsigned __int8 *)(a1 + 3889) == *((unsigned __int8 *)v2 + 25))
  {
    v4 = *(unsigned __int8 *)(a1 + 3890) == *((unsigned __int8 *)v2 + 26);
    if (v4)
      LOWORD(v3) = 8;
    else
      LOWORD(v3) = 0;
  }
  else
  {
LABEL_12:
    v4 = 0;
    LOWORD(v3) = 0;
  }
LABEL_14:
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | v3;
  return v4;
}

unint64_t sub_100016044(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 3880);
  if (!v1)
    goto LABEL_14;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 3880) + 8) == *(_QWORD *)v1)
    goto LABEL_13;
  v1 = *(_QWORD *)(a1 + 3848);
  if (!v1)
    goto LABEL_14;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 3848) + 8) == *(_QWORD *)v1)
  {
LABEL_13:
    v1 = 0;
    goto LABEL_14;
  }
  v1 = *(_QWORD *)(a1 + 3856);
  if (!v1)
  {
LABEL_14:
    LOWORD(v2) = 0;
    goto LABEL_15;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 3856) + 8) == *(_QWORD *)v1)
    goto LABEL_13;
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 1876064);
  if (v2
    && (v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 1876068)) != 0
    && (v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 1876072)) != 0
    && (v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 1876088)) != 0
    && (v2 = *(_DWORD *)(*(_QWORD *)(a1 + 2840) + 1876092)) != 0)
  {
    v1 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 2840) + 1876104) != 0;
    LOWORD(v2) = 8 * v1;
  }
  else
  {
    v1 = 0;
  }
LABEL_15:
  *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFF7 | v2;
  return v1;
}

uint64_t sub_1000160EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  char v26;

  v1 = *(_QWORD *)(a1 + 2848);
  v23 = 1;
  v25 = v1;
  v24 = 1556480;
  v2 = *(uint64_t **)(a1 + 3872);
  if (!v2)
  {
    v19 = "e: EMMP table for ALSS is NULL";
    goto LABEL_35;
  }
  v4 = *v2;
  v5 = (uint64_t *)v2[1];
  v6 = 126 - 2 * __clz(((uint64_t)v5 - *v2) >> 3);
  if (v5 == (uint64_t *)v4)
    v7 = 0;
  else
    v7 = v6;
  sub_10001A104(v4, v5, (uint64_t)&v26, v7, 1);
  v8 = *(uint64_t ***)(a1 + 3872);
  v9 = *v8;
  v10 = v8[1];
  v22 = v1;
  if (*v8 == v10)
  {
    v15 = -1;
    LODWORD(v18) = -1;
LABEL_25:
    if (*(_DWORD *)(v22 + 1545620) != (_DWORD)v18 + 1 || *(_DWORD *)(v22 + 1545624) != v15 + 1)
    {
      printf("e: processed ALSS EMMP dimensions (temp %u, bright %u)mismatch specified values (temp %u, bright %u)\n");
      return 0;
    }
    if (((*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(94, &v23, 20, 0, 0, *(_QWORD *)(a1 + 16)) & 1) != 0)
    {
      puts("i: Set ALSS EM config success");
      return 1;
    }
    v19 = "e: ALSS: set_block_cb_failed";
LABEL_35:
    puts(v19);
    return 0;
  }
  v11 = 0;
  v12 = 0;
  v13 = v1 + 8;
  v14 = 0xFFFFFFFFLL;
  v15 = -1;
  while (1)
  {
    v16 = *(_QWORD **)(a1 + 3872);
    if (v16[1] == *v16)
      sub_10001B374();
    v17 = *v9;
    if (*v9 == *(_QWORD *)*v16)
    {
      v18 = (v14 + 1);
      if ((int)v14 > 0)
        goto LABEL_32;
      v15 = 0;
      v12 = *(char *)(v17 + 6434);
      v11 = *(unsigned __int16 *)(v17 + 6432);
      goto LABEL_21;
    }
    if (v12 == *(char *)(v17 + 6434))
      break;
    v18 = (v14 + 1);
    if ((int)v14 >= 1)
    {
LABEL_32:
      printf("e: ALSS EMMP exceeding max temperature count: %u > %u\n");
      return 0;
    }
    if (v11 == *(unsigned __int16 *)(v17 + 6432))
      v15 = -1;
    else
      v15 = 0;
    v12 = *(char *)(v17 + 6434);
    v11 = *(unsigned __int16 *)(v17 + 6432);
LABEL_21:
    memcpy((void *)(v13 + 772800 * (int)v18 + 6440 * v15), (const void *)v17, 0x1928uLL);
    ++v9;
    v14 = v18;
    if (v9 == v10)
      goto LABEL_25;
  }
  if (v11 == *(unsigned __int16 *)(v17 + 6432))
  {
    v18 = v14;
    goto LABEL_21;
  }
  if (v15 < 119)
  {
    v18 = v14;
    v11 = *(unsigned __int16 *)(v17 + 6432);
    ++v15;
    goto LABEL_21;
  }
  printf("e: ALSS EMMP exceeding max brightness count: %u > %u\n");
  return 0;
}

uint64_t sub_100016344(uint64_t a1)
{
  uint64_t result;

  switch(*(_DWORD *)(a1 + 2832))
  {
    case 1:
      result = sub_1000163E0(a1);
      break;
    case 2:
      result = sub_10001678C(a1);
      break;
    case 3:
      result = sub_100016814(a1);
      break;
    case 4:
      result = sub_100016BD8(a1);
      break;
    case 5:
      result = sub_100016C60(a1);
      break;
    case 6:
      result = sub_100016CF0(a1);
      break;
    default:
      printf("e: invalid acss_config version %u\n", *(_DWORD *)(a1 + 2832));
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_1000163E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  const void ***v8;
  const void **v9;
  const void **v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  const void ***v15;
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t **v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;

  v1 = *(_QWORD *)(a1 + 2840);
  v34 = 1;
  v36 = v1;
  v35 = 2342912;
  v2 = *(uint64_t **)(a1 + 3824);
  if (!v2)
    goto LABEL_46;
  v4 = *v2;
  v5 = (uint64_t *)v2[1];
  v6 = 126 - 2 * __clz(((uint64_t)v5 - *v2) >> 3);
  v7 = v5 == (uint64_t *)v4 ? 0 : v6;
  sub_10001B3FC(v4, v5, (uint64_t)&v33, v7, 1);
  v8 = *(const void ****)(a1 + 3824);
  v9 = *v8;
  v10 = v8[1];
  if (*v8 == v10)
  {
    v12 = 0;
    v11 = 0;
    v14 = -1;
    LODWORD(v17) = -1;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0xFFFFFFFFLL;
    v14 = -1;
    do
    {
      v15 = *(const void ****)(a1 + 3824);
      if (v15[1] == *v15)
        sub_10001B374();
      v16 = (unsigned __int16 *)((char *)*v9 + 10368);
      if (*v9 == **v15)
      {
        v17 = (v13 + 1);
        if ((int)v13 > 3)
          goto LABEL_47;
        v14 = 0;
        v11 = *((char *)*v9 + 10370);
        v12 = *v16;
      }
      else if (v11 == *((char *)*v9 + 10370))
      {
        if (v12 == *v16)
        {
          v17 = v13;
        }
        else
        {
          if (v14 >= 35)
          {
            printf("e: GSC exceeding max brightness count: %u > %u\n");
            return 0;
          }
          v17 = v13;
          v12 = *v16;
          ++v14;
        }
      }
      else
      {
        v17 = (v13 + 1);
        if ((int)v13 >= 4)
        {
LABEL_47:
          printf("e: GSC exceeding max temperature count: %u > %u\n");
          return 0;
        }
        if (v12 == *v16)
          v14 = -1;
        else
          v14 = 0;
        v11 = *((char *)*v9 + 10370);
        v12 = *v16;
      }
      memcpy((void *)(v1 + 373536 * (int)v17 + 10376 * v14 + 319696), *v9++, 0x2888uLL);
      v13 = v17;
    }
    while (v9 != v10);
  }
  *(_DWORD *)(v1 + 2327548) = v17 + 1;
  *(_DWORD *)(v1 + 2327552) = v14 + 1;
  v18 = *(uint64_t **)(a1 + 3832);
  if (!v18)
  {
LABEL_46:
    puts("e: GSC table is NULL");
    return 0;
  }
  v19 = *v18;
  v20 = (uint64_t *)v18[1];
  v21 = 126 - 2 * __clz(((uint64_t)v20 - *v18) >> 3);
  if (v20 == (uint64_t *)v19)
    v22 = 0;
  else
    v22 = v21;
  sub_10001C76C(v19, v20, (uint64_t)&v33, v22, 1);
  v23 = *(uint64_t ***)(a1 + 3832);
  v24 = *v23;
  v25 = v23[1];
  if (*v23 == v25)
  {
    v27 = -1;
    LODWORD(v30) = -1;
LABEL_49:
    *(_DWORD *)(v1 + 2327568) = v30 + 1;
    *(_DWORD *)(v1 + 2327572) = v27 + 1;
    *(_BYTE *)(v1 + 2327595) = *(_BYTE *)(a1 + 3905);
    v33 = *(_DWORD *)(a1 + 2832);
    v31 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, _QWORD))a1)(65, &v34, 20, &v33, 1, *(_QWORD *)(a1 + 16));
    if ((v31 & 1) == 0)
      puts("e: ACSS: set_block_cb failed");
    return v31;
  }
  v26 = 0xFFFFFFFFLL;
  v27 = -1;
  while (1)
  {
    v28 = *(_QWORD **)(a1 + 3832);
    if (v28[1] == *v28)
      sub_10001B374();
    v29 = *v24;
    if (*v24 == *(_QWORD *)*v28)
    {
      v30 = (v26 + 1);
      if ((int)v26 > 0)
        goto LABEL_51;
      v27 = 0;
      v11 = *(char *)(v29 + 578);
      v12 = *(unsigned __int16 *)(v29 + 576);
      goto LABEL_44;
    }
    if (v11 == *(char *)(v29 + 578))
      break;
    v30 = (v26 + 1);
    if ((int)v26 >= 1)
    {
LABEL_51:
      printf("e: EMMK exceeding max temperature count: %u > %u\n");
      return 0;
    }
    if (v12 == *(unsigned __int16 *)(v29 + 576))
      v27 = -1;
    else
      v27 = 0;
    v11 = *(char *)(v29 + 578);
    v12 = *(unsigned __int16 *)(v29 + 576);
LABEL_44:
    memcpy((void *)(v1 + 70080 * (int)v30 + 584 * v27 + 2187376), (const void *)v29, 0x248uLL);
    ++v24;
    v26 = v30;
    if (v24 == v25)
      goto LABEL_49;
  }
  if (v12 == *(unsigned __int16 *)(v29 + 576))
  {
    v30 = v26;
    goto LABEL_44;
  }
  if (v27 < 119)
  {
    v30 = v26;
    v12 = *(unsigned __int16 *)(v29 + 576);
    ++v27;
    goto LABEL_44;
  }
  printf("e: EMMK exceeding max brightness count: %u > %u\n");
  return 0;
}

uint64_t sub_10001678C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 2840);
  v5 = 1;
  v7 = v1;
  v6 = 0x4000;
  *(_BYTE *)(v1 + 14000) = *(_BYTE *)(a1 + 3905);
  v4 = *(_DWORD *)(a1 + 2832);
  v2 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, _QWORD))a1)(65, &v5, 20, &v4, 1, *(_QWORD *)(a1 + 16));
  if ((v2 & 1) == 0)
    puts("e: ACSS: set_block_cb failed");
  return v2;
}

uint64_t sub_100016814(uint64_t a1)
{
  _DWORD *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t *v10;
  int v11;
  int v12;
  _DWORD *v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t **v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _DWORD *v35;
  int v36;
  uint64_t v37;
  int v38;
  _DWORD *v39;

  v1 = *(_DWORD **)(a1 + 2840);
  v37 = 1;
  v39 = v1;
  v38 = 2342912;
  v2 = *(uint64_t **)(a1 + 3840);
  if (!v2)
  {
    v19 = "e: PCS table is NULL";
LABEL_48:
    puts(v19);
    return 0;
  }
  v4 = *v2;
  v5 = (uint64_t *)v2[1];
  v6 = 126 - 2 * __clz(((uint64_t)v5 - *v2) >> 3);
  if (v5 == (uint64_t *)v4)
    v7 = 0;
  else
    v7 = v6;
  sub_10001D944(v4, v5, (uint64_t)&v36, v7, 1);
  v8 = *(uint64_t ***)(a1 + 3840);
  v9 = *v8;
  v10 = v8[1];
  v35 = v1;
  if (*v8 == v10)
  {
    v12 = 0;
    v11 = 0;
    v15 = -1;
    LODWORD(v18) = -1;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = v1 + 79924;
    v14 = 0xFFFFFFFFLL;
    v15 = -1;
    do
    {
      v16 = *(_QWORD **)(a1 + 3840);
      if (v16[1] == *v16)
        sub_10001B374();
      v17 = *v9;
      if (*v9 == *(_QWORD *)*v16)
      {
        v18 = (v14 + 1);
        if ((int)v14 > 3)
          goto LABEL_49;
        v15 = 0;
        v11 = *(char *)(v17 + 290);
        v12 = *(unsigned __int16 *)(v17 + 288);
      }
      else if (v11 == *(char *)(v17 + 290))
      {
        if (v12 == *(unsigned __int16 *)(v17 + 288))
        {
          v18 = v14;
        }
        else
        {
          if (v15 >= 35)
          {
            printf("e: PCS exceeding max brightness count: %u > %u\n");
            return 0;
          }
          v18 = v14;
          v12 = *(unsigned __int16 *)(v17 + 288);
          ++v15;
        }
      }
      else
      {
        v18 = (v14 + 1);
        if ((int)v14 >= 4)
        {
LABEL_49:
          printf("e: PCS exceeding max temperature count: %u > %u\n");
          return 0;
        }
        if (v12 == *(unsigned __int16 *)(v17 + 288))
          v15 = -1;
        else
          v15 = 0;
        v11 = *(char *)(v17 + 290);
        v12 = *(unsigned __int16 *)(v17 + 288);
      }
      memcpy(&v13[2664 * (int)v18 + 74 * v15], (const void *)v17, 0x128uLL);
      ++v9;
      v14 = v18;
    }
    while (v9 != v10);
  }
  v35[479647] = v18 + 1;
  v35[479648] = v15 + 1;
  v20 = *(uint64_t **)(a1 + 3864);
  if (!v20)
  {
    v19 = "e: EMMP table for ACSS is NULL";
    goto LABEL_48;
  }
  v21 = *v20;
  v22 = (uint64_t *)v20[1];
  v23 = 126 - 2 * __clz(((uint64_t)v22 - *v20) >> 3);
  if (v22 == (uint64_t *)v21)
    v24 = 0;
  else
    v24 = v23;
  sub_10001A104(v21, v22, (uint64_t)&v36, v24, 1);
  v25 = *(uint64_t ***)(a1 + 3864);
  v26 = *v25;
  v27 = v25[1];
  if (*v25 == v27)
  {
    v29 = -1;
    LODWORD(v32) = -1;
LABEL_51:
    v35[479652] = v32 + 1;
    v35[479653] = v29 + 1;
    v35[479657] = v35[479657] & 0xFFFFFFFE | *(unsigned __int8 *)(a1 + 3905);
    v36 = *(_DWORD *)(a1 + 2832);
    v33 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, _QWORD))a1)(65, &v37, 20, &v36, 1, *(_QWORD *)(a1 + 16));
    if ((v33 & 1) == 0)
      puts("e: ACSS: set_block_cb failed");
    return v33;
  }
  v28 = 0xFFFFFFFFLL;
  v29 = -1;
  while (1)
  {
    v30 = *(_QWORD **)(a1 + 3864);
    if (v30[1] == *v30)
      sub_10001B374();
    v31 = *v26;
    if (*v26 == *(_QWORD *)*v30)
    {
      v32 = (v28 + 1);
      if ((int)v28 > 0)
        goto LABEL_53;
      v29 = 0;
      v11 = *(char *)(v31 + 6434);
      v12 = *(unsigned __int16 *)(v31 + 6432);
      goto LABEL_45;
    }
    if (v11 == *(char *)(v31 + 6434))
      break;
    v32 = (v28 + 1);
    if ((int)v28 >= 1)
    {
LABEL_53:
      printf("e: ACSS EMMP exceeding max temperature count: %u > %u\n");
      return 0;
    }
    if (v12 == *(unsigned __int16 *)(v31 + 6432))
      v29 = -1;
    else
      v29 = 0;
    v11 = *(char *)(v31 + 6434);
    v12 = *(unsigned __int16 *)(v31 + 6432);
LABEL_45:
    memcpy(&v35[193200 * (int)v32 + 93244 + 1610 * v29], (const void *)v31, 0x1928uLL);
    ++v26;
    v28 = v32;
    if (v26 == v27)
      goto LABEL_51;
  }
  if (v12 == *(unsigned __int16 *)(v31 + 6432))
  {
    v32 = v28;
    goto LABEL_45;
  }
  if (v29 < 119)
  {
    v32 = v28;
    v12 = *(unsigned __int16 *)(v31 + 6432);
    ++v29;
    goto LABEL_45;
  }
  printf("e: ACSS EMMP exceeding max brightness count: %u > %u\n");
  return 0;
}

uint64_t sub_100016BD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 2840);
  v5 = 1;
  v7 = v1;
  v6 = 0x8000;
  *(_BYTE *)(v1 + 20144) = *(_BYTE *)(a1 + 3905);
  v4 = *(_DWORD *)(a1 + 2832);
  v2 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, _QWORD))a1)(65, &v5, 20, &v4, 1, *(_QWORD *)(a1 + 16));
  if ((v2 & 1) == 0)
    puts("e: ACSS: set_block_cb failed");
  return v2;
}

uint64_t sub_100016C60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 2840);
  v5 = 1;
  v7 = v1;
  v6 = 180224;
  *(_BYTE *)(v1 + 172088) = *(_BYTE *)(a1 + 3905);
  v4 = *(_DWORD *)(a1 + 2832);
  v2 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, _QWORD))a1)(65, &v5, 20, &v4, 1, *(_QWORD *)(a1 + 16));
  if ((v2 & 1) == 0)
    puts("e: ACSS: set_block_cb failed");
  return v2;
}

uint64_t sub_100016CF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t **v3;
  uint64_t **v4;
  uint64_t v5;
  const char *v6;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 2840);
  v9 = 1;
  v11 = v2;
  v10 = 1884160;
  v3 = *(uint64_t ***)(a1 + 3848);
  if (!v3 || !*(_QWORD *)(a1 + 3856))
  {
    v6 = "e: PCS tables are NULL";
LABEL_14:
    puts(v6);
    return 0;
  }
  if ((sub_100016E38(v3, v2 + 184544, *(_DWORD *)(v2 + 1876076), *(_DWORD *)(v2 + 1876080)) & 1) == 0)
  {
    v6 = "e: Failed to sort sync PCS tables";
    goto LABEL_14;
  }
  if ((sub_100016E38(*(uint64_t ***)(a1 + 3856), v2 + 246464, *(unsigned __int16 *)(v2 + 1876106), *(unsigned __int16 *)(v2 + 1876108)) & 1) == 0)
  {
    v6 = "e: Failed to sort async PCS tables";
    goto LABEL_14;
  }
  v4 = *(uint64_t ***)(a1 + 3880);
  if (!v4)
  {
    v6 = "e: EMMP table for ACSS is NULL";
    goto LABEL_14;
  }
  if ((sub_100016FE8(v4, v2 + 308384, *(_DWORD *)(v2 + 1876096), *(_DWORD *)(v2 + 1876100)) & 1) == 0)
  {
    v6 = "e: Failed to sort EMMP tables";
    goto LABEL_14;
  }
  *(_DWORD *)(v2 + 1876116) = *(_DWORD *)(v2 + 1876116) & 0xFFFFFFFE | *(unsigned __int8 *)(a1 + 3905);
  v8 = *(_DWORD *)(a1 + 2832);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, _QWORD))a1)(65, &v9, 20, &v8, 1, *(_QWORD *)(a1 + 16));
  if ((v5 & 1) == 0)
    puts("e: ACSS: set_block_cb failed");
  return v5;
}

uint64_t sub_100016E38(uint64_t **a1, uint64_t a2, int a3, int a4)
{
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  char v20;

  v6 = *a1;
  v7 = a1[1];
  v8 = 126 - 2 * __clz(v7 - v6);
  if (v7 == v6)
    v9 = 0;
  else
    v9 = v8;
  sub_10001EB1C((uint64_t)v6, v7, (uint64_t)&v20, v9, 1);
  v10 = *a1;
  v11 = a1[1];
  if (*a1 != v11)
  {
    v12 = 0;
    v13 = 0;
    v14 = -1;
    v15 = -1;
    while (1)
    {
      if (a1[1] == *a1)
        sub_10001B374();
      v16 = *v10;
      if (*v10 == **a1)
      {
        if (++v15 > 4)
        {
LABEL_23:
          printf("e: Vector exceeding max i count: %u > %u\n");
          return 0;
        }
        v14 = 0;
        v13 = *(char *)(v16 + 338);
        v12 = *(unsigned __int16 *)(v16 + 336);
      }
      else
      {
        if (v13 != *(char *)(v16 + 338))
        {
          if (++v15 >= 5)
            goto LABEL_23;
          v14 = -1;
          v13 = *(char *)(v16 + 338);
        }
        if (v12 != *(unsigned __int16 *)(v16 + 336))
        {
          if (++v14 >= 0x24)
          {
            printf("e: Vector exceeding max j count: %u > %u\n");
            return 0;
          }
          v12 = *(unsigned __int16 *)(v16 + 336);
        }
      }
      memcpy((void *)(a2 + 12384 * v15 + 344 * v14), (const void *)v16, 0x158uLL);
      if (++v10 == v11)
        goto LABEL_19;
    }
  }
  v15 = -1;
  v14 = -1;
LABEL_19:
  if (v15 + 1 != a3 || v14 + 1 != a4)
  {
    printf("e: Counted vectors [%d][%d] mismatch expected [%d][%d]\n");
    return 0;
  }
  return 1;
}

uint64_t sub_100016FE8(uint64_t **a1, uint64_t a2, int a3, int a4)
{
  uint64_t *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  char v20;

  v6 = *a1;
  v7 = a1[1];
  v8 = 126 - 2 * __clz(v7 - v6);
  if (v7 == v6)
    v9 = 0;
  else
    v9 = v8;
  sub_10001FCF4((uint64_t)v6, v7, (uint64_t)&v20, v9, 1);
  v10 = *a1;
  v11 = a1[1];
  if (*a1 != v11)
  {
    v12 = 0;
    v13 = 0;
    v14 = -1;
    v15 = -1;
    while (1)
    {
      if (a1[1] == *a1)
        sub_10001B374();
      v16 = *v10;
      if (*v10 == **a1)
      {
        if (++v15 > 1)
        {
LABEL_23:
          printf("e: Vector exceeding max i count: %u > %u\n");
          return 0;
        }
        v14 = 0;
        v13 = *(char *)(v16 + 6526);
        v12 = *(unsigned __int16 *)(v16 + 6524);
      }
      else
      {
        if (v13 != *(char *)(v16 + 6526))
        {
          if (++v15 >= 2)
            goto LABEL_23;
          v14 = -1;
          v13 = *(char *)(v16 + 6526);
        }
        if (v12 != *(unsigned __int16 *)(v16 + 6524))
        {
          if (++v14 >= 0x78)
          {
            printf("e: Vector exceeding max j count: %u > %u\n");
            return 0;
          }
          v12 = *(unsigned __int16 *)(v16 + 6524);
        }
      }
      memcpy((void *)(a2 + 783840 * v15 + 6532 * v14), (const void *)v16, 0x1984uLL);
      if (++v10 == v11)
        goto LABEL_19;
    }
  }
  v15 = -1;
  v14 = -1;
LABEL_19:
  if (v15 + 1 != a3 || v14 + 1 != a4)
  {
    printf("e: Counted vectors [%d][%d] mismatch expected [%d][%d]\n");
    return 0;
  }
  return 1;
}

uint64_t sub_1000171A8(uint64_t a1, int a2, _DWORD *a3, unsigned int *a4)
{
  unsigned int v4;
  uint64_t result;
  unint64_t v6;
  int v7;
  int v8;
  BOOL v9;
  int v10;

  v4 = *a4;
  if (*a4 <= 0xA)
  {
    if (v4)
    {
      v6 = 0;
      v7 = a2;
      while (1)
      {
        v8 = a3[v6];
        if (v8 == a2)
          return 1;
        v9 = v8 <= a2 && v7 == a2;
        v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          v4 = *a4;
          v10 = v8;
        }
        ++v6;
        v7 = v10;
        if (v6 >= v4)
        {
          if (v4 == 10)
            goto LABEL_2;
          if (v10 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100017254(uint64_t a1, unsigned int a2, unsigned int *a3, unsigned int *a4)
{
  unsigned int v4;
  uint64_t result;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;

  v4 = *a4;
  if (*a4 <= 0xA)
  {
    if (v4)
    {
      v6 = 0;
      v7 = a2;
      while (1)
      {
        v8 = a3[v6];
        if (v8 == a2)
          return 1;
        v9 = v8 <= a2 && v7 == a2;
        v10 = a2;
        if (!v9)
        {
          a3[v6] = v7;
          v4 = *a4;
          v10 = v8;
        }
        ++v6;
        v7 = v10;
        if (v6 >= v4)
        {
          if (v4 == 10)
            goto LABEL_2;
          if (v10 > a3[v4 - 1])
          {
            *a4 = v4 + 1;
            a3[v4] = v10;
          }
          return 1;
        }
      }
    }
    else
    {
      result = 1;
      *a4 = 1;
      *a3 = a2;
    }
  }
  else
  {
LABEL_2:
    puts("e: Too many index values for LUT tables");
    return 0;
  }
  return result;
}

uint64_t sub_100017300(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;

  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a1 + 28);
  v2 = a1 + 32;
  if (*(_BYTE *)(a1 + 3906))
    sub_100018F3C(a1, a1 + 32);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))a1)(27, v2, 2096, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v3)
    v4 = "i: set PDC table config succeeded";
  else
    v4 = "e: failed to set PDC table config";
  puts(v4);
  return v3;
}

uint64_t sub_10001737C(uint64_t a1)
{
  int v2;
  uint64_t *v3;
  unsigned int v4;
  void **v5;
  char *v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  void **v11;
  _DWORD *v12;
  char *v13;
  int v14;
  int v15;
  unsigned __int16 *v16;
  unsigned __int16 *v17;
  _WORD *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int16 *v21;
  unsigned __int16 *v22;
  _WORD *v23;
  float v24;
  char v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  double v29;
  char v30;
  unsigned int v31;
  unsigned int v32;
  int v33;
  double v34;
  uint64_t v35;
  uint64_t *v36;
  unsigned int v37;
  _DWORD *v38;
  float v39;
  void **v40;
  uint64_t v41;
  char v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  char v49;
  double v50;
  uint64_t v51;
  uint64_t *v52;
  unsigned int v53;
  _DWORD *v54;
  float v55;
  void **v56;
  uint64_t v57;
  char v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  char v65;
  double v66;
  uint64_t v67;
  void *v68;
  const char *v70;
  void **v71;
  unint64_t v72;
  unint64_t v73;
  void *__dst[435];

  v2 = *(_DWORD *)(a1 + 28);
  v3 = *(uint64_t **)(a1 + 2200);
  memcpy(__dst, &unk_100022258, sizeof(__dst));
  LOWORD(v4) = *(_WORD *)(a1 + 2128);
  printf("i: PDC bin interpolation, bin = %g\n", (float)(*(float *)(a1 + 2132) + (float)v4));
  if (!v3)
  {
LABEL_54:
    puts("i: set PDC LUTs succeeded");
    v67 = 1;
    goto LABEL_55;
  }
  v5 = &__dst[1];
  v6 = (char *)&__dst[217] + 6;
  v7 = 1;
  do
  {
    v72 = 0xAAAAAAAAAAAAAAAALL;
    v73 = 0xAAAAAAAAAAAAAAAALL;
    v9 = *((_DWORD *)v3 + 3);
    v8 = *((_DWORD *)v3 + 4);
    LODWORD(v72) = *((_DWORD *)v3 + 2);
    HIDWORD(v72) = v8;
    v10 = *((_DWORD *)v3 + 6);
    v73 = __PAIR64__(v10, v9);
    if (*(float *)(a1 + 2132) == 0.0)
    {
      v11 = (void **)(v3 + 4);
      goto LABEL_20;
    }
    v12 = sub_100008D8C(a1, v2, (unsigned __int16)(*(_WORD *)(a1 + 2128) + 1), *((_DWORD *)v3 + 2), v8, 0, *((unsigned __int16 *)v3 + 6), v10);
    if (!v12)
    {
      v70 = "e: bin tables do not correlate.";
      goto LABEL_61;
    }
    LODWORD(__dst[0]) = v2;
    switch(v2)
    {
      case 3:
        v35 = 0;
        v36 = v3 + 5;
        v37 = *((unsigned __int16 *)v3 + 1754);
        v38 = v12 + 10;
        if (v37 <= *((unsigned __int16 *)v12 + 1754))
          LOWORD(v37) = *((_WORD *)v12 + 1754);
        WORD2(__dst[434]) = v37;
        v39 = *(float *)(a1 + 2132);
        v40 = v5;
        while (1)
        {
          v41 = 0;
          v42 = 1;
          do
          {
            v43 = (float)((float)*(unsigned __int16 *)((char *)v36 + v41)
                        + (float)(v39
                                * (float)(*(unsigned __int16 *)((char *)v38 + v41)
                                        - *(unsigned __int16 *)((char *)v36 + v41))))
                + 0.5;
            *(_WORD *)((char *)v40 + v41) = (int)v43;
            v42 &= (int)v43 == 0;
            v41 += 2;
          }
          while (v41 != 578);
          if ((v42 & 1) != 0)
            goto LABEL_50;
          ++v35;
          v36 = (uint64_t *)((char *)v36 + 578);
          v38 = (_DWORD *)((char *)v38 + 578);
          v40 = (void **)((char *)v40 + 578);
          if (v35 == 3)
          {
            v44 = 0;
            v45 = (uint64_t)v3 + 1774;
            v46 = (char *)v12 + 1774;
            v47 = v6;
            while (1)
            {
              v48 = 0;
              v49 = 1;
              do
              {
                v50 = (float)((float)*(unsigned __int16 *)(v45 + v48)
                            + (float)(v39 * (float)(*(unsigned __int16 *)&v46[v48] - *(unsigned __int16 *)(v45 + v48))))
                    + 0.5;
                *(_WORD *)&v47[v48] = (int)v50;
                v49 &= (int)v50 == 0;
                v48 += 2;
              }
              while (v48 != 578);
              if ((v49 & 1) != 0)
                break;
              ++v44;
              v45 += 578;
              v46 += 578;
              v47 += 578;
              v11 = __dst;
              if (v44 == 3)
                goto LABEL_20;
            }
LABEL_51:
            printf("e: lerped PMLUT[%d, %d, %d, %d, %d] is all zeros");
            return 0;
          }
        }
      case 4:
        v51 = 0;
        v52 = v3 + 5;
        v53 = *((unsigned __int16 *)v3 + 989);
        v54 = v12 + 10;
        if (v53 <= *((unsigned __int16 *)v12 + 989))
          LOWORD(v53) = *((_WORD *)v12 + 989);
        WORD1(__dst[243]) = v53;
        v55 = *(float *)(a1 + 2132);
        v56 = v5;
        while (1)
        {
          v57 = 0;
          v58 = 1;
          do
          {
            v59 = (float)((float)*(unsigned __int16 *)((char *)v52 + v57)
                        + (float)(v55
                                * (float)(*(unsigned __int16 *)((char *)v54 + v57)
                                        - *(unsigned __int16 *)((char *)v52 + v57))))
                + 0.5;
            *(_WORD *)((char *)v56 + v57) = (int)v59;
            v58 &= (int)v59 == 0;
            v57 += 2;
          }
          while (v57 != 578);
          if ((v58 & 1) != 0)
            break;
          ++v51;
          v52 = (uint64_t *)((char *)v52 + 578);
          v54 = (_DWORD *)((char *)v54 + 578);
          v56 = (void **)((char *)v56 + 578);
          if (v51 == 3)
          {
            v60 = 0;
            v61 = (uint64_t)v3 + 1774;
            v62 = (char *)v12 + 1774;
            v63 = v6;
            while (1)
            {
              v64 = 0;
              v65 = 1;
              do
              {
                v66 = (float)((float)*(unsigned __int16 *)(v61 + v64)
                            + (float)(v55 * (float)(*(unsigned __int16 *)&v62[v64] - *(unsigned __int16 *)(v61 + v64))))
                    + 0.5;
                *(_WORD *)&v63[v64] = (int)v66;
                v65 &= (int)v66 == 0;
                v64 += 2;
              }
              while (v64 != 68);
              if ((v65 & 1) != 0)
                goto LABEL_51;
              ++v60;
              v61 += 68;
              v62 += 68;
              v63 += 68;
              v11 = __dst;
              if (v60 == 3)
                goto LABEL_20;
            }
          }
        }
LABEL_50:
        printf("e: lerped DCLUT[%d, %d, %d, %d, %d] is all zeros");
        return 0;
      case 5:
        v71 = v5;
        v13 = v6;
        LOWORD(__dst[3]) = *(_WORD *)(a1 + 2116);
        v14 = *(unsigned __int16 *)(a1 + 418);
        v15 = *(unsigned __int16 *)(a1 + 420);
        v16 = (unsigned __int16 *)v3[6];
        v17 = (unsigned __int16 *)*((_QWORD *)v12 + 6);
        v18 = __dst[2];
        if (__dst[2]
          || (LODWORD(__dst[1]) = *((_DWORD *)v3 + 10),
              v18 = malloc_type_aligned_alloc(0x4000uLL, LODWORD(__dst[1]), 0x78077284uLL),
              (__dst[2] = v18) != 0))
        {
          v19 = (3 * v14 * v14);
          if (!(_DWORD)v19)
            goto LABEL_62;
          v20 = (3 * v15 * v15);
          v21 = &v16[v19];
          v22 = &v17[v19];
          v23 = &v18[v19];
          v24 = *(float *)(a1 + 2132);
          v25 = 1;
          do
          {
            v27 = *v16++;
            v26 = v27;
            v28 = *v17++;
            v29 = (float)((float)v26 + (float)(v24 * (float)(int)(v28 - v26))) + 0.5;
            *v18++ = (int)v29;
            v25 &= (int)v29 == 0;
            --v19;
          }
          while (v19);
          if ((v25 & 1) != 0)
          {
LABEL_62:
            printf("e: lerped DCLUT[%d, %d, %d, %d] is all zeros");
          }
          else
          {
            v6 = v13;
            v5 = v71;
            if ((_DWORD)v20)
            {
              v30 = 1;
              do
              {
                v32 = *v21++;
                v31 = v32;
                v33 = *v22++;
                v34 = (float)((float)v31 + (float)(v24 * (float)(int)(v33 - v31))) + 0.5;
                *v23++ = (int)v34;
                v30 &= (int)v34 == 0;
                --v20;
              }
              while (v20);
              if ((v30 & 1) == 0)
                break;
            }
            printf("e: lerped PMLUT[%d, %d, %d, %d] is all zeros");
          }
          return 0;
        }
        v70 = "e: no memory to prepare PDC LUTs";
LABEL_61:
        puts(v70);
        return 0;
    }
    v11 = __dst;
LABEL_20:
    v7 &= (*(uint64_t (**)(uint64_t, void **, uint64_t, unint64_t *, uint64_t, _QWORD))a1)(26, v11, 3480, &v72, 4, *(_QWORD *)(a1 + 16));
    if ((v7 & 1) == 0)
      printf("e: failed to set PDC LUT [%d %d %d %d] \n", v72, HIDWORD(v72), v73, HIDWORD(v73));
    v3 = (uint64_t *)*v3;
  }
  while (v3);
  if (v7)
    goto LABEL_54;
  v67 = 0;
LABEL_55:
  if (LODWORD(__dst[0]) == 5)
  {
    v68 = __dst[2];
    if (__dst[2])
    {
      __dst[2] = 0;
      free(v68);
    }
  }
  return v67;
}

uint64_t sub_100017904(uint64_t a1)
{
  uint64_t v1;
  const char *v2;

  *(_DWORD *)(a1 + 2516) = 1;
  v1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))a1)(5, a1 + 2516, 308, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v1)
    v2 = "i: set PRC table config succeeded";
  else
    v2 = "e: failed to set PRC table config";
  puts(v2);
  return v1;
}

uint64_t sub_100017968(uint64_t a1)
{
  uint64_t *v1;
  char v3;
  int v5;
  __int128 v6;

  v1 = *(uint64_t **)(a1 + 2824);
  if (v1)
  {
    v3 = 1;
    do
    {
      *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v5 = 0;
      v6 = *(_OWORD *)(v1 + 1);
      if (((*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, int *, uint64_t, _QWORD))a1)(3, v1 + 3, 1548, &v5, 5, *(_QWORD *)(a1 + 16)) & 1) == 0)
      {
        printf("e: failed to set PRC LUT [t%d s%d b%d p%d]\n", (_DWORD)v6, DWORD1(v6), DWORD2(v6), HIDWORD(v6));
        v3 = 0;
      }
      v1 = (uint64_t *)*v1;
    }
    while (v1);
    if ((v3 & 1) == 0)
      return 0;
  }
  puts("i: set PRC LUTs succeeded");
  return 1;
}

uint64_t sub_100017A5C(uint64_t a1)
{
  uint64_t v1;
  const char *v2;

  v1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))a1)(82, a1 + 2864, 544, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v1)
    v2 = "i: set prox table config succeeded";
  else
    v2 = "e: failed to set prox table config";
  puts(v2);
  return v1;
}

uint64_t sub_100017AB8(uint64_t a1)
{
  int v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  float v9;
  _DWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int16 *v14;
  __int16 *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  __int16 *v20;
  __int16 *v21;
  int v22;
  float v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t *v27;
  __int16 *v28;
  __int16 *v29;
  int v30;
  int v31;
  int v32;
  float v33;
  double v34;
  double v35;
  const char *v36;
  int v37;
  float v38;
  uint64_t *v39;
  _DWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  float *v44;
  float *v45;
  float *v46;
  uint64_t v47;
  float *v48;
  float *v49;
  float *v50;
  float v51;
  float v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float *v57;
  float *v58;
  float *v59;
  uint64_t v60;
  float *v61;
  float *v62;
  float *v63;
  float v64;
  float v65;
  float v66;
  _BYTE v68[4];
  uint64_t v69;
  _BYTE v70[4];
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;

  v2 = *(_DWORD *)(a1 + 2864);
  v3 = *(uint64_t **)(a1 + 3600);
  v4 = *(uint64_t **)(a1 + 3584);
  bzero(v70, 0xC84uLL);
  bzero(v68, 0xA54uLL);
  printf("i: Prox PP LUT bin interpolation, bin = %g\n", (float)(*(float *)(a1 + 3568) + (float)*(unsigned int *)(a1 + 3564)));
  if (v3)
  {
    v5 = 1;
    while (1)
    {
      v6 = *((_DWORD *)v3 + 664);
      v7 = *((_DWORD *)v3 + 665);
      v73 = v6;
      v74 = v7;
      v8 = *((_DWORD *)v3 + 666);
      v75 = v8;
      v9 = *(float *)(a1 + 3568);
      if (v9 == 0.0)
      {
        v10 = v3 + 1;
      }
      else
      {
        v11 = *(uint64_t **)(a1 + 3608);
        if (!v11)
        {
LABEL_29:
          v36 = "e: Prox PP bin tables do no correlate";
LABEL_54:
          puts(v36);
          return 0;
        }
        while (*((_DWORD *)v11 + 664) != v6 || *((_DWORD *)v11 + 665) != v7 || *((_DWORD *)v11 + 666) != v8)
        {
          v11 = (uint64_t *)*v11;
          if (!v11)
            goto LABEL_29;
        }
        v12 = 0;
        v13 = *(unsigned __int16 *)(a1 + 3164);
        v14 = (__int16 *)v3 + 6;
        v15 = (__int16 *)v11 + 6;
        v16 = &v69;
        do
        {
          if ((_DWORD)v13)
          {
            v17 = 0;
            v18 = *(unsigned __int16 *)(a1 + 3162);
            v19 = v16;
            v20 = v15;
            v21 = v14;
            do
            {
              v22 = *((_DWORD *)&v3[10 * v12 + 301] + v17 + 1);
              v23 = (float)v22 + (float)(v9 * (float)(*((_DWORD *)&v11[10 * v12 + 301] + v17 + 1) - v22));
              v24 = v23 + 0.5;
              if (v23 >= 0.0)
                v25 = 0.0;
              else
                v25 = 1.0;
              *(_DWORD *)&v68[80 * v12 + 2404 + 4 * v17] = (int)(v24 - v25);
              v26 = v18;
              v27 = v19;
              v28 = v20;
              v29 = v21;
              if ((_DWORD)v18)
              {
                do
                {
                  v31 = *v29++;
                  v30 = v31;
                  v32 = *v28++;
                  v33 = (float)v30 + (float)(v9 * (float)(v32 - v30));
                  v34 = v33 + 0.5;
                  if (v33 >= 0.0)
                    v35 = 0.0;
                  else
                    v35 = 1.0;
                  *(_WORD *)v27 = (int)(v34 - v35);
                  v27 = (uint64_t *)((char *)v27 + 2);
                  --v26;
                }
                while (v26);
              }
              ++v17;
              v21 += 20;
              v20 += 20;
              v19 += 5;
            }
            while (v17 != v13);
          }
          ++v12;
          v14 += 400;
          v15 += 400;
          v16 += 100;
        }
        while (v12 != 3);
        v10 = v68;
      }
      *v10 = v2;
      v5 &= (*(uint64_t (**)(uint64_t))a1)(84);
      if ((v5 & 1) == 0)
        printf("e: failed to set Prox PP LUT [t %d b %d p %d]\n", v73, v74, v75);
      v3 = (uint64_t *)*v3;
      if (!v3)
        goto LABEL_31;
    }
  }
  v5 = 1;
LABEL_31:
  printf("i: Prox PD LUT bin interpolation, bin = %g\n", (float)(*(float *)(a1 + 3552) + (float)*(unsigned int *)(a1 + 3548)));
  for (; v4; v4 = (uint64_t *)*v4)
  {
    v37 = *((_DWORD *)v4 + 803);
    v73 = v37;
    v38 = *(float *)(a1 + 3552);
    v39 = (uint64_t *)(a1 + 3592);
    if (v38 == 0.0)
    {
      v40 = v4 + 1;
    }
    else
    {
      do
      {
        v39 = (uint64_t *)*v39;
        if (!v39)
        {
          v36 = "e: Prox PD bin tables do no correlate";
          goto LABEL_54;
        }
      }
      while (*((_DWORD *)v39 + 803) != v37);
      v41 = *(unsigned __int16 *)(a1 + 2912);
      if (*(_WORD *)(a1 + 2912))
      {
        v42 = 0;
        v43 = *(unsigned __int16 *)(a1 + 2916);
        v44 = (float *)v4 + 3;
        v45 = (float *)v39 + 3;
        v46 = (float *)&v71;
        do
        {
          v47 = v43;
          v48 = v46;
          v49 = v45;
          v50 = v44;
          if ((_DWORD)v43)
          {
            do
            {
              v51 = *v50++;
              v52 = v51;
              v53 = *v49++;
              *v48++ = v52 + (float)(v38 * (float)(v53 - v52));
              --v47;
            }
            while (v47);
          }
          ++v42;
          v44 += 20;
          v45 += 20;
          v46 += 20;
        }
        while (v42 != v41);
      }
      v54 = *(unsigned __int16 *)(a1 + 2914);
      if (*(_WORD *)(a1 + 2914))
      {
        v55 = 0;
        v56 = *(unsigned __int16 *)(a1 + 2918);
        v57 = (float *)v4 + 403;
        v58 = (float *)v39 + 403;
        v59 = (float *)&v72;
        do
        {
          v60 = v56;
          v61 = v59;
          v62 = v58;
          v63 = v57;
          if ((_DWORD)v56)
          {
            do
            {
              v64 = *v63++;
              v65 = v64;
              v66 = *v62++;
              *v61++ = v65 + (float)(v38 * (float)(v66 - v65));
              --v60;
            }
            while (v60);
          }
          ++v55;
          v57 += 20;
          v58 += 20;
          v59 += 20;
        }
        while (v55 != v54);
      }
      v40 = v70;
    }
    *v40 = v2;
    v5 &= (*(uint64_t (**)(uint64_t))a1)(83);
    if ((v5 & 1) == 0)
      printf("e: failed to set Prox PD LUT [t %d]\n", v73);
  }
  if (v5)
    puts("i: set Prox LUTs succeeded");
  return 1;
}

uint64_t sub_100017F20(uint64_t a1)
{
  uint64_t v1;
  const char *v2;

  v1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))a1)(85, a1 + 3616, 72, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v1)
    v2 = "i: set LLMT table config succeeded";
  else
    v2 = "e: failed to set LLMT table config";
  puts(v2);
  return v1;
}

uint64_t sub_100017F7C(uint64_t a1)
{
  uint64_t v1;
  const char *v2;

  v1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))a1)(111, a1 + 3692, 76, 0, 0, *(_QWORD *)(a1 + 16));
  if ((_DWORD)v1)
    v2 = "i: set PTUC table config succeeded";
  else
    v2 = "e: failed to set PTUC table config";
  puts(v2);
  return v1;
}

uint64_t sub_100017FD8(uint64_t a1)
{
  uint64_t **v1;
  char v3;
  _QWORD v5[3];

  v1 = *(uint64_t ***)(a1 + 3776);
  memset(v5, 0, 20);
  if (v1)
  {
    v3 = 1;
    do
    {
      LODWORD(v5[0]) = 1;
      *(_QWORD *)((char *)&v5[1] + 4) = (char *)v1 + 10;
      LODWORD(v5[1]) = 0x4000;
      BYTE4(v5[0]) = 0;
      if (((*(uint64_t (**)(uint64_t, _QWORD *, uint64_t, _QWORD, _QWORD, _QWORD))a1)(112, v5, 20, 0, 0, *(_QWORD *)(a1 + 16)) & 1) == 0)
      {
        printf("e: failed to set PTUC TLS LUT brightness %d\n", *((unsigned __int16 *)v1 + 4));
        v3 = 0;
      }
      v1 = (uint64_t **)*v1;
    }
    while (v1);
    if ((v3 & 1) == 0)
      return 0;
  }
  puts("i: set PTUC TLS LUTs succeeded");
  return 1;
}

uint64_t sub_1000180A0(uint64_t a1)
{
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  int v11;
  int i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;

  if (!*(_QWORD *)(a1 + 2200))
    return 1;
  *(_WORD *)(a1 + 24) &= ~1u;
  if ((*(_DWORD *)(a1 + 28) - 6) <= 0xFFFFFFFC)
  {
    printf("e: unexpected PDC table version %d\n", *(_DWORD *)(a1 + 28));
    return 0;
  }
  if (*(float *)(a1 + 2132) > 0.0 && !*(_QWORD *)(a1 + 2208))
  {
    v43 = "e: PDC missing bin";
    goto LABEL_114;
  }
  v2 = a1 + 36;
  v3 = a1 + 196;
  v4 = a1 + 276;
  v5 = a1 + 116;
  v6 = 1;
  while (1)
  {
    v7 = v6;
    v8 = v6 & 1;
    if ((v6 & 1) != 0)
      v9 = (uint64_t **)(a1 + 2200);
    else
      v9 = (uint64_t **)(a1 + 2208);
    v10 = *v9;
    if (!v8 && !v10)
    {
LABEL_109:
      v1 = *(_QWORD *)(a1 + 2200) != 0;
      *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFFE | v1;
      return v1;
    }
    v11 = *(_DWORD *)(a1 + 28);
    if (v11 == 3)
    {
      for (i = 0; v10; v10 = (uint64_t *)*v10)
      {
        v22 = *(unsigned __int16 *)(a1 + 246);
        if (*(_WORD *)(a1 + 246))
        {
          v23 = 0;
          while (*(_DWORD *)(v2 + 4 * v23) != *((_DWORD *)v10 + 2))
          {
            if (v22 == ++v23)
              goto LABEL_52;
          }
          LODWORD(v22) = v23;
        }
LABEL_52:
        *((_DWORD *)v10 + 2) = v22;
        v24 = *(unsigned __int16 *)(a1 + 248);
        if (*(_WORD *)(a1 + 248))
        {
          v25 = 0;
          while (*(_DWORD *)(a1 + 76 + 4 * v25) != *((_DWORD *)v10 + 4))
          {
            if (v24 == ++v25)
              goto LABEL_58;
          }
          LODWORD(v24) = v25;
        }
LABEL_58:
        *((_DWORD *)v10 + 4) = v24;
        v26 = *(unsigned __int16 *)(a1 + 254);
        if (*(_WORD *)(a1 + 254))
        {
          v27 = 0;
          while (*((_DWORD *)v10 + 3) != *(unsigned __int16 *)(v5 + 2 * v27))
          {
            if (v26 == ++v27)
              goto LABEL_64;
          }
          LODWORD(v26) = v27;
        }
LABEL_64:
        *((_DWORD *)v10 + 3) = v26;
        v28 = *(unsigned __int16 *)(a1 + 256);
        if (*(_WORD *)(a1 + 256))
        {
          v29 = 0;
          while (*(_DWORD *)(a1 + 136 + 4 * v29) != *((_DWORD *)v10 + 6))
          {
            if (v28 == ++v29)
              goto LABEL_70;
          }
          LODWORD(v28) = v29;
        }
LABEL_70:
        *((_DWORD *)v10 + 6) = v28;
        if (*((_DWORD *)v10 + 5) != 7)
          goto LABEL_110;
        ++i;
      }
      v20 = *(unsigned __int16 *)(a1 + 248) * *(unsigned __int16 *)(a1 + 246) * *(unsigned __int16 *)(a1 + 254);
      v21 = *(unsigned __int16 *)(a1 + 256);
LABEL_73:
      v30 = v20 * v21;
      goto LABEL_107;
    }
    if (v11 == 5)
      break;
    if (v11 == 4)
    {
      i = 0;
      if (v10)
      {
        while (1)
        {
          v13 = *(unsigned __int16 *)(a1 + 350);
          if (*(_WORD *)(a1 + 350))
          {
            v14 = 0;
            while (*(_DWORD *)(v2 + 4 * v14) != *((_DWORD *)v10 + 2))
            {
              if (v13 == ++v14)
                goto LABEL_23;
            }
            LODWORD(v13) = v14;
          }
LABEL_23:
          *((_DWORD *)v10 + 2) = v13;
          v15 = *(unsigned __int16 *)(a1 + 352);
          if (*(_WORD *)(a1 + 352))
          {
            v16 = 0;
            while (*(_DWORD *)(v5 + 4 * v16) != *((_DWORD *)v10 + 4))
            {
              if (v15 == ++v16)
                goto LABEL_29;
            }
            LODWORD(v15) = v16;
          }
LABEL_29:
          *((_DWORD *)v10 + 4) = v15;
          if (*(unsigned __int16 *)(a1 + 358) < 2u)
          {
            LODWORD(j) = 0;
          }
          else
          {
            for (j = 0; j != 20; ++j)
            {
              if (!*(_WORD *)(v3 + 2 * j))
                break;
              if (*((_DWORD *)v10 + 3) == *(unsigned __int16 *)(v3 + 2 * j))
                break;
            }
          }
          *((_DWORD *)v10 + 3) = j;
          v18 = *(unsigned __int16 *)(a1 + 360);
          if (*(_WORD *)(a1 + 360))
          {
            v19 = 0;
            while (*((_DWORD *)v10 + 6) != *(unsigned __int16 *)(v4 + 2 * v19))
            {
              if (v18 == ++v19)
                goto LABEL_42;
            }
            LODWORD(v18) = v19;
          }
LABEL_42:
          *((_DWORD *)v10 + 6) = v18;
          if (*((_DWORD *)v10 + 5) != 7)
            break;
          ++i;
          v10 = (uint64_t *)*v10;
          if (!v10)
            goto LABEL_44;
        }
LABEL_110:
        v43 = "e: PDC missing at least 1 channel";
        goto LABEL_114;
      }
LABEL_44:
      v20 = *(unsigned __int16 *)(a1 + 352) * *(unsigned __int16 *)(a1 + 350) * *(unsigned __int16 *)(a1 + 358);
      v21 = *(unsigned __int16 *)(a1 + 360);
      goto LABEL_73;
    }
LABEL_108:
    v6 = 0;
    if ((v7 & 1) == 0)
      goto LABEL_109;
  }
  v31 = *(unsigned __int16 *)(a1 + 414);
  if (v31 != *(unsigned __int16 *)(a1 + 2188)
    || (v32 = *(unsigned __int16 *)(a1 + 422), v32 != *(unsigned __int16 *)(a1 + 2190))
    || (v33 = *(unsigned __int16 *)(a1 + 416), v33 != *(unsigned __int16 *)(a1 + 2192))
    || (v34 = *(unsigned __int16 *)(a1 + 426), v34 != *(unsigned __int16 *)(a1 + 2196)))
  {
    v43 = "e: reported PDC tap points (temp/DBV/RR/HGOD status) mismatch actual counts";
    goto LABEL_114;
  }
  i = 0;
  if (v10)
  {
    while (1)
    {
      v35 = *(unsigned __int16 *)(a1 + 414);
      if (*(_WORD *)(a1 + 414))
      {
        v36 = 0;
        while (*(_DWORD *)(v2 + 4 * v36) != *((_DWORD *)v10 + 2))
        {
          if (v35 == ++v36)
            goto LABEL_85;
        }
        LODWORD(v35) = v36;
      }
LABEL_85:
      *((_DWORD *)v10 + 2) = v35;
      v37 = *(unsigned __int16 *)(a1 + 416);
      if (*(_WORD *)(a1 + 416))
      {
        v38 = 0;
        while (*(_DWORD *)(v5 + 4 * v38) != *((_DWORD *)v10 + 4))
        {
          if (v37 == ++v38)
            goto LABEL_91;
        }
        LODWORD(v37) = v38;
      }
LABEL_91:
      *((_DWORD *)v10 + 4) = v37;
      v39 = *(unsigned __int16 *)(a1 + 424);
      if (*(_WORD *)(a1 + 424))
      {
        v40 = 0;
        while (*(_DWORD *)(a1 + 436 + 4 * v40) != *((_DWORD *)v10 + 3))
        {
          if (v39 == ++v40)
            goto LABEL_97;
        }
        LODWORD(v39) = v40;
      }
LABEL_97:
      *((_DWORD *)v10 + 3) = v39;
      v41 = *(unsigned __int16 *)(a1 + 426);
      if (*(_WORD *)(a1 + 426))
      {
        v42 = 0;
        while (*((_DWORD *)v10 + 6) != *(unsigned __int16 *)(v4 + 2 * v42))
        {
          if (v41 == ++v42)
            goto LABEL_103;
        }
        LODWORD(v41) = v42;
      }
LABEL_103:
      *((_DWORD *)v10 + 6) = v41;
      if (*((_DWORD *)v10 + 5) != 7)
        goto LABEL_110;
      ++i;
      v10 = (uint64_t *)*v10;
      if (!v10)
      {
        v31 = *(unsigned __int16 *)(a1 + 414);
        v33 = *(unsigned __int16 *)(a1 + 416);
        v32 = *(unsigned __int16 *)(a1 + 422);
        v34 = *(unsigned __int16 *)(a1 + 426);
        break;
      }
    }
  }
  v30 = v33 * v31 * v32 * v34;
LABEL_107:
  if (i == v30)
    goto LABEL_108;
  v43 = "e: missing PDC LUTs";
LABEL_114:
  puts(v43);
  return 0;
}

BOOL sub_100018540(uint64_t a1)
{
  uint64_t *v1;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 result;

  v1 = *(uint64_t **)(a1 + 2824);
  if (!v1)
    return 1;
  if (*(_DWORD *)(a1 + 2716) >= 2u
    && *(_DWORD *)(a1 + 4 * (*(_DWORD *)(a1 + 2816) - 1) + 2720) > (*(_DWORD *)(a1 + 2816)
                                                                                                + 1))
  {
    sub_100018C44(a1);
    v1 = *(uint64_t **)(a1 + 2824);
    if (!v1)
      goto LABEL_26;
  }
  v3 = 0;
  v4 = v1;
  do
  {
    v5 = *(unsigned int *)(a1 + 2616);
    if ((_DWORD)v5)
    {
      v6 = 0;
      while (*(_DWORD *)(a1 + 2520 + 4 * v6) != *((_DWORD *)v4 + 2))
      {
        if (v5 == ++v6)
        {
          LODWORD(v6) = *(_DWORD *)(a1 + 2616);
          break;
        }
      }
    }
    else
    {
      LODWORD(v6) = 0;
    }
    *((_DWORD *)v4 + 2) = v6;
    v7 = *(unsigned int *)(a1 + 2716);
    if ((_DWORD)v7)
    {
      v8 = 0;
      while (*(_DWORD *)(a1 + 2620 + 4 * v8) != *((_DWORD *)v4 + 4))
      {
        if (v7 == ++v8)
        {
          LODWORD(v8) = *(_DWORD *)(a1 + 2716);
          break;
        }
      }
    }
    else
    {
      LODWORD(v8) = 0;
    }
    *((_DWORD *)v4 + 4) = v8;
    v9 = *(unsigned int *)(a1 + 2816);
    if ((_DWORD)v9)
    {
      v10 = 0;
      while (*(_DWORD *)(a1 + 2720 + 4 * v10) != *((_DWORD *)v4 + 3))
      {
        if (v9 == ++v10)
        {
          LODWORD(v10) = *(_DWORD *)(a1 + 2816);
          break;
        }
      }
    }
    else
    {
      LODWORD(v10) = 0;
    }
    *((_DWORD *)v4 + 3) = v10;
    ++v3;
    v4 = (uint64_t *)*v4;
  }
  while (v4);
  if (v3 != *(_DWORD *)(a1 + 2716) * *(_DWORD *)(a1 + 2616) * *(_DWORD *)(a1 + 2816) * *(_DWORD *)(a1 + 2820))
  {
    puts("e: missing PRC LUTs");
    return 0;
  }
  else
  {
LABEL_26:
    result = v1 != 0;
    *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFFB | (4 * result);
  }
  return result;
}

uint64_t sub_1000186BC(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  char v7;
  char v8;
  int v9;
  uint64_t **v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  char v14;
  int v15;
  uint64_t **v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v22;

  if (!*(_QWORD *)(a1 + 3584) || !*(_QWORD *)(a1 + 3600))
    return 1;
  if (*(float *)(a1 + 3552) == 0.0 || *(_QWORD *)(a1 + 3592))
  {
    if (*(float *)(a1 + 3568) == 0.0 || *(_QWORD *)(a1 + 3608))
    {
      v1 = *(unsigned int *)(a1 + 3424);
      v2 = *(unsigned __int16 *)(a1 + 2870);
      if ((_DWORD)v1 == v2
        && *(_DWORD *)(a1 + 3412) == (_DWORD)v1
        && (v3 = *(unsigned int *)(a1 + 3416), v4 = *(unsigned __int16 *)(a1 + 3160), (_DWORD)v3 == v4)
        && (v5 = *(unsigned int *)(a1 + 3420), v6 = *(unsigned __int16 *)(a1 + 3166), (_DWORD)v5 == v6))
      {
        *(_WORD *)(a1 + 24) &= ~0x20u;
        v7 = 1;
        while (1)
        {
          v8 = v7;
          v9 = v7 & 1;
          if ((v7 & 1) != 0)
            v10 = (uint64_t **)(a1 + 3584);
          else
            v10 = (uint64_t **)(a1 + 3592);
          v11 = *v10;
          if (!v9 && !v11)
          {
LABEL_27:
            v13 = 1;
            while (1)
            {
              v14 = v13;
              v15 = v13 & 1;
              if ((v13 & 1) != 0)
                v16 = (uint64_t **)(a1 + 3600);
              else
                v16 = (uint64_t **)(a1 + 3608);
              v17 = *v16;
              if (!v15 && !v17)
              {
LABEL_58:
                *(_WORD *)(a1 + 24) |= 0x20u;
                return 1;
              }
              if (v17)
                break;
LABEL_57:
              v13 = 0;
              if ((v14 & 1) == 0)
                goto LABEL_58;
            }
            while (1)
            {
              if (v2)
              {
                v18 = 0;
                while (*((_DWORD *)v17 + 664) != *(_DWORD *)(a1 + 2872 + 4 * v18))
                {
                  if (v1 == ++v18)
                    goto LABEL_66;
                }
              }
              else
              {
                LODWORD(v18) = 0;
              }
              if ((_DWORD)v18 == (_DWORD)v1)
              {
LABEL_66:
                printf("e: unspecified PP LUT temperature %d C\n");
                return 0;
              }
              *((_DWORD *)v17 + 664) = v18;
              if (v4)
              {
                v19 = 0;
                while (*((_DWORD *)v17 + 665) != *(_DWORD *)(a1 + 3208 + 4 * v19))
                {
                  if (v3 == ++v19)
                    goto LABEL_67;
                }
              }
              else
              {
                LODWORD(v19) = 0;
              }
              if ((_DWORD)v19 == (_DWORD)v3)
              {
LABEL_67:
                printf("e: unspecified PP LUT brightness %d\n");
                return 0;
              }
              *((_DWORD *)v17 + 665) = v19;
              if (v6)
              {
                v20 = 0;
                while (*((_DWORD *)v17 + 666) != *(_DWORD *)(a1 + 3168 + 4 * v20))
                {
                  if (v5 == ++v20)
                    goto LABEL_68;
                }
              }
              else
              {
                LODWORD(v20) = 0;
              }
              if ((_DWORD)v20 == (_DWORD)v5)
              {
LABEL_68:
                printf("e: unspecified PP LUT scan plan 0x%x\n");
                return 0;
              }
              *((_DWORD *)v17 + 666) = v20;
              if (*((_DWORD *)v17 + 663) != 7)
                break;
              v17 = (uint64_t *)*v17;
              if (!v17)
                goto LABEL_57;
            }
            v22 = "e: PP LUT missing color channel";
            goto LABEL_61;
          }
          if (v11)
            break;
LABEL_26:
          v7 = 0;
          if ((v8 & 1) == 0)
            goto LABEL_27;
        }
        while (1)
        {
          if (v2)
          {
            v12 = 0;
            while (*((_DWORD *)v11 + 803) != *(_DWORD *)(a1 + 2872 + 4 * v12))
            {
              if (v1 == ++v12)
                goto LABEL_65;
            }
          }
          else
          {
            LODWORD(v12) = 0;
          }
          if ((_DWORD)v12 == (_DWORD)v1)
            break;
          *((_DWORD *)v11 + 803) = v12;
          v11 = (uint64_t *)*v11;
          if (!v11)
            goto LABEL_26;
        }
LABEL_65:
        printf("e: unspecified PD LUT temperature value %d C\n");
      }
      else
      {
        v22 = "e: actual number of Prox LUTs differ from specified";
LABEL_61:
        puts(v22);
      }
    }
    else
    {
      printf("e: missing prox PP table bin %d\n");
    }
  }
  else
  {
    printf("e: missing prox PD table bin %d\n");
  }
  return 0;
}

uint64_t sub_1000189B0(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t i;
  _BOOL8 v8;
  const char *v9;

  v1 = *(_DWORD *)(a1 + 3616);
  if (!v1)
    return 1;
  v2 = 0;
  v3 = 0;
  v4 = 0;
  v5 = a1 + 3620;
  do
  {
    if (v2)
    {
      v6 = *(unsigned __int16 *)(a1 + 3652 + 2 * v2);
      if (v6 > *(unsigned __int16 *)(a1 + 2 * (v2 - 1) + 3652))
      {
        v9 = "e: LLMT APL Thresholds not in descending order";
LABEL_20:
        puts(v9);
        return 0;
      }
    }
    else
    {
      v6 = *(unsigned __int16 *)(a1 + 3652);
    }
    if (!(v6 | v3))
    {
      v4 = v2;
      v3 = 1;
    }
    ++v2;
  }
  while (v2 != 16);
  for (i = 0; i != 16; ++i)
  {
    if (i && *(unsigned __int16 *)(v5 + 2 * i) < *(unsigned __int16 *)(v5 + 2 * (i - 1)))
    {
      v9 = "e: LLMT DBV Thresholds not in ascending order";
      goto LABEL_20;
    }
  }
  if (v3 && *(unsigned __int16 *)(v5 + 2 * v4) == *(unsigned __int16 *)(a1 + 3684))
  {
    v8 = v1 == 1;
    *(_WORD *)(a1 + 24) = *(_WORD *)(a1 + 24) & 0xFFBF | (v8 << 6);
    return v8;
  }
  printf("e: LLMT Max DBV Threshold doesn't correspond to 0%% APL\n");
  return 0;
}

uint64_t sub_100018AAC(uint64_t a1)
{
  uint64_t *v1;
  int v2;
  unsigned __int16 *v3;
  int v4;
  int v5;
  __int16 v6;
  int v7;
  __int16 v8;
  unsigned __int8 v9;
  int v10;
  __int16 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  int v14;
  int v15;
  int v16;

  v1 = *(uint64_t **)(a1 + 3776);
  if (v1)
  {
    v2 = 0;
    *(_WORD *)(a1 + 24) &= ~0x80u;
    v3 = (unsigned __int16 *)(a1 + 3742);
    do
    {
      v4 = *(_DWORD *)(a1 + 3692);
      if (v4 == 1)
      {
        if (*(_WORD *)(a1 + 3740))
        {
          v7 = *((unsigned __int16 *)v1 + 4);
          if (v7 == *v3)
          {
            v8 = 0;
LABEL_25:
            *((_WORD *)v1 + 15) = v8;
          }
          else
          {
            v13 = 0;
            while (*(unsigned __int16 *)(a1 + 3740) > ++v13)
            {
              v8 = v13;
              if (v7 == v3[v13])
                goto LABEL_25;
            }
          }
        }
      }
      else if (v4 == 2)
      {
        if (*(_WORD *)(a1 + 3748))
        {
          v5 = *((unsigned __int16 *)v1 + 4);
          if (v5 == *(unsigned __int16 *)(a1 + 3732))
          {
            v6 = 0;
LABEL_14:
            *((_WORD *)v1 + 17) = v6;
          }
          else
          {
            v9 = 0;
            while (*(unsigned __int16 *)(a1 + 3748) > ++v9)
            {
              v6 = v9;
              if (v5 == *(unsigned __int16 *)(a1 + 2 * v9 + 3732))
                goto LABEL_14;
            }
          }
        }
        if (*(_WORD *)(a1 + 3766))
        {
          v10 = *((unsigned __int16 *)v1 + 16);
          if (v10 == *(unsigned __int16 *)(a1 + 3750))
          {
            v11 = 0;
LABEL_21:
            *((_WORD *)v1 + 18) = v11;
          }
          else
          {
            v12 = 0;
            while (*(unsigned __int16 *)(a1 + 3766) > ++v12)
            {
              v11 = v12;
              if (v10 == *(unsigned __int16 *)(a1 + 2 * v12 + 3750))
                goto LABEL_21;
            }
          }
        }
      }
      ++v2;
      v1 = (uint64_t *)*v1;
    }
    while (v1);
    v14 = *(_DWORD *)(a1 + 3692);
    if (v14 == 2)
    {
      v15 = *(unsigned __int16 *)(a1 + 3748);
      v16 = *(unsigned __int16 *)(a1 + 3766);
      if (v2 != v16 * v15 && v15 != *(unsigned __int16 *)(a1 + 3728) && v16 != *(unsigned __int16 *)(a1 + 3730))
        goto LABEL_37;
    }
    else if (v14 == 1 && v2 != *(unsigned __int16 *)(a1 + 3740))
    {
LABEL_37:
      puts("e: missing PTUC LUTs");
      return 0;
    }
    *(_WORD *)(a1 + 24) |= 0x80u;
  }
  return 1;
}

uint64_t sub_100018C44(uint64_t a1)
{
  unint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  char v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unint64_t v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t i;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unsigned int *v33;
  unsigned int *v34;
  uint64_t v35;
  unsigned int v36;
  _OWORD v37[6];

  if (!*(_QWORD *)(a1 + 2824))
    goto LABEL_3;
  v2 = *(unsigned int *)(a1 + 2816);
  v3 = *(_OWORD *)(a1 + 2768);
  v37[2] = *(_OWORD *)(a1 + 2752);
  v37[3] = v3;
  v4 = *(_OWORD *)(a1 + 2800);
  v37[4] = *(_OWORD *)(a1 + 2784);
  v37[5] = v4;
  v5 = *(_OWORD *)(a1 + 2736);
  v37[0] = *(_OWORD *)(a1 + 2720);
  v37[1] = v5;
  if (v2 >= 2)
  {
    v7 = 0;
    v8 = a1 + 2520;
    v9 = a1 + 2620;
    v34 = (unsigned int *)(a1 + 2816);
    v35 = a1 + 2824;
    v33 = (unsigned int *)(a1 + 2720);
    v10 = v37[0];
    v11 = 1;
    while (1)
    {
      v12 = *((_DWORD *)v37 + v11);
      v36 = v10 + 1;
      if (v10 + 1 < v12)
        break;
LABEL_33:
      ++v11;
      v6 = 1;
      v10 = v12;
      v7 = v11 >= v2;
      if (v11 == v2)
        return v6 & 1;
    }
    v13 = *(unsigned int *)(a1 + 2716);
    v14 = v13;
    v32 = v7;
    v30 = v11;
    v31 = v2;
    while (!v14)
    {
LABEL_32:
      if (++v36 == v12)
        goto LABEL_33;
    }
    v15 = 0;
    LODWORD(v16) = *(_DWORD *)(a1 + 2616);
    while (!(_DWORD)v16)
    {
LABEL_31:
      ++v15;
      v14 = v13;
      if (v15 >= v13)
        goto LABEL_32;
    }
    v17 = 0;
    while (1)
    {
      v18 = 0;
      v19 = 0;
      v20 = v35;
      do
      {
        v20 = *(_QWORD *)v20;
        if (!v20)
          break;
        if (*(_DWORD *)(v20 + 8) == *(_DWORD *)(v8 + 4 * v17))
        {
          v21 = *(_DWORD *)(v20 + 12);
          if (v21 == v10 && *(_DWORD *)(v20 + 16) == *(_DWORD *)(v9 + 4 * v15))
            v18 = v20;
          if (v21 == v12 && *(_DWORD *)(v20 + 16) == *(_DWORD *)(v9 + 4 * v15))
            v19 = v20;
        }
      }
      while (!v18 || !v19);
      if (!v18 || !v19)
      {
        printf("e: Could not find PRC tables [%d:%d:%d] [%d:%d:%d]\n", *(_DWORD *)(v8 + 4 * v17), v10, *(_DWORD *)(v9 + 4 * v15), *(_DWORD *)(v8 + 4 * v17), v12, *(_DWORD *)(v9 + 4 * v15));
        goto LABEL_37;
      }
      v22 = (char *)malloc_type_calloc(1uLL, 0x628uLL, 0x10200404B1403A4uLL);
      if (!v22)
        break;
      v23 = v22;
      v24 = 0;
      *((_DWORD *)v22 + 6) = 2;
      *((_DWORD *)v22 + 2) = *(_DWORD *)(v18 + 8);
      *((_DWORD *)v22 + 3) = v36;
      *((_QWORD *)v22 + 2) = *(_QWORD *)(v18 + 16);
      v25 = v19 + 28;
      v26 = v18 + 28;
      v27 = v22 + 28;
      do
      {
        for (i = 0; i != 514; i += 2)
          *(_WORD *)&v27[i] = (int)((float)((float)*(unsigned __int16 *)(v25 + i)
                                          + (float)((float)((float)(v12 - v36) / (float)(v12 - v10))
                                                  * (float)(*(unsigned __int16 *)(v26 + i)
                                                          - *(unsigned __int16 *)(v25 + i))))
                                  + 0.5);
        ++v24;
        v25 += 514;
        v26 += 514;
        v27 += 514;
      }
      while (v24 != 3);
      sub_100010A78(a1, *((_DWORD *)v22 + 3), v33, v34);
      *v23 = *(_QWORD *)(a1 + 2824);
      *(_QWORD *)(a1 + 2824) = v23;
      ++v17;
      v16 = *(unsigned int *)(a1 + 2616);
      if (v17 >= v16)
      {
        v13 = *(unsigned int *)(a1 + 2716);
        v11 = v30;
        v2 = v31;
        goto LABEL_31;
      }
    }
    puts("e: out of memory for PRC table");
LABEL_37:
    v6 = v32;
  }
  else
  {
LABEL_3:
    v6 = 1;
  }
  return v6 & 1;
}

void sub_100018F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;

  switch(*(_DWORD *)a2)
  {
    case 1:
      sub_100019138(a2 + 4, *(_DWORD *)(a2 + 52), "PDC temperatures", "0x%x");
      sub_100019138(a2 + 56, *(_DWORD *)(a2 + 104), "PDC subframes", "%d");
      break;
    case 2:
      sub_1000191CC(a2 + 4, *(unsigned __int16 *)(a2 + 302), "PDC temperatures");
      sub_1000191CC(a2 + 84, *(unsigned __int16 *)(a2 + 304), "PDC brightnesses");
      break;
    case 3:
      sub_1000191CC(a2 + 4, *(unsigned __int16 *)(a2 + 214), "PDC temperatures");
      sub_1000191CC(a2 + 44, *(unsigned __int16 *)(a2 + 216), "PDC brightnesses");
      v3 = a2 + 84;
      v4 = *(unsigned __int16 *)(a2 + 222);
      goto LABEL_6;
    case 4:
      sub_1000191CC(a2 + 4, *(unsigned __int16 *)(a2 + 318), "PDC temperatures");
      sub_1000191CC(a2 + 84, *(unsigned __int16 *)(a2 + 320), "PDC brightnesses");
      v3 = a2 + 164;
      v4 = *(unsigned __int16 *)(a2 + 326);
LABEL_6:
      sub_100019264(v3, v4);
      break;
    case 5:
      sub_1000191CC(a2 + 4, *(unsigned __int16 *)(a2 + 382), "PDC temperatures");
      sub_1000191CC(a2 + 84, *(unsigned __int16 *)(a2 + 384), "PDC brightnesses");
      sub_100019264(a2 + 164, *(unsigned __int16 *)(a2 + 390));
      printf("i: PDC nframes: %d\n", *(unsigned __int16 *)(a2 + 2084));
      break;
    default:
      return;
  }
}

_QWORD *sub_1000190BC(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *result;
  _QWORD *v9;

  v2 = (_QWORD *)a1[448];
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      free(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = (_QWORD *)a1[449];
  if (v4)
  {
    do
    {
      v5 = (_QWORD *)*v4;
      free(v4);
      v4 = v5;
    }
    while (v5);
  }
  v6 = (_QWORD *)a1[450];
  if (v6)
  {
    do
    {
      v7 = (_QWORD *)*v6;
      free(v6);
      v6 = v7;
    }
    while (v7);
  }
  result = (_QWORD *)a1[451];
  if (result)
  {
    do
    {
      v9 = (_QWORD *)*result;
      free(result);
      result = v9;
    }
    while (v9);
  }
  return result;
}

uint64_t sub_100019138(uint64_t a1, int a2, const char *a3, const char *a4)
{
  unint64_t v7;

  printf("i: %s: ", a3);
  if (a2)
  {
    v7 = 0;
    do
    {
      printf(a4, *(unsigned int *)(a1 + 4 * v7));
      if (v7 < (a2 - 1))
        printf(", ");
      ++v7;
    }
    while (a2 != v7);
  }
  return putchar(10);
}

uint64_t sub_1000191CC(uint64_t a1, int a2, const char *a3)
{
  unint64_t v5;

  printf("i: %s: ", a3);
  if (a2)
  {
    v5 = 0;
    do
    {
      printf("0x%x", *(_DWORD *)(a1 + 4 * v5));
      if (v5 < (a2 - 1))
        printf(", ");
      ++v5;
    }
    while (a2 != v5);
  }
  return putchar(10);
}

uint64_t sub_100019264(uint64_t a1, int a2)
{
  unint64_t v4;

  printf("i: %s: ", "PDC subframes");
  if (a2)
  {
    v4 = 0;
    do
    {
      printf("%d", *(unsigned __int16 *)(a1 + 2 * v4));
      if (v4 < (a2 - 1))
        printf(", ");
      ++v4;
    }
    while (a2 != v4);
  }
  return putchar(10);
}

_QWORD *sub_100019304(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_10001937C(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_100019360(_Unwind_Exception *exception_object)
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

char *sub_10001937C(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    sub_100008578();
  result = (char *)sub_1000193BC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_1000193BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    sub_1000084DC();
  return operator new(4 * a2);
}

void *sub_1000193F0(uint64_t a1)
{
  unint64_t v1;
  void *result;
  BOOL v3;

  if (a1 < 1)
    return 0;
  if (a1 >= 0x1FFFFFFFFFFFFFFFLL)
    v1 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v1 = a1;
  while (1)
  {
    result = operator new(4 * v1, &std::nothrow);
    if (result)
      break;
    v3 = v1 > 1;
    v1 >>= 1;
    if (!v3)
      return 0;
  }
  return result;
}

void sub_100019450(unsigned int *a1, unsigned int *a2, uint64_t **a3, unint64_t a4, unsigned int *a5, uint64_t a6)
{
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v16;
  unsigned int *v17;
  unint64_t v18;

  if (a4 >= 2)
  {
    if (a4 == 2)
    {
      v9 = *(a2 - 1);
      v10 = **a3;
      v11 = ((*a3)[1] - v10) >> 2;
      if (v11 <= v9 || (v12 = *a1, v11 <= v12))
      {
        __break(1u);
      }
      else if (*(_DWORD *)(v10 + 4 * v9) < *(_DWORD *)(v10 + 4 * v12))
      {
        *a1 = v9;
        *(a2 - 1) = v12;
      }
    }
    else if ((uint64_t)a4 > 128)
    {
      v16 = a4 >> 1;
      v17 = &a1[a4 >> 1];
      v18 = a4 >> 1;
      if ((uint64_t)a4 <= a6)
      {
        sub_1000196B4(a1, v17, a3, v18, a5);
        sub_1000196B4(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), &a5[v16]);
        sub_10001980C(a5, &a5[v16], &a5[v16], &a5[a4], a1, a3);
      }
      else
      {
        sub_100019450(a1, v17, a3, v18, a5, a6);
        sub_100019450(&a1[a4 >> 1], a2, a3, a4 - (a4 >> 1), a5, a6);
        sub_1000198B4((char *)a1, &a1[a4 >> 1], a2, a3, a4 >> 1, a4 - (a4 >> 1), (char *)a5, a6);
      }
    }
    else
    {
      sub_1000195FC(a1, a2, a3);
    }
  }
}

unsigned int *sub_1000195FC(unsigned int *result, unsigned int *a2, uint64_t **a3)
{
  unsigned int *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int *v12;

  if (result != a2)
  {
    v3 = result + 1;
    if (result + 1 != a2)
    {
      v4 = 0;
      v5 = **a3;
      v6 = ((*a3)[1] - v5) >> 2;
      v7 = result;
      while (1)
      {
        v8 = v3;
        v9 = *v3;
        if (v6 <= v9)
          break;
        v10 = *v7;
        if (v6 <= v10)
          break;
        if (*(_DWORD *)(v5 + 4 * v9) < *(_DWORD *)(v5 + 4 * v10))
        {
          v11 = v4;
          while (1)
          {
            *(unsigned int *)((char *)result + v11 + 4) = v10;
            if (!v11)
              break;
            v10 = *(unsigned int *)((char *)result + v11 - 4);
            if (v6 <= v10)
              goto LABEL_16;
            v11 -= 4;
            if (*(_DWORD *)(v5 + 4 * v9) >= *(_DWORD *)(v5 + 4 * v10))
            {
              v12 = (unsigned int *)((char *)result + v11 + 4);
              goto LABEL_13;
            }
          }
          v12 = result;
LABEL_13:
          *v12 = v9;
        }
        v3 = v8 + 1;
        v4 += 4;
        v7 = v8;
        if (v8 + 1 == a2)
          return result;
      }
LABEL_16:
      __break(1u);
    }
  }
  return result;
}

unsigned int *sub_1000196B4(unsigned int *result, unsigned int *a2, uint64_t **a3, unint64_t a4, unsigned int *a5)
{
  unsigned int *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;

  if (a4)
  {
    v9 = result;
    if (a4 == 2)
    {
      v10 = *(a2 - 1);
      v11 = **a3;
      v12 = ((*a3)[1] - v11) >> 2;
      if (v12 <= v10 || (v13 = *result, v12 <= v13))
      {
        __break(1u);
      }
      else
      {
        if (*(_DWORD *)(v11 + 4 * v10) >= *(_DWORD *)(v11 + 4 * v13))
        {
          *a5 = v13;
          v14 = *(a2 - 1);
        }
        else
        {
          *a5 = v10;
          v14 = *result;
        }
        a5[1] = v14;
      }
    }
    else if (a4 == 1)
    {
      *a5 = *result;
    }
    else if ((uint64_t)a4 > 8)
    {
      sub_100019450(result, &result[a4 >> 1], a3, a4 >> 1, a5, a4 >> 1);
      sub_100019450(&v9[a4 >> 1], a2, a3, a4 - (a4 >> 1), &a5[a4 >> 1], a4 - (a4 >> 1));
      return sub_100019BE8(v9, &v9[a4 >> 1], &v9[a4 >> 1], a2, a5, a3);
    }
    else
    {
      return sub_100019B08(result, a2, a5, a3);
    }
  }
  return result;
}

_DWORD *sub_10001980C(_DWORD *result, _DWORD *a2, unsigned int *a3, unsigned int *a4, _DWORD *a5, _QWORD **a6)
{
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unsigned int v11;
  int v12;
  uint64_t v13;

  if (result == a2)
  {
LABEL_14:
    while (a3 != a4)
    {
      v12 = *a3++;
      *a5++ = v12;
    }
  }
  else
  {
    v6 = *a6;
    while (a3 != a4)
    {
      v7 = *a3;
      v8 = (uint64_t)(v6[1] - *v6) >> 2;
      if (v8 <= v7 || (v9 = *result, v8 <= v9))
      {
        __break(1u);
        return result;
      }
      v10 = *(_DWORD *)(*v6 + 4 * v7) < *(_DWORD *)(*v6 + 4 * v9);
      v11 = !v10;
      if (!v10)
        LODWORD(v7) = *result;
      result += v11;
      a3 += v10;
      *a5++ = v7;
      if (result == a2)
        goto LABEL_14;
    }
    if (result != a2)
    {
      v13 = 0;
      do
      {
        a5[v13] = result[v13];
        ++v13;
      }
      while (&result[v13] != a2);
    }
  }
  return result;
}

void sub_1000198B4(char *a1, unsigned int *a2, unsigned int *a3, uint64_t **a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8)
{
  unint64_t v8;
  unsigned int *v9;
  uint64_t v11;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int *v24;
  unsigned int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  unsigned int *v30;
  uint64_t v31;
  uint64_t v32;
  char *__dst;
  unsigned int *v34;
  uint64_t v35;
  uint64_t **v36;
  uint64_t *v38;

  if (a6)
  {
    v11 = a6;
LABEL_3:
    if (v11 <= a8 || a5 <= a8)
    {
      sub_100019C90(a1, a2, a3, a4, a5, v11, a7);
    }
    else if (a5)
    {
      v16 = *a2;
      v17 = *a4;
      v18 = **a4;
      v19 = ((*a4)[1] - v18) >> 2;
      if (v19 > v16)
      {
        v20 = 0;
        v9 = 0;
        while (1)
        {
          v8 = *(unsigned int *)&a1[4 * (_QWORD)v9];
          if (v19 <= v8)
            break;
          if (*(_DWORD *)(v18 + 4 * v16) < *(_DWORD *)(v18 + 4 * v8))
          {
            v21 = a5 - (_QWORD)v9;
            v35 = a8;
            v36 = a4;
            __dst = &a1[-v20];
            v34 = a3;
            if (a5 - (uint64_t)v9 >= v11)
            {
              if ((unsigned int *)(a5 - 1) == v9)
                goto LABEL_29;
              if (v21 >= 0)
                v27 = a5 - (_QWORD)v9;
              else
                v27 = v21 + 1;
              v26 = v27 >> 1;
              v25 = (unsigned int *)&a1[4 * (v27 >> 1) - v20];
              v38 = v17;
              v24 = sub_100019F94(a2, a3, v25, &v38);
              v23 = v24 - a2;
            }
            else
            {
              if (v11 >= 0)
                v22 = v11;
              else
                v22 = v11 + 1;
              v23 = v22 >> 1;
              v24 = &a2[v22 >> 1];
              v25 = sub_100019D50((unsigned int *)&a1[-v20], a2, v24, a4);
              v26 = ((char *)v25 - a1 + v20) >> 2;
            }
            v32 = a5 - v26 - (_QWORD)v9;
            v28 = v11 - v23;
            v29 = sub_100019DB8((char *)v25, (char *)a2, (char *)v24);
            a1 = v29;
            if (v26 + v23 >= v11 + a5 - (v26 + v23) - (uint64_t)v9)
            {
              v9 = (unsigned int *)v29;
              sub_1000198B4(v29, v24, v34, v36, v32, v28, a7, v35);
              a1 = __dst;
              a2 = v25;
              a4 = v36;
              v28 = v23;
              a8 = v35;
              a5 = v26;
              a3 = v9;
            }
            else
            {
              v30 = v25;
              a4 = v36;
              v31 = v23;
              a8 = v35;
              sub_1000198B4(__dst, v30, v29, v36, v26, v31, a7, v35);
              a2 = v24;
              a3 = v34;
              a5 = a5 - v26 - (_QWORD)v9;
            }
            v11 = v28;
            if (v28)
              goto LABEL_3;
            return;
          }
          v9 = (unsigned int *)((char *)v9 + 1);
          v20 -= 4;
          if ((unsigned int *)a5 == v9)
            return;
        }
      }
      __break(1u);
LABEL_29:
      *(_DWORD *)&a1[4 * (_QWORD)v9] = v16;
      *a2 = v8;
    }
  }
}

unsigned int *sub_100019B08(unsigned int *result, unsigned int *a2, unsigned int *a3, uint64_t **a4)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int *v8;
  unint64_t v9;
  unsigned int *v10;
  unint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  if (result != a2)
  {
    v4 = *result++;
    *a3 = v4;
    if (result != a2)
    {
      v5 = 0;
      v6 = **a4;
      v7 = ((*a4)[1] - v6) >> 2;
      v8 = a3;
      while (1)
      {
        v9 = *result;
        if (v7 <= v9)
          break;
        v10 = v8 + 1;
        v11 = *v8;
        if (v7 <= v11)
          break;
        if (*(_DWORD *)(v6 + 4 * v9) >= *(_DWORD *)(v6 + 4 * v11))
        {
          *v10 = v9;
        }
        else
        {
          v8[1] = v11;
          v12 = a3;
          if (v8 != a3)
          {
            v13 = v5;
            while (1)
            {
              v14 = *result;
              if (v7 <= v14)
                goto LABEL_19;
              v15 = *(unsigned int *)((char *)a3 + v13 - 4);
              if (v7 <= v15)
                goto LABEL_19;
              if (*(_DWORD *)(v6 + 4 * v14) >= *(_DWORD *)(v6 + 4 * v15))
              {
                v12 = (unsigned int *)((char *)a3 + v13);
                break;
              }
              *(unsigned int *)((char *)a3 + v13) = v15;
              v13 -= 4;
              if (!v13)
              {
                v12 = a3;
                break;
              }
            }
          }
          *v12 = *result;
        }
        ++result;
        v5 += 4;
        v8 = v10;
        if (result == a2)
          return result;
      }
LABEL_19:
      __break(1u);
    }
  }
  return result;
}

_DWORD *sub_100019BE8(_DWORD *result, _DWORD *a2, unsigned int *a3, unsigned int *a4, _DWORD *a5, uint64_t **a6)
{
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  int v12;
  BOOL v13;
  _BOOL4 v14;
  unsigned int v15;
  int v16;
  uint64_t v17;

  if (result == a2)
  {
LABEL_14:
    while (a3 != a4)
    {
      v16 = *a3++;
      *a5++ = v16;
    }
  }
  else
  {
    v6 = *a6;
    while (a3 != a4)
    {
      v7 = *a3;
      v8 = *v6;
      v9 = (v6[1] - *v6) >> 2;
      if (v9 <= v7 || (v10 = *result, v9 <= v10))
      {
        __break(1u);
        return result;
      }
      v11 = *(_DWORD *)(v8 + 4 * v7);
      v12 = *(_DWORD *)(v8 + 4 * v10);
      v13 = v11 < v12;
      v14 = v11 >= v12;
      v15 = v13;
      if (!v13)
        LODWORD(v7) = *result;
      a3 += v15;
      result += v14;
      *a5++ = v7;
      if (result == a2)
        goto LABEL_14;
    }
    if (result != a2)
    {
      v17 = 0;
      do
      {
        a5[v17] = result[v17];
        ++v17;
      }
      while (&result[v17] != a2);
    }
  }
  return result;
}

void sub_100019C90(char *__dst, unsigned int *a2, unsigned int *a3, uint64_t **a4, uint64_t a5, uint64_t a6, char *__src)
{
  char *v9;
  unsigned int *v10;
  int v11;
  char *v12;
  char *v13;
  int v14;
  uint64_t **v15;

  if (a5 <= a6)
  {
    v12 = __src;
    if (__dst != (char *)a2)
    {
      v12 = __src;
      v13 = __dst;
      do
      {
        v14 = *(_DWORD *)v13;
        v13 += 4;
        *(_DWORD *)v12 = v14;
        v12 += 4;
      }
      while (v13 != (char *)a2);
    }
    sub_100019E78(__src, v12, a2, a3, __dst, a4);
  }
  else
  {
    v9 = __src;
    if (a2 != a3)
    {
      v9 = __src;
      v10 = a2;
      do
      {
        v11 = *v10++;
        *(_DWORD *)v9 = v11;
        v9 += 4;
      }
      while (v10 != a3);
    }
    v15 = a4;
    sub_100019EF8((uint64_t)v9, (uint64_t)v9, (uint64_t)__src, (uint64_t)__src, (uint64_t)a2, (uint64_t)a2, (uint64_t)__dst, (uint64_t)__dst, (uint64_t)a3, (uint64_t)a3, &v15);
  }
}

unsigned int *sub_100019D50(unsigned int *result, unsigned int *a2, unsigned int *a3, uint64_t **a4)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int *v9;
  unint64_t v10;
  unsigned int *v11;

  if (a2 != result)
  {
    v4 = *a3;
    v5 = **a4;
    v6 = ((*a4)[1] - v5) >> 2;
    if (v6 > v4)
    {
      v7 = a2 - result;
      while (1)
      {
        v8 = v7 >> 1;
        v9 = &result[v7 >> 1];
        v10 = *v9;
        if (v6 <= v10)
          break;
        v11 = v9 + 1;
        v7 += ~v8;
        if (*(_DWORD *)(v5 + 4 * v4) < *(_DWORD *)(v5 + 4 * v10))
          v7 = v8;
        else
          result = v11;
        if (!v7)
          return result;
      }
    }
    __break(1u);
  }
  return result;
}

char *sub_100019DB8(char *__src, char *a2, char *a3)
{
  char *v4;
  int v6;
  int64_t v7;
  int v8;
  size_t v9;

  v4 = a3;
  if (__src != a2)
  {
    if (a2 == a3)
    {
      return __src;
    }
    else if (__src + 4 == a2)
    {
      v6 = *(_DWORD *)__src;
      v7 = a3 - a2;
      memmove(__src, a2, a3 - a2);
      v4 = &__src[v7];
      *(_DWORD *)v4 = v6;
    }
    else if (a2 + 4 == a3)
    {
      v8 = *((_DWORD *)a3 - 1);
      v4 = __src + 4;
      v9 = a3 - 4 - __src;
      if (a3 - 4 != __src)
        memmove(__src + 4, __src, v9);
      *(_DWORD *)__src = v8;
    }
    else
    {
      return (char *)sub_100019FFC(__src, a2, a3);
    }
  }
  return v4;
}

char *sub_100019E78(char *__src, char *a2, unsigned int *a3, unsigned int *a4, char *__dst, uint64_t **a6)
{
  char *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  int v13;
  BOOL v14;
  _BOOL4 v15;
  unsigned int v16;

  if (__src != a2)
  {
    v6 = __src;
    v7 = *a6;
    while (1)
    {
      if (a3 == a4)
        return (char *)memmove(__dst, v6, a2 - v6);
      v8 = *a3;
      v9 = *v7;
      v10 = (v7[1] - *v7) >> 2;
      if (v10 <= v8)
        break;
      v11 = *(unsigned int *)v6;
      if (v10 <= v11)
        break;
      v12 = *(_DWORD *)(v9 + 4 * v8);
      v13 = *(_DWORD *)(v9 + 4 * v11);
      v14 = v12 < v13;
      v15 = v12 >= v13;
      v16 = v14;
      if (!v14)
        LODWORD(v8) = *(_DWORD *)v6;
      a3 += v16;
      v6 += 4 * v15;
      *(_DWORD *)__dst = v8;
      __dst += 4;
      if (v6 == a2)
        return __src;
    }
    __break(1u);
  }
  return __src;
}

void sub_100019EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t ***a11)
{
  uint64_t **v11;
  _DWORD *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  if (a2 != a4)
  {
    v11 = *a11;
    v12 = (_DWORD *)(a10 - 4);
    while (a6 != a8)
    {
      v13 = *(unsigned int *)(a2 - 4);
      v14 = **v11;
      v15 = ((*v11)[1] - v14) >> 2;
      if (v15 <= v13 || (v16 = *(unsigned int *)(a6 - 4), v15 <= v16))
      {
        __break(1u);
        return;
      }
      if (*(_DWORD *)(v14 + 4 * v13) >= *(_DWORD *)(v14 + 4 * v16))
      {
        a2 -= 4;
      }
      else
      {
        LODWORD(v13) = *(_DWORD *)(a6 - 4);
        a6 -= 4;
      }
      *v12-- = v13;
      if (a2 == a4)
        return;
    }
    v17 = 0;
    do
    {
      v12[v17] = *(_DWORD *)(a2 + v17 * 4 - 4);
      --v17;
    }
    while (a2 + v17 * 4 != a4);
  }
}

unsigned int *sub_100019F94(unsigned int *result, unsigned int *a2, unsigned int *a3, uint64_t **a4)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int *v9;
  unint64_t v10;
  unsigned int *v11;

  if (a2 != result)
  {
    v4 = a2 - result;
    v5 = **a4;
    v6 = ((*a4)[1] - v5) >> 2;
    v7 = *a3;
    while (1)
    {
      v8 = v4 >> 1;
      v9 = &result[v4 >> 1];
      v10 = *v9;
      if (v6 <= v10 || v6 <= v7)
        break;
      v11 = v9 + 1;
      v4 += ~v8;
      if (*(_DWORD *)(v5 + 4 * v10) < *(_DWORD *)(v5 + 4 * v7))
        result = v11;
      else
        v4 = v8;
      if (!v4)
        return result;
    }
    __break(1u);
  }
  return result;
}

_DWORD *sub_100019FFC(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v3;
  _DWORD *v4;
  _DWORD *v5;
  int v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  int v12;
  int v13;
  _DWORD *v14;
  _DWORD *v15;
  _DWORD *v16;
  _DWORD *v17;
  BOOL v18;
  char v19;
  uint64_t v20;

  v3 = a2 - a1;
  if (v3 == a3 - a2)
  {
    if (a1 != a2 && a2 != a3)
    {
      v4 = a1 + 1;
      v5 = a2 + 1;
      do
      {
        v6 = *(v4 - 1);
        *(v4 - 1) = *(v5 - 1);
        *(v5 - 1) = v6;
        if (v4 == a2)
          break;
        ++v4;
      }
      while (v5++ != a3);
    }
  }
  else
  {
    v8 = a3 - a2;
    v9 = a2 - a1;
    do
    {
      v10 = v9;
      v9 = v8;
      v8 = v10 % v8;
    }
    while (v8);
    if (v9)
    {
      v11 = &a1[v9];
      do
      {
        v13 = *--v11;
        v12 = v13;
        v14 = &v11[v3];
        v15 = v11;
        do
        {
          v16 = v14;
          *v15 = *v14;
          v17 = &v14[v3];
          v18 = __OFSUB__(v3, a3 - v14);
          v20 = v3 - (a3 - v14);
          v19 = (v20 < 0) ^ v18;
          v14 = &a1[v20];
          if (v19)
            v14 = v17;
          v15 = v16;
        }
        while (v14 != v11);
        *v16 = v12;
      }
      while (v11 != a1);
    }
    return &a1[a3 - a2];
  }
  return a2;
}

void *sub_10001A0D0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_1000084DC();
  return operator new(8 * a2);
}

uint64_t sub_10001A104(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t *v20;
  char v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v23 = *(a2 - 1);
        v24 = *v9;
        v25 = *(char *)(v23 + 6434);
        v26 = *(char *)(*v9 + 6434);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 6432) < *(unsigned __int16 *)(v24 + 6432))
        {
          *v9 = v23;
          *(a2 - 1) = v24;
        }
        return result;
      case 3uLL:
        return sub_10001A618(v9, v9 + 1, a2 - 1);
      case 4uLL:
        return sub_10001AD50(v9, v9 + 1, v9 + 2, a2 - 1);
      case 5uLL:
        return sub_10001AE38(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)sub_10001A474(v9, a2);
          else
            return (uint64_t)sub_10001A554(v9, a2);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            sub_10001A618(&v9[v13 >> 1], v9, a2 - 1);
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          else
          {
            sub_10001A618(v9, &v9[v13 >> 1], a2 - 1);
            sub_10001A618(v9 + 1, v15 - 1, a2 - 2);
            sub_10001A618(v9 + 2, &v9[v14 + 1], a2 - 3);
            sub_10001A618(v15 - 1, v15, &v9[v14 + 1]);
            v16 = *v9;
            *v9 = *v15;
            *v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          v17 = *(v9 - 1);
          v18 = *(char *)(v17 + 6434);
          v19 = *(char *)(*v9 + 6434);
          if (v18 >= v19
            && (v18 != v19 || *(unsigned __int16 *)(v17 + 6432) >= *(unsigned __int16 *)(*v9 + 6432)))
          {
            result = sub_10001A760(v9, (unint64_t)a2);
            v9 = (uint64_t *)result;
            goto LABEL_19;
          }
LABEL_14:
          v20 = (uint64_t *)sub_10001A958(v9, a2);
          if ((v21 & 1) == 0)
            goto LABEL_17;
          v22 = sub_10001AB58(v9, v20);
          v9 = v20 + 1;
          result = sub_10001AB58(v20 + 1, a2);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v22)
              continue;
LABEL_17:
            result = sub_10001A104(v8, v20, a3, -v11, a5 & 1);
            v9 = v20 + 1;
LABEL_19:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v20;
          if (v22)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)sub_10001AF6C(v9, a2, a2, a3);
        return result;
    }
  }
}

_QWORD *sub_10001A474(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v4;
        v4 = v2;
        v7 = *v5;
        v6 = v5[1];
        v8 = *(unsigned __int8 *)(v6 + 6434);
        if (*(char *)(v6 + 6434) < *(char *)(*v5 + 6434)
          || v8 == *(unsigned __int8 *)(*v5 + 6434)
          && *(unsigned __int16 *)(v6 + 6432) < *(unsigned __int16 *)(v7 + 6432))
        {
          v5[1] = v7;
          v9 = result;
          if (v5 != result)
          {
            v10 = v3;
            while (1)
            {
              v11 = *(_QWORD *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 6434) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 6434))
                {
                  v9 = v5;
                  goto LABEL_17;
                }
                if (*(unsigned __int16 *)(v6 + 6432) >= *(unsigned __int16 *)(v11 + 6432))
                  break;
              }
              --v5;
              *(_QWORD *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                v9 = result;
                goto LABEL_17;
              }
            }
            v9 = (_QWORD *)((char *)result + v10);
          }
LABEL_17:
          *v9 = v6;
        }
        v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_10001A554(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = 1;
      do
      {
        v5 = v3;
        v3 = v4;
        v6 = *v2;
        v7 = result[v5];
        v8 = *(unsigned __int8 *)(*v2 + 6434);
        if (*(char *)(*v2 + 6434) < *(char *)(v7 + 6434)
          || v8 == *(unsigned __int8 *)(v7 + 6434)
          && *(unsigned __int16 *)(v6 + 6432) < *(unsigned __int16 *)(v7 + 6432))
        {
          *v2 = v7;
          while (1)
          {
            v9 = &result[v5];
            v10 = *(v9 - 1);
            if (*(char *)(v10 + 6434) <= (char)v8
              && (v8 != *(unsigned __int8 *)(v10 + 6434)
               || *(unsigned __int16 *)(v6 + 6432) >= *(unsigned __int16 *)(v10 + 6432)))
            {
              break;
            }
            --v5;
            *v9 = v10;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        v4 = v3 + 1;
        v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_10001A618(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;

  v3 = *a2;
  v4 = *a1;
  v5 = *(unsigned __int8 *)(*a2 + 6434);
  v6 = *(unsigned __int8 *)(*a1 + 6434);
  if (*(char *)(*a2 + 6434) < *(char *)(*a1 + 6434)
    || v5 == v6 && *(unsigned __int16 *)(v3 + 6432) < *(unsigned __int16 *)(v4 + 6432))
  {
    v7 = *a3;
    if (*(char *)(*a3 + 6434) < (char)v5
      || *(unsigned __int8 *)(*a3 + 6434) == v5
      && *(unsigned __int16 *)(v7 + 6432) < *(unsigned __int16 *)(v3 + 6432))
    {
      *a1 = v7;
      *a3 = v4;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      v14 = *a3;
      if (*(char *)(*a3 + 6434) < (char)v6
        || *(unsigned __int8 *)(*a3 + 6434) == v6
        && *(unsigned __int16 *)(v14 + 6432) < *(unsigned __int16 *)(v4 + 6432))
      {
        *a2 = v14;
        *a3 = v4;
        return 2;
      }
    }
    return 1;
  }
  v9 = *a3;
  if (*(char *)(*a3 + 6434) < (char)v5
    || *(unsigned __int8 *)(*a3 + 6434) == v5
    && *(unsigned __int16 *)(v9 + 6432) < *(unsigned __int16 *)(v3 + 6432))
  {
    *a2 = v9;
    *a3 = v3;
    v10 = *a2;
    v11 = *a1;
    v12 = *(char *)(*a2 + 6434);
    v13 = *(char *)(*a1 + 6434);
    if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(v10 + 6432) < *(unsigned __int16 *)(v11 + 6432))
    {
      *a1 = v10;
      *a2 = v11;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_10001A760(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t i;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *a1;
  v3 = *(_QWORD *)(a2 - 8);
  v4 = *(unsigned __int8 *)(*a1 + 6434);
  v5 = *(char *)(v3 + 6434);
  if (*(char *)(*a1 + 6434) < (int)v5
    || v4 == *(unsigned __int8 *)(v3 + 6434)
    && (v5 = *(unsigned __int16 *)(v2 + 6432), v5 < *(unsigned __int16 *)(v3 + 6432)))
  {
    i = (unint64_t)(a1 + 1);
    if (a1 + 1 == (uint64_t *)a2)
      goto LABEL_24;
    v5 = 6434;
    while (*(char *)(*(_QWORD *)i + 6434) <= (char)v4
         && (v4 != *(unsigned __int8 *)(*(_QWORD *)i + 6434)
          || *(unsigned __int16 *)(v2 + 6432) >= *(unsigned __int16 *)(*(_QWORD *)i + 6432)))
    {
      i += 8;
      if (i == a2)
        goto LABEL_24;
    }
  }
  else
  {
    for (i = (unint64_t)(a1 + 1); i < a2; i += 8)
    {
      if (*(char *)(*(_QWORD *)i + 6434) > (char)v4
        || v4 == *(unsigned __int8 *)(*(_QWORD *)i + 6434)
        && *(unsigned __int16 *)(v2 + 6432) < *(unsigned __int16 *)(*(_QWORD *)i + 6432))
      {
        break;
      }
    }
  }
  v5 = a2;
  if (i >= a2)
    goto LABEL_25;
  if ((uint64_t *)a2 != a1)
  {
    v5 = a2 - 8;
    do
    {
      if (*(char *)(*(_QWORD *)v5 + 6434) <= (char)v4
        && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 6434)
         || *(unsigned __int16 *)(v2 + 6432) >= *(unsigned __int16 *)(*(_QWORD *)v5 + 6432)))
      {
        goto LABEL_25;
      }
      v7 = v5 == (_QWORD)a1;
      v5 -= 8;
    }
    while (!v7);
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5)
      break;
    v8 = *(_QWORD *)i;
    v9 = *(_QWORD *)v5;
LABEL_27:
    *(_QWORD *)i = v9;
    i += 8;
    *(_QWORD *)v5 = v8;
    while (i != a2)
    {
      v8 = *(_QWORD *)i;
      if (*(char *)(*(_QWORD *)i + 6434) > (char)v4
        || v4 == *(unsigned __int8 *)(*(_QWORD *)i + 6434)
        && *(unsigned __int16 *)(v2 + 6432) < *(unsigned __int16 *)(v8 + 6432))
      {
        if ((uint64_t *)v5 == a1)
          goto LABEL_24;
        v5 -= 8;
        while (1)
        {
          v9 = *(_QWORD *)v5;
          if (*(char *)(*(_QWORD *)v5 + 6434) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 6434)
             || *(unsigned __int16 *)(v2 + 6432) >= *(unsigned __int16 *)(v9 + 6432)))
          {
            break;
          }
          v7 = v5 == (_QWORD)a1;
          v5 -= 8;
          if (v7)
            goto LABEL_24;
        }
        if (i < v5)
          goto LABEL_27;
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((uint64_t *)(i - 8) != a1)
    *a1 = *(_QWORD *)(i - 8);
  *(_QWORD *)(i - 8) = v2;
  return i;
}

unint64_t sub_10001A958(uint64_t *a1, uint64_t *a2)
{
  unint64_t v2;
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t *v16;

  v4 = (_DWORD)a1 + 8;
  v5 = *a1;
  if (a1 + 1 != a2)
  {
    v2 = 6434;
    v4 = *(unsigned __int8 *)(v5 + 6434);
    v6 = 1;
    while (1)
    {
      v3 = (uint64_t *)a1[v6];
      if (*((char *)v3 + 6434) >= (char)v4
        && (*((unsigned __int8 *)v3 + 6434) != v4
         || *((unsigned __int16 *)v3 + 3216) >= *(unsigned __int16 *)(v5 + 6432)))
      {
        break;
      }
      v3 = &a1[++v6];
      if (&a1[v6] == a2)
        goto LABEL_16;
    }
    v2 = (unint64_t)&a1[v6];
    if (v6 == 1)
      goto LABEL_17;
    if (a2 != a1)
    {
      v7 = a2 - 1;
      do
      {
        if (*(char *)(*v7 + 6434) < (char)v4
          || *(unsigned __int8 *)(*v7 + 6434) == v4
          && *(unsigned __int16 *)(*v7 + 6432) < *(unsigned __int16 *)(v5 + 6432))
        {
          goto LABEL_29;
        }
        v8 = v7-- == a1;
      }
      while (!v8);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    v7 = a2;
    if (v2 < (unint64_t)a2)
    {
      v7 = a2 - 1;
      v9 = *(a2 - 1);
      if (*(char *)(v9 + 6434) >= (char)v4)
      {
        v10 = *(unsigned __int8 *)(v9 + 6434);
        do
        {
          if (v10 == v4)
          {
            if (*(unsigned __int16 *)(v9 + 6432) < *(unsigned __int16 *)(v5 + 6432)
              || v2 >= (unint64_t)v7)
            {
              break;
            }
          }
          else if (v2 >= (unint64_t)v7)
          {
            break;
          }
          v12 = *--v7;
          v9 = v12;
          v10 = *(unsigned __int8 *)(v12 + 6434);
        }
        while (*(char *)(v12 + 6434) >= (char)v4);
      }
    }
LABEL_29:
    if (v2 >= (unint64_t)v7)
      break;
    v13 = *v7;
    v14 = v7;
    v15 = v2;
LABEL_31:
    *(_QWORD *)v15 = v13;
    v15 += 8;
    *v14 = (uint64_t)v3;
    while ((uint64_t *)v15 != a2)
    {
      v3 = *(uint64_t **)v15;
      if (*(char *)(*(_QWORD *)v15 + 6434) >= (char)v4
        && (*(unsigned __int8 *)(*(_QWORD *)v15 + 6434) != v4
         || *((unsigned __int16 *)v3 + 3216) >= *(unsigned __int16 *)(v5 + 6432)))
      {
        if (v14 == a1)
          goto LABEL_16;
        --v14;
        while (1)
        {
          v13 = *v14;
          if (*(char *)(*v14 + 6434) < (char)v4
            || *(unsigned __int8 *)(*v14 + 6434) == v4
            && *(unsigned __int16 *)(v13 + 6432) < *(unsigned __int16 *)(v5 + 6432))
          {
            break;
          }
          v8 = v14-- == a1;
          if (v8)
            goto LABEL_16;
        }
        if (v15 < (unint64_t)v14)
          goto LABEL_31;
        goto LABEL_48;
      }
      v15 += 8;
    }
  }
  v15 = v2;
LABEL_48:
  v16 = (uint64_t *)(v15 - 8);
  if ((uint64_t *)(v15 - 8) != a1)
    *a1 = *v16;
  *v16 = v5;
  return v15 - 8;
}

BOOL sub_10001AB58(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a2 - a1;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 1);
      v7 = *a1;
      v8 = *(char *)(v6 + 6434);
      v9 = *(char *)(*a1 + 6434);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 6432) < *(unsigned __int16 *)(v7 + 6432))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_10001A618(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_10001AD50(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_10001AE38(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      v10 = a1 + 2;
      sub_10001A618(a1, a1 + 1, a1 + 2);
      v11 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = *v11;
    v15 = *v10;
    v16 = *(unsigned __int8 *)(*v11 + 6434);
    if (*(char *)(*v11 + 6434) < *(char *)(*v10 + 6434)
      || v16 == *(unsigned __int8 *)(*v10 + 6434)
      && *(unsigned __int16 *)(v14 + 6432) < *(unsigned __int16 *)(v15 + 6432))
    {
      *v11 = v15;
      v17 = a1;
      if (v10 != a1)
      {
        v18 = v12;
        while (1)
        {
          v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 6434) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 6434))
            {
              v17 = v10;
              goto LABEL_20;
            }
            if (*(unsigned __int16 *)(v14 + 6432) >= *(unsigned __int16 *)(v19 + 6432))
              break;
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            v17 = a1;
            goto LABEL_20;
          }
        }
        v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *v17 = v14;
      if (++v13 == 8)
        return v11 + 1 == a2;
    }
    v10 = v11;
    v12 += 8;
    if (++v11 == a2)
      return 1;
  }
}

uint64_t sub_10001AD50(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;

  result = sub_10001A618(a1, a2, a3);
  v9 = *a4;
  v10 = *a3;
  v11 = *(char *)(*a4 + 6434);
  v12 = *(char *)(*a3 + 6434);
  if (v11 < v12 || v11 == v12 && *(unsigned __int16 *)(v9 + 6432) < *(unsigned __int16 *)(v10 + 6432))
  {
    *a3 = v9;
    *a4 = v10;
    v13 = *a3;
    v14 = *a2;
    v15 = *(char *)(*a3 + 6434);
    v16 = *(char *)(*a2 + 6434);
    if (v15 < v16 || v15 == v16 && *(unsigned __int16 *)(v13 + 6432) < *(unsigned __int16 *)(v14 + 6432))
    {
      *a2 = v13;
      *a3 = v14;
      v17 = *a2;
      v18 = *a1;
      v19 = *(char *)(*a2 + 6434);
      v20 = *(char *)(*a1 + 6434);
      if (v19 < v20
        || v19 == v20 && *(unsigned __int16 *)(v17 + 6432) < *(unsigned __int16 *)(v18 + 6432))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

uint64_t sub_10001AE38(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  result = sub_10001AD50(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *a4;
  v13 = *(char *)(*a5 + 6434);
  v14 = *(char *)(*a4 + 6434);
  if (v13 < v14 || v13 == v14 && *(unsigned __int16 *)(v11 + 6432) < *(unsigned __int16 *)(v12 + 6432))
  {
    *a4 = v11;
    *a5 = v12;
    v15 = *a4;
    v16 = *a3;
    v17 = *(char *)(*a4 + 6434);
    v18 = *(char *)(*a3 + 6434);
    if (v17 < v18 || v17 == v18 && *(unsigned __int16 *)(v15 + 6432) < *(unsigned __int16 *)(v16 + 6432))
    {
      *a3 = v15;
      *a4 = v16;
      v19 = *a3;
      v20 = *a2;
      v21 = *(char *)(*a3 + 6434);
      v22 = *(char *)(*a2 + 6434);
      if (v21 < v22
        || v21 == v22 && *(unsigned __int16 *)(v19 + 6432) < *(unsigned __int16 *)(v20 + 6432))
      {
        *a2 = v19;
        *a3 = v20;
        v23 = *a2;
        v24 = *a1;
        v25 = *(char *)(*a2 + 6434);
        v26 = *(char *)(*a1 + 6434);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 6432) < *(unsigned __int16 *)(v24 + 6432))
        {
          *a1 = v23;
          *a2 = v24;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_10001AF6C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[v10];
      do
      {
        sub_10001B0D4((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *v14;
        v16 = *a1;
        v17 = *(char *)(*v14 + 6434);
        v18 = *(char *)(*a1 + 6434);
        if (v17 < v18
          || v17 == v18 && *(unsigned __int16 *)(v15 + 6432) < *(unsigned __int16 *)(v16 + 6432))
        {
          *v14 = v16;
          *a1 = v15;
          sub_10001B0D4((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v19 = (unint64_t)v8 >> 3;
      v20 = a2 - 1;
      do
      {
        v21 = *a1;
        v22 = sub_10001B230(a1, a4, v19);
        if (v20 == v22)
        {
          *v22 = v21;
        }
        else
        {
          *v22 = *v20;
          *v20 = v21;
          sub_10001B2C0((uint64_t)a1, (uint64_t)(v22 + 1), a4, v22 + 1 - a1);
        }
        --v20;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_10001B0D4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      v6 = v4 >> 2;
      v7 = (v4 >> 2) + 1;
      v8 = (_QWORD *)(result + 8 * v7);
      v9 = v6 + 2;
      if (v9 < a3)
      {
        v10 = v8[1];
        v11 = *(char *)(*v8 + 6434);
        v12 = *(char *)(v10 + 6434);
        if (v11 < v12
          || v11 == v12 && *(unsigned __int16 *)(*v8 + 6432) < *(unsigned __int16 *)(v10 + 6432))
        {
          ++v8;
          v7 = v9;
        }
      }
      v13 = *v8;
      v14 = *a4;
      if (*(char *)(*v8 + 6434) >= *(char *)(*a4 + 6434))
      {
        v15 = *(unsigned __int8 *)(*a4 + 6434);
        if (*(unsigned __int8 *)(*v8 + 6434) != v15
          || *(unsigned __int16 *)(v13 + 6432) >= *(unsigned __int16 *)(v14 + 6432))
        {
          *a4 = v13;
          if (v5 >= v7)
          {
            while (1)
            {
              v17 = 2 * v7;
              v7 = (2 * v7) | 1;
              v16 = (_QWORD *)(result + 8 * v7);
              v18 = v17 + 2;
              if (v18 < a3)
              {
                v19 = v16[1];
                v20 = *(char *)(*v16 + 6434);
                v21 = *(char *)(v19 + 6434);
                if (v20 < v21
                  || v20 == v21
                  && *(unsigned __int16 *)(*v16 + 6432) < *(unsigned __int16 *)(v19 + 6432))
                {
                  ++v16;
                  v7 = v18;
                }
              }
              v22 = *v16;
              if (*(char *)(*v16 + 6434) < (char)v15
                || *(unsigned __int8 *)(*v16 + 6434) == v15
                && *(unsigned __int16 *)(v22 + 6432) < *(unsigned __int16 *)(v14 + 6432))
              {
                break;
              }
              *v8 = v22;
              v8 = v16;
              if (v5 < v7)
                goto LABEL_22;
            }
          }
          v16 = v8;
LABEL_22:
          *v16 = v14;
        }
      }
    }
  }
  return result;
}

_QWORD *sub_10001B230(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = result;
    result += v3 + 1;
    v7 = 2 * v3;
    v3 = (2 * v3) | 1;
    v8 = v7 + 2;
    if (v8 < a3)
    {
      v9 = result[1];
      v10 = *(char *)(*result + 6434);
      v11 = *(char *)(v9 + 6434);
      if (v10 < v11
        || v10 == v11 && *(unsigned __int16 *)(*result + 6432) < *(unsigned __int16 *)(v9 + 6432))
      {
        ++result;
        v3 = v8;
      }
    }
    *v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_10001B2C0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v5 = v4 >> 1;
    v6 = (uint64_t *)(result + 8 * (v4 >> 1));
    v7 = *v6;
    v8 = *(_QWORD *)(a2 - 8);
    v9 = *(unsigned __int8 *)(v8 + 6434);
    if (*(char *)(*v6 + 6434) < *(char *)(v8 + 6434)
      || *(unsigned __int8 *)(*v6 + 6434) == v9
      && *(unsigned __int16 *)(v7 + 6432) < *(unsigned __int16 *)(v8 + 6432))
    {
      *(_QWORD *)(a2 - 8) = v7;
      if (v4 >= 2)
      {
        while (1)
        {
          v11 = v5 - 1;
          v5 = (v5 - 1) >> 1;
          v10 = (uint64_t *)(result + 8 * v5);
          v12 = *v10;
          if (*(char *)(*v10 + 6434) >= (char)v9
            && (*(unsigned __int8 *)(*v10 + 6434) != v9
             || *(unsigned __int16 *)(v12 + 6432) >= *(unsigned __int16 *)(v8 + 6432)))
          {
            break;
          }
          *v6 = v12;
          v6 = (uint64_t *)(result + 8 * v5);
          if (v11 <= 1)
            goto LABEL_11;
        }
      }
      v10 = v6;
LABEL_11:
      *v10 = v8;
    }
  }
  return result;
}

void sub_10001B374()
{
  sub_10001B388("vector");
}

void sub_10001B388(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10001B3D8(exception, a1);
}

void sub_10001B3C4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10001B3D8(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_10001B3FC(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t *v19;
  char v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v22 = *(a2 - 1);
        v23 = *v9;
        v24 = *(char *)(v22 + 10370);
        v25 = *(char *)(*v9 + 10370);
        if (v24 < v25
          || v24 == v25 && *(unsigned __int16 *)(v22 + 10368) < *(unsigned __int16 *)(*v9 + 10368))
        {
          *v9 = v22;
          *(a2 - 1) = v23;
        }
        return result;
      case 3uLL:
        return sub_10001B938(v9, v9 + 1, a2 - 1);
      case 4uLL:
        return sub_10001C0D8(v9, v9 + 1, v9 + 2, a2 - 1);
      case 5uLL:
        return sub_10001C1D8(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)sub_10001B77C(v9, a2);
          else
            return (uint64_t)sub_10001B868(v9, a2);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            sub_10001B938(&v9[v13 >> 1], v9, a2 - 1);
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          else
          {
            sub_10001B938(v9, &v9[v13 >> 1], a2 - 1);
            sub_10001B938(v9 + 1, v15 - 1, a2 - 2);
            sub_10001B938(v9 + 2, &v9[v14 + 1], a2 - 3);
            sub_10001B938(v15 - 1, v15, &v9[v14 + 1]);
            v16 = *v9;
            *v9 = *v15;
            *v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          v17 = *(char *)(*(v9 - 1) + 10370);
          v18 = *(char *)(*v9 + 10370);
          if (v17 >= v18
            && (v17 != v18
             || *(unsigned __int16 *)(*(v9 - 1) + 10368) >= *(unsigned __int16 *)(*v9 + 10368)))
          {
            result = sub_10001BA9C(v9, (unint64_t)a2);
            v9 = (uint64_t *)result;
            goto LABEL_19;
          }
LABEL_14:
          v19 = (uint64_t *)sub_10001BCB0(v9, a2);
          if ((v20 & 1) == 0)
            goto LABEL_17;
          v21 = sub_10001BECC(v9, v19);
          v9 = v19 + 1;
          result = sub_10001BECC(v19 + 1, a2);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v21)
              continue;
LABEL_17:
            result = sub_10001B3FC(v8, v19, a3, -v11, a5 & 1);
            v9 = v19 + 1;
LABEL_19:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v19;
          if (v21)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)sub_10001C32C(v9, a2, a2, a3);
        return result;
    }
  }
}

_QWORD *sub_10001B77C(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v4;
        v4 = v2;
        v6 = v5[1];
        v7 = (unsigned __int16 *)(v6 + 10368);
        v8 = *(unsigned __int8 *)(v6 + 10370);
        if (*(char *)(v6 + 10370) < *(char *)(*v5 + 10370)
          || v8 == *(unsigned __int8 *)(*v5 + 10370) && *v7 < *(unsigned __int16 *)(*v5 + 10368))
        {
          v5[1] = *v5;
          v9 = result;
          if (v5 != result)
          {
            v10 = v3;
            while (1)
            {
              v11 = *(_QWORD *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 10370) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 10370))
                {
                  v9 = v5;
                  goto LABEL_17;
                }
                if (*v7 >= *(unsigned __int16 *)(v11 + 10368))
                  break;
              }
              --v5;
              *(_QWORD *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                v9 = result;
                goto LABEL_17;
              }
            }
            v9 = (_QWORD *)((char *)result + v10);
          }
LABEL_17:
          *v9 = v6;
        }
        v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_10001B868(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  int v9;
  uint64_t *v10;
  uint64_t v11;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = 1;
      do
      {
        v5 = v3;
        v3 = v4;
        v6 = *v2;
        v7 = result[v5];
        v8 = (unsigned __int16 *)(*v2 + 10368);
        v9 = *(unsigned __int8 *)(*v2 + 10370);
        if (*(char *)(*v2 + 10370) < *(char *)(v7 + 10370)
          || v9 == *(unsigned __int8 *)(v7 + 10370) && *v8 < *(unsigned __int16 *)(v7 + 10368))
        {
          *v2 = v7;
          while (1)
          {
            v10 = &result[v5];
            v11 = *(v10 - 1);
            if (*(char *)(v11 + 10370) <= (char)v9
              && (v9 != *(unsigned __int8 *)(v11 + 10370) || *v8 >= *(unsigned __int16 *)(v11 + 10368)))
            {
              break;
            }
            --v5;
            *v10 = v11;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        v4 = v3 + 1;
        v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_10001B938(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  unsigned __int16 *v4;
  uint64_t v5;
  unsigned __int16 *v6;
  int v7;
  int v8;
  uint64_t v10;
  int v11;
  int v12;

  v3 = *a2;
  v4 = (unsigned __int16 *)(*a2 + 10368);
  v5 = *a1;
  v6 = (unsigned __int16 *)(*a1 + 10368);
  v7 = *(unsigned __int8 *)(*a2 + 10370);
  v8 = *(unsigned __int8 *)(*a1 + 10370);
  if (*(char *)(*a2 + 10370) < *(char *)(*a1 + 10370) || v7 == v8 && *v4 < *v6)
  {
    if (*(char *)(*a3 + 10370) < (char)v7
      || *(unsigned __int8 *)(*a3 + 10370) == v7 && *(unsigned __int16 *)(*a3 + 10368) < *v4)
    {
      *a1 = *a3;
      *a3 = v5;
    }
    else
    {
      *a1 = v3;
      *a2 = v5;
      if (*(char *)(*a3 + 10370) < (char)v8
        || *(unsigned __int8 *)(*a3 + 10370) == v8 && *(unsigned __int16 *)(*a3 + 10368) < *v6)
      {
        *a2 = *a3;
        *a3 = v5;
        return 2;
      }
    }
    return 1;
  }
  if (*(char *)(*a3 + 10370) < (char)v7
    || *(unsigned __int8 *)(*a3 + 10370) == v7 && *(unsigned __int16 *)(*a3 + 10368) < *v4)
  {
    *a2 = *a3;
    *a3 = v3;
    v10 = *a1;
    v11 = *(char *)(*a2 + 10370);
    v12 = *(char *)(*a1 + 10370);
    if (v11 < v12
      || v11 == v12 && *(unsigned __int16 *)(*a2 + 10368) < *(unsigned __int16 *)(*a1 + 10368))
    {
      *a1 = *a2;
      *a2 = v10;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_10001BA9C(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  unsigned __int16 *v3;
  int v4;
  unint64_t v5;
  unint64_t i;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *a1;
  v3 = (unsigned __int16 *)(*a1 + 10368);
  v4 = *(unsigned __int8 *)(*a1 + 10370);
  v5 = *(char *)(*(_QWORD *)(a2 - 8) + 10370);
  if (*(char *)(*a1 + 10370) < (int)v5
    || v4 == *(unsigned __int8 *)(*(_QWORD *)(a2 - 8) + 10370)
    && (v5 = *v3, v5 < *(unsigned __int16 *)(*(_QWORD *)(a2 - 8) + 10368)))
  {
    i = (unint64_t)(a1 + 1);
    if (a1 + 1 == (uint64_t *)a2)
      goto LABEL_24;
    v5 = 10368;
    while (*(char *)(*(_QWORD *)i + 10370) <= (char)v4
         && (v4 != *(unsigned __int8 *)(*(_QWORD *)i + 10370)
          || *v3 >= *(unsigned __int16 *)(*(_QWORD *)i + 10368)))
    {
      i += 8;
      if (i == a2)
        goto LABEL_24;
    }
  }
  else
  {
    for (i = (unint64_t)(a1 + 1); i < a2; i += 8)
    {
      if (*(char *)(*(_QWORD *)i + 10370) > (char)v4
        || v4 == *(unsigned __int8 *)(*(_QWORD *)i + 10370)
        && *v3 < *(unsigned __int16 *)(*(_QWORD *)i + 10368))
      {
        break;
      }
    }
  }
  v5 = a2;
  if (i >= a2)
    goto LABEL_25;
  if ((uint64_t *)a2 != a1)
  {
    v5 = a2 - 8;
    do
    {
      if (*(char *)(*(_QWORD *)v5 + 10370) <= (char)v4
        && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 10370)
         || *v3 >= *(unsigned __int16 *)(*(_QWORD *)v5 + 10368)))
      {
        goto LABEL_25;
      }
      v7 = v5 == (_QWORD)a1;
      v5 -= 8;
    }
    while (!v7);
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5)
      break;
    v8 = *(_QWORD *)i;
    v9 = *(_QWORD *)v5;
LABEL_27:
    *(_QWORD *)i = v9;
    i += 8;
    *(_QWORD *)v5 = v8;
    while (i != a2)
    {
      v8 = *(_QWORD *)i;
      if (*(char *)(*(_QWORD *)i + 10370) > (char)v4
        || v4 == *(unsigned __int8 *)(*(_QWORD *)i + 10370)
        && *v3 < *(unsigned __int16 *)(*(_QWORD *)i + 10368))
      {
        if ((uint64_t *)v5 == a1)
          goto LABEL_24;
        v5 -= 8;
        while (1)
        {
          v9 = *(_QWORD *)v5;
          if (*(char *)(*(_QWORD *)v5 + 10370) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 10370)
             || *v3 >= *(unsigned __int16 *)(*(_QWORD *)v5 + 10368)))
          {
            break;
          }
          v7 = v5 == (_QWORD)a1;
          v5 -= 8;
          if (v7)
            goto LABEL_24;
        }
        if (i < v5)
          goto LABEL_27;
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((uint64_t *)(i - 8) != a1)
    *a1 = *(_QWORD *)(i - 8);
  *(_QWORD *)(i - 8) = v2;
  return i;
}

unint64_t sub_10001BCB0(_QWORD *a1, _QWORD *a2)
{
  int v2;
  unint64_t v3;
  _QWORD *v4;
  unsigned __int16 *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;
  uint64_t v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  _QWORD *v17;

  v5 = (unsigned __int16 *)(a1 + 1);
  v6 = *a1;
  if (a1 + 1 != a2)
  {
    v5 = (unsigned __int16 *)(v6 + 10368);
    v2 = *(unsigned __int8 *)(v6 + 10370);
    v7 = 1;
    v3 = 10368;
    while (1)
    {
      v4 = (_QWORD *)a1[v7];
      if (*((char *)v4 + 10370) >= (char)v2
        && (*((unsigned __int8 *)v4 + 10370) != v2 || *((unsigned __int16 *)v4 + 5184) >= *v5))
      {
        break;
      }
      v4 = &a1[++v7];
      if (&a1[v7] == a2)
        goto LABEL_16;
    }
    v3 = (unint64_t)&a1[v7];
    if (v7 == 1)
      goto LABEL_17;
    if (a2 != a1)
    {
      v8 = a2 - 1;
      do
      {
        if (*(char *)(*v8 + 10370) < (char)v2
          || *(unsigned __int8 *)(*v8 + 10370) == v2 && *(unsigned __int16 *)(*v8 + 10368) < *v5)
        {
          goto LABEL_29;
        }
        v9 = v8-- == a1;
      }
      while (!v9);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    v8 = a2;
    if (v3 < (unint64_t)a2)
    {
      v8 = a2 - 1;
      v10 = *(a2 - 1);
      if (*(char *)(v10 + 10370) >= (char)v2)
      {
        v11 = *(unsigned __int8 *)(v10 + 10370);
        do
        {
          if (v11 == v2)
          {
            if (*(unsigned __int16 *)(v10 + 10368) < *v5 || v3 >= (unint64_t)v8)
              break;
          }
          else if (v3 >= (unint64_t)v8)
          {
            break;
          }
          v13 = *--v8;
          v10 = v13;
          v11 = *(unsigned __int8 *)(v13 + 10370);
        }
        while (*(char *)(v13 + 10370) >= (char)v2);
      }
    }
LABEL_29:
    if (v3 >= (unint64_t)v8)
      break;
    v14 = *v8;
    v15 = v8;
    v16 = v3;
LABEL_31:
    *(_QWORD *)v16 = v14;
    v16 += 8;
    *v15 = v4;
    while ((_QWORD *)v16 != a2)
    {
      v4 = *(_QWORD **)v16;
      if (*(char *)(*(_QWORD *)v16 + 10370) >= (char)v2
        && (*(unsigned __int8 *)(*(_QWORD *)v16 + 10370) != v2
         || *(unsigned __int16 *)(*(_QWORD *)v16 + 10368) >= *v5))
      {
        if (v15 == a1)
          goto LABEL_16;
        --v15;
        while (1)
        {
          v14 = *v15;
          if (*(char *)(*v15 + 10370) < (char)v2
            || *(unsigned __int8 *)(*v15 + 10370) == v2 && *(unsigned __int16 *)(*v15 + 10368) < *v5)
          {
            break;
          }
          v9 = v15-- == a1;
          if (v9)
            goto LABEL_16;
        }
        if (v16 < (unint64_t)v15)
          goto LABEL_31;
        goto LABEL_48;
      }
      v16 += 8;
    }
  }
  v16 = v3;
LABEL_48:
  v17 = (_QWORD *)(v16 - 8);
  if ((_QWORD *)(v16 - 8) != a1)
    *a1 = *v17;
  *v17 = v6;
  return v16 - 8;
}

BOOL sub_10001BECC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned __int16 *v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a2 - a1;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 1);
      v7 = *a1;
      v8 = *(char *)(v6 + 10370);
      v9 = *(char *)(*a1 + 10370);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 10368) < *(unsigned __int16 *)(*a1 + 10368))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_10001B938(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_10001C0D8(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_10001C1D8(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      v10 = a1 + 2;
      sub_10001B938(a1, a1 + 1, a1 + 2);
      v11 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = *v11;
    v15 = (unsigned __int16 *)(*v11 + 10368);
    v16 = *(unsigned __int8 *)(*v11 + 10370);
    if (*(char *)(*v11 + 10370) < *(char *)(*v10 + 10370)
      || v16 == *(unsigned __int8 *)(*v10 + 10370) && *v15 < *(unsigned __int16 *)(*v10 + 10368))
    {
      *v11 = *v10;
      v17 = a1;
      if (v10 != a1)
      {
        v18 = v12;
        while (1)
        {
          v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 10370) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 10370))
            {
              v17 = v10;
              goto LABEL_20;
            }
            if (*v15 >= *(unsigned __int16 *)(v19 + 10368))
              break;
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            v17 = a1;
            goto LABEL_20;
          }
        }
        v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *v17 = v14;
      if (++v13 == 8)
        return v11 + 1 == a2;
    }
    v10 = v11;
    v12 += 8;
    if (++v11 == a2)
      return 1;
  }
}

uint64_t sub_10001C0D8(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;

  result = sub_10001B938(a1, a2, a3);
  v9 = *a3;
  v10 = *(char *)(*a4 + 10370);
  v11 = *(char *)(*a3 + 10370);
  if (v10 < v11 || v10 == v11 && *(unsigned __int16 *)(*a4 + 10368) < *(unsigned __int16 *)(*a3 + 10368))
  {
    *a3 = *a4;
    *a4 = v9;
    v12 = *a2;
    v13 = *(char *)(*a3 + 10370);
    v14 = *(char *)(*a2 + 10370);
    if (v13 < v14
      || v13 == v14 && *(unsigned __int16 *)(*a3 + 10368) < *(unsigned __int16 *)(*a2 + 10368))
    {
      *a2 = *a3;
      *a3 = v12;
      v15 = *a1;
      v16 = *(char *)(*a2 + 10370);
      v17 = *(char *)(*a1 + 10370);
      if (v16 < v17
        || v16 == v17 && *(unsigned __int16 *)(*a2 + 10368) < *(unsigned __int16 *)(*a1 + 10368))
      {
        *a1 = *a2;
        *a2 = v15;
      }
    }
  }
  return result;
}

uint64_t sub_10001C1D8(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;

  result = sub_10001C0D8(a1, a2, a3, a4);
  v11 = *a4;
  v12 = *(char *)(*a5 + 10370);
  v13 = *(char *)(*a4 + 10370);
  if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(*a5 + 10368) < *(unsigned __int16 *)(*a4 + 10368))
  {
    *a4 = *a5;
    *a5 = v11;
    v14 = *a3;
    v15 = *(char *)(*a4 + 10370);
    v16 = *(char *)(*a3 + 10370);
    if (v15 < v16
      || v15 == v16 && *(unsigned __int16 *)(*a4 + 10368) < *(unsigned __int16 *)(*a3 + 10368))
    {
      *a3 = *a4;
      *a4 = v14;
      v17 = *a2;
      v18 = *(char *)(*a3 + 10370);
      v19 = *(char *)(*a2 + 10370);
      if (v18 < v19
        || v18 == v19 && *(unsigned __int16 *)(*a3 + 10368) < *(unsigned __int16 *)(*a2 + 10368))
      {
        *a2 = *a3;
        *a3 = v17;
        v20 = *a1;
        v21 = *(char *)(*a2 + 10370);
        v22 = *(char *)(*a1 + 10370);
        if (v21 < v22
          || v21 == v22 && *(unsigned __int16 *)(*a2 + 10368) < *(unsigned __int16 *)(*a1 + 10368))
        {
          *a1 = *a2;
          *a2 = v20;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_10001C32C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[v10];
      do
      {
        sub_10001C49C((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *v14;
        v16 = *(char *)(*v14 + 10370);
        v17 = *(char *)(*a1 + 10370);
        if (v16 < v17
          || v16 == v17 && *(unsigned __int16 *)(*v14 + 10368) < *(unsigned __int16 *)(*a1 + 10368))
        {
          *v14 = *a1;
          *a1 = v15;
          sub_10001C49C((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v18 = (unint64_t)v8 >> 3;
      v19 = a2 - 1;
      do
      {
        v20 = *a1;
        v21 = sub_10001C614(a1, a4, v18);
        if (v19 == v21)
        {
          *v21 = v20;
        }
        else
        {
          *v21 = *v19;
          *v19 = v20;
          sub_10001C6AC((uint64_t)a1, (uint64_t)(v21 + 1), a4, v21 + 1 - a1);
        }
        --v19;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_10001C49C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  unsigned __int16 *v13;
  int v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      v6 = v4 >> 2;
      v7 = (v4 >> 2) + 1;
      v8 = (_QWORD *)(result + 8 * v7);
      v9 = v6 + 2;
      if (v9 < a3)
      {
        v10 = *(char *)(*v8 + 10370);
        v11 = *(char *)(v8[1] + 10370);
        if (v10 < v11
          || v10 == v11 && *(unsigned __int16 *)(*v8 + 10368) < *(unsigned __int16 *)(v8[1] + 10368))
        {
          ++v8;
          v7 = v9;
        }
      }
      v12 = *a4;
      v13 = (unsigned __int16 *)(*a4 + 10368);
      if (*(char *)(*v8 + 10370) >= *(char *)(*a4 + 10370))
      {
        v14 = *(unsigned __int8 *)(*a4 + 10370);
        if (*(unsigned __int8 *)(*v8 + 10370) != v14 || *(unsigned __int16 *)(*v8 + 10368) >= *v13)
        {
          *a4 = *v8;
          if (v5 >= v7)
          {
            while (1)
            {
              v16 = 2 * v7;
              v7 = (2 * v7) | 1;
              v15 = (_QWORD *)(result + 8 * v7);
              v17 = v16 + 2;
              if (v17 < a3)
              {
                v18 = *(char *)(*v15 + 10370);
                v19 = *(char *)(v15[1] + 10370);
                if (v18 < v19
                  || v18 == v19
                  && *(unsigned __int16 *)(*v15 + 10368) < *(unsigned __int16 *)(v15[1] + 10368))
                {
                  ++v15;
                  v7 = v17;
                }
              }
              if (*(char *)(*v15 + 10370) < (char)v14
                || *(unsigned __int8 *)(*v15 + 10370) == v14
                && *(unsigned __int16 *)(*v15 + 10368) < *v13)
              {
                break;
              }
              *v8 = *v15;
              v8 = v15;
              if (v5 < v7)
                goto LABEL_22;
            }
          }
          v15 = v8;
LABEL_22:
          *v15 = v12;
        }
      }
    }
  }
  return result;
}

_QWORD *sub_10001C614(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = result;
    result += v3 + 1;
    v7 = 2 * v3;
    v3 = (2 * v3) | 1;
    v8 = v7 + 2;
    if (v8 < a3)
    {
      v9 = *(char *)(*result + 10370);
      v10 = *(char *)(result[1] + 10370);
      if (v9 < v10
        || v9 == v10
        && *(unsigned __int16 *)(*result + 10368) < *(unsigned __int16 *)(result[1] + 10368))
      {
        ++result;
        v3 = v8;
      }
    }
    *v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_10001C6AC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  int v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v5 = v4 >> 1;
    v6 = result + 8 * (v4 >> 1);
    v7 = *(_QWORD *)(a2 - 8);
    v8 = (unsigned __int16 *)(v7 + 10368);
    v9 = *(unsigned __int8 *)(v7 + 10370);
    if (*(char *)(*(_QWORD *)v6 + 10370) < *(char *)(v7 + 10370)
      || *(unsigned __int8 *)(*(_QWORD *)v6 + 10370) == v9
      && *(unsigned __int16 *)(*(_QWORD *)v6 + 10368) < *v8)
    {
      *(_QWORD *)(a2 - 8) = *(_QWORD *)v6;
      if (v4 >= 2)
      {
        while (1)
        {
          v11 = v5 - 1;
          v5 = (v5 - 1) >> 1;
          v10 = result + 8 * v5;
          if (*(char *)(*(_QWORD *)v10 + 10370) >= (char)v9
            && (*(unsigned __int8 *)(*(_QWORD *)v10 + 10370) != v9
             || *(unsigned __int16 *)(*(_QWORD *)v10 + 10368) >= *v8))
          {
            break;
          }
          *(_QWORD *)v6 = *(_QWORD *)v10;
          v6 = result + 8 * v5;
          if (v11 <= 1)
            goto LABEL_11;
        }
      }
      v10 = v6;
LABEL_11:
      *(_QWORD *)v10 = v7;
    }
  }
  return result;
}

uint64_t sub_10001C76C(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t *v20;
  char v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v23 = *(a2 - 1);
        v24 = *v9;
        v25 = *(char *)(v23 + 578);
        v26 = *(char *)(*v9 + 578);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 576) < *(unsigned __int16 *)(v24 + 576))
        {
          *v9 = v23;
          *(a2 - 1) = v24;
        }
        return result;
      case 3uLL:
        return sub_10001CC70(v9, v9 + 1, a2 - 1);
      case 4uLL:
        return sub_10001D358(v9, v9 + 1, v9 + 2, a2 - 1);
      case 5uLL:
        return sub_10001D434(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)sub_10001CAD4(v9, a2);
          else
            return (uint64_t)sub_10001CBB0(v9, a2);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            sub_10001CC70(&v9[v13 >> 1], v9, a2 - 1);
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          else
          {
            sub_10001CC70(v9, &v9[v13 >> 1], a2 - 1);
            sub_10001CC70(v9 + 1, v15 - 1, a2 - 2);
            sub_10001CC70(v9 + 2, &v9[v14 + 1], a2 - 3);
            sub_10001CC70(v15 - 1, v15, &v9[v14 + 1]);
            v16 = *v9;
            *v9 = *v15;
            *v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          v17 = *(v9 - 1);
          v18 = *(char *)(v17 + 578);
          v19 = *(char *)(*v9 + 578);
          if (v18 >= v19
            && (v18 != v19 || *(unsigned __int16 *)(v17 + 576) >= *(unsigned __int16 *)(*v9 + 576)))
          {
            result = sub_10001CDA4((unsigned __int16 *)v9, (unsigned __int16 *)a2);
            v9 = (uint64_t *)result;
            goto LABEL_19;
          }
LABEL_14:
          v20 = sub_10001CF7C(v9, a2);
          if ((v21 & 1) == 0)
            goto LABEL_17;
          v22 = sub_10001D168(v9, v20);
          v9 = v20 + 1;
          result = sub_10001D168(v20 + 1, a2);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v22)
              continue;
LABEL_17:
            result = sub_10001C76C(v8, v20, a3, -v11, a5 & 1);
            v9 = v20 + 1;
LABEL_19:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v20;
          if (v22)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)sub_10001D558(v9, a2, a2, a3);
        return result;
    }
  }
}

_QWORD *sub_10001CAD4(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v4;
        v4 = v2;
        v7 = *v5;
        v6 = v5[1];
        v8 = *(unsigned __int8 *)(v6 + 578);
        if (*(char *)(v6 + 578) < *(char *)(*v5 + 578)
          || v8 == *(unsigned __int8 *)(*v5 + 578)
          && *(unsigned __int16 *)(v6 + 576) < *(unsigned __int16 *)(v7 + 576))
        {
          v5[1] = v7;
          v9 = result;
          if (v5 != result)
          {
            v10 = v3;
            while (1)
            {
              v11 = *(_QWORD *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 578) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 578))
                {
                  v9 = v5;
                  goto LABEL_17;
                }
                if (*(unsigned __int16 *)(v6 + 576) >= *(unsigned __int16 *)(v11 + 576))
                  break;
              }
              --v5;
              *(_QWORD *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                v9 = result;
                goto LABEL_17;
              }
            }
            v9 = (_QWORD *)((char *)result + v10);
          }
LABEL_17:
          *v9 = v6;
        }
        v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_10001CBB0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = 1;
      do
      {
        v5 = v3;
        v3 = v4;
        v6 = *v2;
        v7 = result[v5];
        v8 = *(unsigned __int8 *)(*v2 + 578);
        if (*(char *)(*v2 + 578) < *(char *)(v7 + 578)
          || v8 == *(unsigned __int8 *)(v7 + 578)
          && *(unsigned __int16 *)(v6 + 576) < *(unsigned __int16 *)(v7 + 576))
        {
          *v2 = v7;
          while (1)
          {
            v9 = &result[v5];
            v10 = *(v9 - 1);
            if (*(char *)(v10 + 578) <= (char)v8
              && (v8 != *(unsigned __int8 *)(v10 + 578)
               || *(unsigned __int16 *)(v6 + 576) >= *(unsigned __int16 *)(v10 + 576)))
            {
              break;
            }
            --v5;
            *v9 = v10;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        v4 = v3 + 1;
        v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_10001CC70(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;

  v3 = *a2;
  v4 = *a1;
  v5 = *(unsigned __int8 *)(*a2 + 578);
  v6 = *(unsigned __int8 *)(*a1 + 578);
  if (*(char *)(*a2 + 578) < *(char *)(*a1 + 578)
    || v5 == v6 && *(unsigned __int16 *)(v3 + 576) < *(unsigned __int16 *)(v4 + 576))
  {
    v7 = *a3;
    if (*(char *)(*a3 + 578) < (char)v5
      || *(unsigned __int8 *)(*a3 + 578) == v5
      && *(unsigned __int16 *)(v7 + 576) < *(unsigned __int16 *)(v3 + 576))
    {
      *a1 = v7;
      *a3 = v4;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      v14 = *a3;
      if (*(char *)(*a3 + 578) < (char)v6
        || *(unsigned __int8 *)(*a3 + 578) == v6
        && *(unsigned __int16 *)(v14 + 576) < *(unsigned __int16 *)(v4 + 576))
      {
        *a2 = v14;
        *a3 = v4;
        return 2;
      }
    }
    return 1;
  }
  v9 = *a3;
  if (*(char *)(*a3 + 578) < (char)v5
    || *(unsigned __int8 *)(*a3 + 578) == v5
    && *(unsigned __int16 *)(v9 + 576) < *(unsigned __int16 *)(v3 + 576))
  {
    *a2 = v9;
    *a3 = v3;
    v10 = *a2;
    v11 = *a1;
    v12 = *(char *)(*a2 + 578);
    v13 = *(char *)(*a1 + 578);
    if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(v10 + 576) < *(unsigned __int16 *)(v11 + 576))
    {
      *a1 = v10;
      *a2 = v11;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_10001CDA4(unsigned __int16 *a1, unsigned __int16 *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t i;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)a1;
  v3 = *((_QWORD *)a2 - 1);
  v4 = *(unsigned __int8 *)(*(_QWORD *)a1 + 578);
  v5 = *(char *)(v3 + 578);
  if (*(char *)(*(_QWORD *)a1 + 578) < (int)v5
    || v4 == *(unsigned __int8 *)(v3 + 578)
    && (v5 = *(unsigned __int16 *)(v2 + 576), v5 < *(unsigned __int16 *)(v3 + 576)))
  {
    for (i = (unint64_t)(a1 + 4); (unsigned __int16 *)i != a2; i += 8)
    {
      v5 = *(_QWORD *)i;
      if (*(char *)(*(_QWORD *)i + 578) > (char)v4)
        goto LABEL_16;
      if (v4 == *(unsigned __int8 *)(*(_QWORD *)i + 578))
      {
        v5 = *(unsigned __int16 *)(v5 + 576);
        if (*(unsigned __int16 *)(v2 + 576) < v5)
          goto LABEL_16;
      }
    }
  }
  else
  {
    for (i = (unint64_t)(a1 + 4);
          i < (unint64_t)a2
       && *(char *)(*(_QWORD *)i + 578) <= (char)v4
       && (v4 != *(unsigned __int8 *)(*(_QWORD *)i + 578)
        || *(unsigned __int16 *)(v2 + 576) >= *(unsigned __int16 *)(*(_QWORD *)i + 576));
LABEL_16:
    v5 = (unint64_t)a2;
    if (i >= (unint64_t)a2)
      goto LABEL_25;
    if (a2 != a1)
    {
      v5 = (unint64_t)(a2 - 4);
      do
      {
        if (*(char *)(*(_QWORD *)v5 + 578) <= (char)v4
          && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 578)
           || *(unsigned __int16 *)(v2 + 576) >= *(unsigned __int16 *)(*(_QWORD *)v5 + 576)))
        {
          goto LABEL_25;
        }
        v7 = v5 == (_QWORD)a1;
        v5 -= 8;
      }
      while (!v7);
    }
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5)
      break;
    v8 = *(_QWORD *)i;
    v9 = *(_QWORD *)v5;
LABEL_27:
    *(_QWORD *)i = v9;
    i += 8;
    *(_QWORD *)v5 = v8;
    while ((unsigned __int16 *)i != a2)
    {
      v8 = *(_QWORD *)i;
      if (*(char *)(*(_QWORD *)i + 578) > (char)v4
        || v4 == *(unsigned __int8 *)(*(_QWORD *)i + 578)
        && *(unsigned __int16 *)(v2 + 576) < *(unsigned __int16 *)(v8 + 576))
      {
        if ((unsigned __int16 *)v5 == a1)
          goto LABEL_24;
        v5 -= 8;
        while (1)
        {
          v9 = *(_QWORD *)v5;
          if (*(char *)(*(_QWORD *)v5 + 578) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 578)
             || *(unsigned __int16 *)(v2 + 576) >= *(unsigned __int16 *)(v9 + 576)))
          {
            break;
          }
          v7 = v5 == (_QWORD)a1;
          v5 -= 8;
          if (v7)
            goto LABEL_24;
        }
        if (i < v5)
          goto LABEL_27;
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((unsigned __int16 *)(i - 8) != a1)
    *(_QWORD *)a1 = *(_QWORD *)(i - 8);
  *(_QWORD *)(i - 8) = v2;
  return i;
}

uint64_t *sub_10001CF7C(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;

  v4 = (_DWORD)a1 + 8;
  v5 = *a1;
  if (a1 + 1 != a2)
  {
    v4 = *(unsigned __int8 *)(v5 + 578);
    v6 = 1;
    while (1)
    {
      v3 = a1[v6];
      if (*(char *)(v3 + 578) >= (char)v4
        && (*(unsigned __int8 *)(v3 + 578) != v4
         || *(unsigned __int16 *)(v3 + 576) >= *(unsigned __int16 *)(v5 + 576)))
      {
        break;
      }
      v2 = &a1[++v6];
      if (&a1[v6] == a2)
        goto LABEL_16;
    }
    v2 = &a1[v6];
    if (v6 == 1)
      goto LABEL_17;
    if (a2 != a1)
    {
      v7 = a2 - 1;
      do
      {
        if (*(char *)(*v7 + 578) < (char)v4
          || *(unsigned __int8 *)(*v7 + 578) == v4
          && *(unsigned __int16 *)(*v7 + 576) < *(unsigned __int16 *)(v5 + 576))
        {
          goto LABEL_29;
        }
        v8 = v7-- == a1;
      }
      while (!v8);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    v7 = a2;
    if (v2 < a2)
    {
      v7 = a2 - 1;
      v9 = *(a2 - 1);
      if (*(char *)(v9 + 578) >= (char)v4)
      {
        v10 = *(unsigned __int8 *)(v9 + 578);
        do
        {
          if (v10 == v4)
          {
            if (*(unsigned __int16 *)(v9 + 576) < *(unsigned __int16 *)(v5 + 576) || v2 >= v7)
              break;
          }
          else if (v2 >= v7)
          {
            break;
          }
          v12 = *--v7;
          v9 = v12;
          v10 = *(unsigned __int8 *)(v12 + 578);
        }
        while (*(char *)(v12 + 578) >= (char)v4);
      }
    }
LABEL_29:
    if (v2 >= v7)
      break;
    v13 = *v7;
    v14 = v7;
    v15 = v2;
LABEL_31:
    *v15++ = v13;
    *v14 = v3;
    while (v15 != a2)
    {
      v3 = *v15;
      if (*(char *)(*v15 + 578) >= (char)v4
        && (*(unsigned __int8 *)(*v15 + 578) != v4
         || *(unsigned __int16 *)(v3 + 576) >= *(unsigned __int16 *)(v5 + 576)))
      {
        if (v14 == a1)
          goto LABEL_16;
        --v14;
        while (1)
        {
          v13 = *v14;
          if (*(char *)(*v14 + 578) < (char)v4
            || *(unsigned __int8 *)(*v14 + 578) == v4
            && *(unsigned __int16 *)(v13 + 576) < *(unsigned __int16 *)(v5 + 576))
          {
            break;
          }
          v8 = v14-- == a1;
          if (v8)
            goto LABEL_16;
        }
        if (v15 < v14)
          goto LABEL_31;
        goto LABEL_48;
      }
      ++v15;
    }
  }
  v15 = v2;
LABEL_48:
  v16 = v15 - 1;
  if (v15 - 1 != a1)
    *a1 = *v16;
  *v16 = v5;
  return v15 - 1;
}

BOOL sub_10001D168(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a2 - a1;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 1);
      v7 = *a1;
      v8 = *(char *)(v6 + 578);
      v9 = *(char *)(*a1 + 578);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 576) < *(unsigned __int16 *)(v7 + 576))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_10001CC70(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_10001D358(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_10001D434(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      v10 = a1 + 2;
      sub_10001CC70(a1, a1 + 1, a1 + 2);
      v11 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = *v11;
    v15 = *v10;
    v16 = *(unsigned __int8 *)(*v11 + 578);
    if (*(char *)(*v11 + 578) < *(char *)(*v10 + 578)
      || v16 == *(unsigned __int8 *)(*v10 + 578)
      && *(unsigned __int16 *)(v14 + 576) < *(unsigned __int16 *)(v15 + 576))
    {
      *v11 = v15;
      v17 = a1;
      if (v10 != a1)
      {
        v18 = v12;
        while (1)
        {
          v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 578) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 578))
            {
              v17 = v10;
              goto LABEL_20;
            }
            if (*(unsigned __int16 *)(v14 + 576) >= *(unsigned __int16 *)(v19 + 576))
              break;
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            v17 = a1;
            goto LABEL_20;
          }
        }
        v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *v17 = v14;
      if (++v13 == 8)
        return v11 + 1 == a2;
    }
    v10 = v11;
    v12 += 8;
    if (++v11 == a2)
      return 1;
  }
}

uint64_t sub_10001D358(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;

  result = sub_10001CC70(a1, a2, a3);
  v9 = *a4;
  v10 = *a3;
  v11 = *(char *)(*a4 + 578);
  v12 = *(char *)(*a3 + 578);
  if (v11 < v12 || v11 == v12 && *(unsigned __int16 *)(v9 + 576) < *(unsigned __int16 *)(v10 + 576))
  {
    *a3 = v9;
    *a4 = v10;
    v13 = *a3;
    v14 = *a2;
    v15 = *(char *)(*a3 + 578);
    v16 = *(char *)(*a2 + 578);
    if (v15 < v16 || v15 == v16 && *(unsigned __int16 *)(v13 + 576) < *(unsigned __int16 *)(v14 + 576))
    {
      *a2 = v13;
      *a3 = v14;
      v17 = *a2;
      v18 = *a1;
      v19 = *(char *)(*a2 + 578);
      v20 = *(char *)(*a1 + 578);
      if (v19 < v20 || v19 == v20 && *(unsigned __int16 *)(v17 + 576) < *(unsigned __int16 *)(v18 + 576))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

uint64_t sub_10001D434(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  result = sub_10001D358(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *a4;
  v13 = *(char *)(*a5 + 578);
  v14 = *(char *)(*a4 + 578);
  if (v13 < v14 || v13 == v14 && *(unsigned __int16 *)(v11 + 576) < *(unsigned __int16 *)(v12 + 576))
  {
    *a4 = v11;
    *a5 = v12;
    v15 = *a4;
    v16 = *a3;
    v17 = *(char *)(*a4 + 578);
    v18 = *(char *)(*a3 + 578);
    if (v17 < v18 || v17 == v18 && *(unsigned __int16 *)(v15 + 576) < *(unsigned __int16 *)(v16 + 576))
    {
      *a3 = v15;
      *a4 = v16;
      v19 = *a3;
      v20 = *a2;
      v21 = *(char *)(*a3 + 578);
      v22 = *(char *)(*a2 + 578);
      if (v21 < v22 || v21 == v22 && *(unsigned __int16 *)(v19 + 576) < *(unsigned __int16 *)(v20 + 576))
      {
        *a2 = v19;
        *a3 = v20;
        v23 = *a2;
        v24 = *a1;
        v25 = *(char *)(*a2 + 578);
        v26 = *(char *)(*a1 + 578);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 576) < *(unsigned __int16 *)(v24 + 576))
        {
          *a1 = v23;
          *a2 = v24;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_10001D558(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[v10];
      do
      {
        sub_10001D6BC((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *v14;
        v16 = *a1;
        v17 = *(char *)(*v14 + 578);
        v18 = *(char *)(*a1 + 578);
        if (v17 < v18
          || v17 == v18 && *(unsigned __int16 *)(v15 + 576) < *(unsigned __int16 *)(v16 + 576))
        {
          *v14 = v16;
          *a1 = v15;
          sub_10001D6BC((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v19 = (unint64_t)v8 >> 3;
      v20 = a2 - 1;
      do
      {
        v21 = *a1;
        v22 = sub_10001D80C(a1, a4, v19);
        if (v20 == v22)
        {
          *v22 = v21;
        }
        else
        {
          *v22 = *v20;
          *v20 = v21;
          sub_10001D898((uint64_t)a1, (uint64_t)(v22 + 1), a4, v22 + 1 - a1);
        }
        --v20;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_10001D6BC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      v6 = v4 >> 2;
      v7 = (v4 >> 2) + 1;
      v8 = (_QWORD *)(result + 8 * v7);
      v9 = v6 + 2;
      if (v9 < a3)
      {
        v10 = v8[1];
        v11 = *(char *)(*v8 + 578);
        v12 = *(char *)(v10 + 578);
        if (v11 < v12
          || v11 == v12 && *(unsigned __int16 *)(*v8 + 576) < *(unsigned __int16 *)(v10 + 576))
        {
          ++v8;
          v7 = v9;
        }
      }
      v13 = *v8;
      v14 = *a4;
      if (*(char *)(*v8 + 578) >= *(char *)(*a4 + 578))
      {
        v15 = *(unsigned __int8 *)(*a4 + 578);
        if (*(unsigned __int8 *)(*v8 + 578) != v15
          || *(unsigned __int16 *)(v13 + 576) >= *(unsigned __int16 *)(v14 + 576))
        {
          *a4 = v13;
          if (v5 >= v7)
          {
            while (1)
            {
              v17 = 2 * v7;
              v7 = (2 * v7) | 1;
              v16 = (_QWORD *)(result + 8 * v7);
              v18 = v17 + 2;
              if (v18 < a3)
              {
                v19 = v16[1];
                v20 = *(char *)(*v16 + 578);
                v21 = *(char *)(v19 + 578);
                if (v20 < v21
                  || v20 == v21 && *(unsigned __int16 *)(*v16 + 576) < *(unsigned __int16 *)(v19 + 576))
                {
                  ++v16;
                  v7 = v18;
                }
              }
              v22 = *v16;
              if (*(char *)(*v16 + 578) < (char)v15
                || *(unsigned __int8 *)(*v16 + 578) == v15
                && *(unsigned __int16 *)(v22 + 576) < *(unsigned __int16 *)(v14 + 576))
              {
                break;
              }
              *v8 = v22;
              v8 = v16;
              if (v5 < v7)
                goto LABEL_22;
            }
          }
          v16 = v8;
LABEL_22:
          *v16 = v14;
        }
      }
    }
  }
  return result;
}

_QWORD *sub_10001D80C(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = result;
    result += v3 + 1;
    v7 = 2 * v3;
    v3 = (2 * v3) | 1;
    v8 = v7 + 2;
    if (v8 < a3)
    {
      v9 = result[1];
      v10 = *(char *)(*result + 578);
      v11 = *(char *)(v9 + 578);
      if (v10 < v11
        || v10 == v11 && *(unsigned __int16 *)(*result + 576) < *(unsigned __int16 *)(v9 + 576))
      {
        ++result;
        v3 = v8;
      }
    }
    *v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_10001D898(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v5 = v4 >> 1;
    v6 = (uint64_t *)(result + 8 * (v4 >> 1));
    v7 = *v6;
    v8 = *(_QWORD *)(a2 - 8);
    v9 = *(unsigned __int8 *)(v8 + 578);
    if (*(char *)(*v6 + 578) < *(char *)(v8 + 578)
      || *(unsigned __int8 *)(*v6 + 578) == v9
      && *(unsigned __int16 *)(v7 + 576) < *(unsigned __int16 *)(v8 + 576))
    {
      *(_QWORD *)(a2 - 8) = v7;
      if (v4 >= 2)
      {
        while (1)
        {
          v11 = v5 - 1;
          v5 = (v5 - 1) >> 1;
          v10 = (uint64_t *)(result + 8 * v5);
          v12 = *v10;
          if (*(char *)(*v10 + 578) >= (char)v9
            && (*(unsigned __int8 *)(*v10 + 578) != v9
             || *(unsigned __int16 *)(v12 + 576) >= *(unsigned __int16 *)(v8 + 576)))
          {
            break;
          }
          *v6 = v12;
          v6 = (uint64_t *)(result + 8 * v5);
          if (v11 <= 1)
            goto LABEL_11;
        }
      }
      v10 = v6;
LABEL_11:
      *v10 = v8;
    }
  }
  return result;
}

uint64_t sub_10001D944(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t *v20;
  char v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v23 = *(a2 - 1);
        v24 = *v9;
        v25 = *(char *)(v23 + 290);
        v26 = *(char *)(*v9 + 290);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 288) < *(unsigned __int16 *)(v24 + 288))
        {
          *v9 = v23;
          *(a2 - 1) = v24;
        }
        return result;
      case 3uLL:
        return sub_10001DE48(v9, v9 + 1, a2 - 1);
      case 4uLL:
        return sub_10001E530(v9, v9 + 1, v9 + 2, a2 - 1);
      case 5uLL:
        return sub_10001E60C(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)sub_10001DCAC(v9, a2);
          else
            return (uint64_t)sub_10001DD88(v9, a2);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            sub_10001DE48(&v9[v13 >> 1], v9, a2 - 1);
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          else
          {
            sub_10001DE48(v9, &v9[v13 >> 1], a2 - 1);
            sub_10001DE48(v9 + 1, v15 - 1, a2 - 2);
            sub_10001DE48(v9 + 2, &v9[v14 + 1], a2 - 3);
            sub_10001DE48(v15 - 1, v15, &v9[v14 + 1]);
            v16 = *v9;
            *v9 = *v15;
            *v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          v17 = *(v9 - 1);
          v18 = *(char *)(v17 + 290);
          v19 = *(char *)(*v9 + 290);
          if (v18 >= v19
            && (v18 != v19 || *(unsigned __int16 *)(v17 + 288) >= *(unsigned __int16 *)(*v9 + 288)))
          {
            result = sub_10001DF7C((unsigned __int16 *)v9, (unsigned __int16 *)a2);
            v9 = (uint64_t *)result;
            goto LABEL_19;
          }
LABEL_14:
          v20 = sub_10001E154(v9, a2);
          if ((v21 & 1) == 0)
            goto LABEL_17;
          v22 = sub_10001E340(v9, v20);
          v9 = v20 + 1;
          result = sub_10001E340(v20 + 1, a2);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v22)
              continue;
LABEL_17:
            result = sub_10001D944(v8, v20, a3, -v11, a5 & 1);
            v9 = v20 + 1;
LABEL_19:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v20;
          if (v22)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)sub_10001E730(v9, a2, a2, a3);
        return result;
    }
  }
}

_QWORD *sub_10001DCAC(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v4;
        v4 = v2;
        v7 = *v5;
        v6 = v5[1];
        v8 = *(unsigned __int8 *)(v6 + 290);
        if (*(char *)(v6 + 290) < *(char *)(*v5 + 290)
          || v8 == *(unsigned __int8 *)(*v5 + 290)
          && *(unsigned __int16 *)(v6 + 288) < *(unsigned __int16 *)(v7 + 288))
        {
          v5[1] = v7;
          v9 = result;
          if (v5 != result)
          {
            v10 = v3;
            while (1)
            {
              v11 = *(_QWORD *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 290) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 290))
                {
                  v9 = v5;
                  goto LABEL_17;
                }
                if (*(unsigned __int16 *)(v6 + 288) >= *(unsigned __int16 *)(v11 + 288))
                  break;
              }
              --v5;
              *(_QWORD *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                v9 = result;
                goto LABEL_17;
              }
            }
            v9 = (_QWORD *)((char *)result + v10);
          }
LABEL_17:
          *v9 = v6;
        }
        v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_10001DD88(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = 1;
      do
      {
        v5 = v3;
        v3 = v4;
        v6 = *v2;
        v7 = result[v5];
        v8 = *(unsigned __int8 *)(*v2 + 290);
        if (*(char *)(*v2 + 290) < *(char *)(v7 + 290)
          || v8 == *(unsigned __int8 *)(v7 + 290)
          && *(unsigned __int16 *)(v6 + 288) < *(unsigned __int16 *)(v7 + 288))
        {
          *v2 = v7;
          while (1)
          {
            v9 = &result[v5];
            v10 = *(v9 - 1);
            if (*(char *)(v10 + 290) <= (char)v8
              && (v8 != *(unsigned __int8 *)(v10 + 290)
               || *(unsigned __int16 *)(v6 + 288) >= *(unsigned __int16 *)(v10 + 288)))
            {
              break;
            }
            --v5;
            *v9 = v10;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        v4 = v3 + 1;
        v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_10001DE48(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;

  v3 = *a2;
  v4 = *a1;
  v5 = *(unsigned __int8 *)(*a2 + 290);
  v6 = *(unsigned __int8 *)(*a1 + 290);
  if (*(char *)(*a2 + 290) < *(char *)(*a1 + 290)
    || v5 == v6 && *(unsigned __int16 *)(v3 + 288) < *(unsigned __int16 *)(v4 + 288))
  {
    v7 = *a3;
    if (*(char *)(*a3 + 290) < (char)v5
      || *(unsigned __int8 *)(*a3 + 290) == v5
      && *(unsigned __int16 *)(v7 + 288) < *(unsigned __int16 *)(v3 + 288))
    {
      *a1 = v7;
      *a3 = v4;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      v14 = *a3;
      if (*(char *)(*a3 + 290) < (char)v6
        || *(unsigned __int8 *)(*a3 + 290) == v6
        && *(unsigned __int16 *)(v14 + 288) < *(unsigned __int16 *)(v4 + 288))
      {
        *a2 = v14;
        *a3 = v4;
        return 2;
      }
    }
    return 1;
  }
  v9 = *a3;
  if (*(char *)(*a3 + 290) < (char)v5
    || *(unsigned __int8 *)(*a3 + 290) == v5
    && *(unsigned __int16 *)(v9 + 288) < *(unsigned __int16 *)(v3 + 288))
  {
    *a2 = v9;
    *a3 = v3;
    v10 = *a2;
    v11 = *a1;
    v12 = *(char *)(*a2 + 290);
    v13 = *(char *)(*a1 + 290);
    if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(v10 + 288) < *(unsigned __int16 *)(v11 + 288))
    {
      *a1 = v10;
      *a2 = v11;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_10001DF7C(unsigned __int16 *a1, unsigned __int16 *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t i;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)a1;
  v3 = *((_QWORD *)a2 - 1);
  v4 = *(unsigned __int8 *)(*(_QWORD *)a1 + 290);
  v5 = *(char *)(v3 + 290);
  if (*(char *)(*(_QWORD *)a1 + 290) < (int)v5
    || v4 == *(unsigned __int8 *)(v3 + 290)
    && (v5 = *(unsigned __int16 *)(v2 + 288), v5 < *(unsigned __int16 *)(v3 + 288)))
  {
    for (i = (unint64_t)(a1 + 4); (unsigned __int16 *)i != a2; i += 8)
    {
      v5 = *(_QWORD *)i;
      if (*(char *)(*(_QWORD *)i + 290) > (char)v4)
        goto LABEL_16;
      if (v4 == *(unsigned __int8 *)(*(_QWORD *)i + 290))
      {
        v5 = *(unsigned __int16 *)(v5 + 288);
        if (*(unsigned __int16 *)(v2 + 288) < v5)
          goto LABEL_16;
      }
    }
  }
  else
  {
    for (i = (unint64_t)(a1 + 4);
          i < (unint64_t)a2
       && *(char *)(*(_QWORD *)i + 290) <= (char)v4
       && (v4 != *(unsigned __int8 *)(*(_QWORD *)i + 290)
        || *(unsigned __int16 *)(v2 + 288) >= *(unsigned __int16 *)(*(_QWORD *)i + 288));
LABEL_16:
    v5 = (unint64_t)a2;
    if (i >= (unint64_t)a2)
      goto LABEL_25;
    if (a2 != a1)
    {
      v5 = (unint64_t)(a2 - 4);
      do
      {
        if (*(char *)(*(_QWORD *)v5 + 290) <= (char)v4
          && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 290)
           || *(unsigned __int16 *)(v2 + 288) >= *(unsigned __int16 *)(*(_QWORD *)v5 + 288)))
        {
          goto LABEL_25;
        }
        v7 = v5 == (_QWORD)a1;
        v5 -= 8;
      }
      while (!v7);
    }
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5)
      break;
    v8 = *(_QWORD *)i;
    v9 = *(_QWORD *)v5;
LABEL_27:
    *(_QWORD *)i = v9;
    i += 8;
    *(_QWORD *)v5 = v8;
    while ((unsigned __int16 *)i != a2)
    {
      v8 = *(_QWORD *)i;
      if (*(char *)(*(_QWORD *)i + 290) > (char)v4
        || v4 == *(unsigned __int8 *)(*(_QWORD *)i + 290)
        && *(unsigned __int16 *)(v2 + 288) < *(unsigned __int16 *)(v8 + 288))
      {
        if ((unsigned __int16 *)v5 == a1)
          goto LABEL_24;
        v5 -= 8;
        while (1)
        {
          v9 = *(_QWORD *)v5;
          if (*(char *)(*(_QWORD *)v5 + 290) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 290)
             || *(unsigned __int16 *)(v2 + 288) >= *(unsigned __int16 *)(v9 + 288)))
          {
            break;
          }
          v7 = v5 == (_QWORD)a1;
          v5 -= 8;
          if (v7)
            goto LABEL_24;
        }
        if (i < v5)
          goto LABEL_27;
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((unsigned __int16 *)(i - 8) != a1)
    *(_QWORD *)a1 = *(_QWORD *)(i - 8);
  *(_QWORD *)(i - 8) = v2;
  return i;
}

uint64_t *sub_10001E154(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;

  v4 = (_DWORD)a1 + 8;
  v5 = *a1;
  if (a1 + 1 != a2)
  {
    v4 = *(unsigned __int8 *)(v5 + 290);
    v6 = 1;
    while (1)
    {
      v3 = a1[v6];
      if (*(char *)(v3 + 290) >= (char)v4
        && (*(unsigned __int8 *)(v3 + 290) != v4
         || *(unsigned __int16 *)(v3 + 288) >= *(unsigned __int16 *)(v5 + 288)))
      {
        break;
      }
      v2 = &a1[++v6];
      if (&a1[v6] == a2)
        goto LABEL_16;
    }
    v2 = &a1[v6];
    if (v6 == 1)
      goto LABEL_17;
    if (a2 != a1)
    {
      v7 = a2 - 1;
      do
      {
        if (*(char *)(*v7 + 290) < (char)v4
          || *(unsigned __int8 *)(*v7 + 290) == v4
          && *(unsigned __int16 *)(*v7 + 288) < *(unsigned __int16 *)(v5 + 288))
        {
          goto LABEL_29;
        }
        v8 = v7-- == a1;
      }
      while (!v8);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    v7 = a2;
    if (v2 < a2)
    {
      v7 = a2 - 1;
      v9 = *(a2 - 1);
      if (*(char *)(v9 + 290) >= (char)v4)
      {
        v10 = *(unsigned __int8 *)(v9 + 290);
        do
        {
          if (v10 == v4)
          {
            if (*(unsigned __int16 *)(v9 + 288) < *(unsigned __int16 *)(v5 + 288) || v2 >= v7)
              break;
          }
          else if (v2 >= v7)
          {
            break;
          }
          v12 = *--v7;
          v9 = v12;
          v10 = *(unsigned __int8 *)(v12 + 290);
        }
        while (*(char *)(v12 + 290) >= (char)v4);
      }
    }
LABEL_29:
    if (v2 >= v7)
      break;
    v13 = *v7;
    v14 = v7;
    v15 = v2;
LABEL_31:
    *v15++ = v13;
    *v14 = v3;
    while (v15 != a2)
    {
      v3 = *v15;
      if (*(char *)(*v15 + 290) >= (char)v4
        && (*(unsigned __int8 *)(*v15 + 290) != v4
         || *(unsigned __int16 *)(v3 + 288) >= *(unsigned __int16 *)(v5 + 288)))
      {
        if (v14 == a1)
          goto LABEL_16;
        --v14;
        while (1)
        {
          v13 = *v14;
          if (*(char *)(*v14 + 290) < (char)v4
            || *(unsigned __int8 *)(*v14 + 290) == v4
            && *(unsigned __int16 *)(v13 + 288) < *(unsigned __int16 *)(v5 + 288))
          {
            break;
          }
          v8 = v14-- == a1;
          if (v8)
            goto LABEL_16;
        }
        if (v15 < v14)
          goto LABEL_31;
        goto LABEL_48;
      }
      ++v15;
    }
  }
  v15 = v2;
LABEL_48:
  v16 = v15 - 1;
  if (v15 - 1 != a1)
    *a1 = *v16;
  *v16 = v5;
  return v15 - 1;
}

BOOL sub_10001E340(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a2 - a1;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 1);
      v7 = *a1;
      v8 = *(char *)(v6 + 290);
      v9 = *(char *)(*a1 + 290);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 288) < *(unsigned __int16 *)(v7 + 288))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_10001DE48(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_10001E530(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_10001E60C(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      v10 = a1 + 2;
      sub_10001DE48(a1, a1 + 1, a1 + 2);
      v11 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = *v11;
    v15 = *v10;
    v16 = *(unsigned __int8 *)(*v11 + 290);
    if (*(char *)(*v11 + 290) < *(char *)(*v10 + 290)
      || v16 == *(unsigned __int8 *)(*v10 + 290)
      && *(unsigned __int16 *)(v14 + 288) < *(unsigned __int16 *)(v15 + 288))
    {
      *v11 = v15;
      v17 = a1;
      if (v10 != a1)
      {
        v18 = v12;
        while (1)
        {
          v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 290) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 290))
            {
              v17 = v10;
              goto LABEL_20;
            }
            if (*(unsigned __int16 *)(v14 + 288) >= *(unsigned __int16 *)(v19 + 288))
              break;
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            v17 = a1;
            goto LABEL_20;
          }
        }
        v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *v17 = v14;
      if (++v13 == 8)
        return v11 + 1 == a2;
    }
    v10 = v11;
    v12 += 8;
    if (++v11 == a2)
      return 1;
  }
}

uint64_t sub_10001E530(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;

  result = sub_10001DE48(a1, a2, a3);
  v9 = *a4;
  v10 = *a3;
  v11 = *(char *)(*a4 + 290);
  v12 = *(char *)(*a3 + 290);
  if (v11 < v12 || v11 == v12 && *(unsigned __int16 *)(v9 + 288) < *(unsigned __int16 *)(v10 + 288))
  {
    *a3 = v9;
    *a4 = v10;
    v13 = *a3;
    v14 = *a2;
    v15 = *(char *)(*a3 + 290);
    v16 = *(char *)(*a2 + 290);
    if (v15 < v16 || v15 == v16 && *(unsigned __int16 *)(v13 + 288) < *(unsigned __int16 *)(v14 + 288))
    {
      *a2 = v13;
      *a3 = v14;
      v17 = *a2;
      v18 = *a1;
      v19 = *(char *)(*a2 + 290);
      v20 = *(char *)(*a1 + 290);
      if (v19 < v20 || v19 == v20 && *(unsigned __int16 *)(v17 + 288) < *(unsigned __int16 *)(v18 + 288))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

uint64_t sub_10001E60C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  result = sub_10001E530(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *a4;
  v13 = *(char *)(*a5 + 290);
  v14 = *(char *)(*a4 + 290);
  if (v13 < v14 || v13 == v14 && *(unsigned __int16 *)(v11 + 288) < *(unsigned __int16 *)(v12 + 288))
  {
    *a4 = v11;
    *a5 = v12;
    v15 = *a4;
    v16 = *a3;
    v17 = *(char *)(*a4 + 290);
    v18 = *(char *)(*a3 + 290);
    if (v17 < v18 || v17 == v18 && *(unsigned __int16 *)(v15 + 288) < *(unsigned __int16 *)(v16 + 288))
    {
      *a3 = v15;
      *a4 = v16;
      v19 = *a3;
      v20 = *a2;
      v21 = *(char *)(*a3 + 290);
      v22 = *(char *)(*a2 + 290);
      if (v21 < v22 || v21 == v22 && *(unsigned __int16 *)(v19 + 288) < *(unsigned __int16 *)(v20 + 288))
      {
        *a2 = v19;
        *a3 = v20;
        v23 = *a2;
        v24 = *a1;
        v25 = *(char *)(*a2 + 290);
        v26 = *(char *)(*a1 + 290);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 288) < *(unsigned __int16 *)(v24 + 288))
        {
          *a1 = v23;
          *a2 = v24;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_10001E730(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[v10];
      do
      {
        sub_10001E894((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *v14;
        v16 = *a1;
        v17 = *(char *)(*v14 + 290);
        v18 = *(char *)(*a1 + 290);
        if (v17 < v18
          || v17 == v18 && *(unsigned __int16 *)(v15 + 288) < *(unsigned __int16 *)(v16 + 288))
        {
          *v14 = v16;
          *a1 = v15;
          sub_10001E894((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v19 = (unint64_t)v8 >> 3;
      v20 = a2 - 1;
      do
      {
        v21 = *a1;
        v22 = sub_10001E9E4(a1, a4, v19);
        if (v20 == v22)
        {
          *v22 = v21;
        }
        else
        {
          *v22 = *v20;
          *v20 = v21;
          sub_10001EA70((uint64_t)a1, (uint64_t)(v22 + 1), a4, v22 + 1 - a1);
        }
        --v20;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_10001E894(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      v6 = v4 >> 2;
      v7 = (v4 >> 2) + 1;
      v8 = (_QWORD *)(result + 8 * v7);
      v9 = v6 + 2;
      if (v9 < a3)
      {
        v10 = v8[1];
        v11 = *(char *)(*v8 + 290);
        v12 = *(char *)(v10 + 290);
        if (v11 < v12
          || v11 == v12 && *(unsigned __int16 *)(*v8 + 288) < *(unsigned __int16 *)(v10 + 288))
        {
          ++v8;
          v7 = v9;
        }
      }
      v13 = *v8;
      v14 = *a4;
      if (*(char *)(*v8 + 290) >= *(char *)(*a4 + 290))
      {
        v15 = *(unsigned __int8 *)(*a4 + 290);
        if (*(unsigned __int8 *)(*v8 + 290) != v15
          || *(unsigned __int16 *)(v13 + 288) >= *(unsigned __int16 *)(v14 + 288))
        {
          *a4 = v13;
          if (v5 >= v7)
          {
            while (1)
            {
              v17 = 2 * v7;
              v7 = (2 * v7) | 1;
              v16 = (_QWORD *)(result + 8 * v7);
              v18 = v17 + 2;
              if (v18 < a3)
              {
                v19 = v16[1];
                v20 = *(char *)(*v16 + 290);
                v21 = *(char *)(v19 + 290);
                if (v20 < v21
                  || v20 == v21 && *(unsigned __int16 *)(*v16 + 288) < *(unsigned __int16 *)(v19 + 288))
                {
                  ++v16;
                  v7 = v18;
                }
              }
              v22 = *v16;
              if (*(char *)(*v16 + 290) < (char)v15
                || *(unsigned __int8 *)(*v16 + 290) == v15
                && *(unsigned __int16 *)(v22 + 288) < *(unsigned __int16 *)(v14 + 288))
              {
                break;
              }
              *v8 = v22;
              v8 = v16;
              if (v5 < v7)
                goto LABEL_22;
            }
          }
          v16 = v8;
LABEL_22:
          *v16 = v14;
        }
      }
    }
  }
  return result;
}

_QWORD *sub_10001E9E4(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = result;
    result += v3 + 1;
    v7 = 2 * v3;
    v3 = (2 * v3) | 1;
    v8 = v7 + 2;
    if (v8 < a3)
    {
      v9 = result[1];
      v10 = *(char *)(*result + 290);
      v11 = *(char *)(v9 + 290);
      if (v10 < v11
        || v10 == v11 && *(unsigned __int16 *)(*result + 288) < *(unsigned __int16 *)(v9 + 288))
      {
        ++result;
        v3 = v8;
      }
    }
    *v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_10001EA70(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v5 = v4 >> 1;
    v6 = (uint64_t *)(result + 8 * (v4 >> 1));
    v7 = *v6;
    v8 = *(_QWORD *)(a2 - 8);
    v9 = *(unsigned __int8 *)(v8 + 290);
    if (*(char *)(*v6 + 290) < *(char *)(v8 + 290)
      || *(unsigned __int8 *)(*v6 + 290) == v9
      && *(unsigned __int16 *)(v7 + 288) < *(unsigned __int16 *)(v8 + 288))
    {
      *(_QWORD *)(a2 - 8) = v7;
      if (v4 >= 2)
      {
        while (1)
        {
          v11 = v5 - 1;
          v5 = (v5 - 1) >> 1;
          v10 = (uint64_t *)(result + 8 * v5);
          v12 = *v10;
          if (*(char *)(*v10 + 290) >= (char)v9
            && (*(unsigned __int8 *)(*v10 + 290) != v9
             || *(unsigned __int16 *)(v12 + 288) >= *(unsigned __int16 *)(v8 + 288)))
          {
            break;
          }
          *v6 = v12;
          v6 = (uint64_t *)(result + 8 * v5);
          if (v11 <= 1)
            goto LABEL_11;
        }
      }
      v10 = v6;
LABEL_11:
      *v10 = v8;
    }
  }
  return result;
}

uint64_t sub_10001EB1C(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t *v20;
  char v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v23 = *(a2 - 1);
        v24 = *v9;
        v25 = *(char *)(v23 + 338);
        v26 = *(char *)(*v9 + 338);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 336) < *(unsigned __int16 *)(v24 + 336))
        {
          *v9 = v23;
          *(a2 - 1) = v24;
        }
        return result;
      case 3uLL:
        return sub_10001F020(v9, v9 + 1, a2 - 1);
      case 4uLL:
        return sub_10001F708(v9, v9 + 1, v9 + 2, a2 - 1);
      case 5uLL:
        return sub_10001F7E4(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)sub_10001EE84(v9, a2);
          else
            return (uint64_t)sub_10001EF60(v9, a2);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            sub_10001F020(&v9[v13 >> 1], v9, a2 - 1);
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          else
          {
            sub_10001F020(v9, &v9[v13 >> 1], a2 - 1);
            sub_10001F020(v9 + 1, v15 - 1, a2 - 2);
            sub_10001F020(v9 + 2, &v9[v14 + 1], a2 - 3);
            sub_10001F020(v15 - 1, v15, &v9[v14 + 1]);
            v16 = *v9;
            *v9 = *v15;
            *v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          v17 = *(v9 - 1);
          v18 = *(char *)(v17 + 338);
          v19 = *(char *)(*v9 + 338);
          if (v18 >= v19
            && (v18 != v19 || *(unsigned __int16 *)(v17 + 336) >= *(unsigned __int16 *)(*v9 + 336)))
          {
            result = sub_10001F154((unsigned __int16 *)v9, (unsigned __int16 *)a2);
            v9 = (uint64_t *)result;
            goto LABEL_19;
          }
LABEL_14:
          v20 = sub_10001F32C(v9, a2);
          if ((v21 & 1) == 0)
            goto LABEL_17;
          v22 = sub_10001F518(v9, v20);
          v9 = v20 + 1;
          result = sub_10001F518(v20 + 1, a2);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v22)
              continue;
LABEL_17:
            result = sub_10001EB1C(v8, v20, a3, -v11, a5 & 1);
            v9 = v20 + 1;
LABEL_19:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v20;
          if (v22)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)sub_10001F908(v9, a2, a2, a3);
        return result;
    }
  }
}

_QWORD *sub_10001EE84(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v4;
        v4 = v2;
        v7 = *v5;
        v6 = v5[1];
        v8 = *(unsigned __int8 *)(v6 + 338);
        if (*(char *)(v6 + 338) < *(char *)(*v5 + 338)
          || v8 == *(unsigned __int8 *)(*v5 + 338)
          && *(unsigned __int16 *)(v6 + 336) < *(unsigned __int16 *)(v7 + 336))
        {
          v5[1] = v7;
          v9 = result;
          if (v5 != result)
          {
            v10 = v3;
            while (1)
            {
              v11 = *(_QWORD *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 338) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 338))
                {
                  v9 = v5;
                  goto LABEL_17;
                }
                if (*(unsigned __int16 *)(v6 + 336) >= *(unsigned __int16 *)(v11 + 336))
                  break;
              }
              --v5;
              *(_QWORD *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                v9 = result;
                goto LABEL_17;
              }
            }
            v9 = (_QWORD *)((char *)result + v10);
          }
LABEL_17:
          *v9 = v6;
        }
        v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_10001EF60(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = 1;
      do
      {
        v5 = v3;
        v3 = v4;
        v6 = *v2;
        v7 = result[v5];
        v8 = *(unsigned __int8 *)(*v2 + 338);
        if (*(char *)(*v2 + 338) < *(char *)(v7 + 338)
          || v8 == *(unsigned __int8 *)(v7 + 338)
          && *(unsigned __int16 *)(v6 + 336) < *(unsigned __int16 *)(v7 + 336))
        {
          *v2 = v7;
          while (1)
          {
            v9 = &result[v5];
            v10 = *(v9 - 1);
            if (*(char *)(v10 + 338) <= (char)v8
              && (v8 != *(unsigned __int8 *)(v10 + 338)
               || *(unsigned __int16 *)(v6 + 336) >= *(unsigned __int16 *)(v10 + 336)))
            {
              break;
            }
            --v5;
            *v9 = v10;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        v4 = v3 + 1;
        v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_10001F020(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;

  v3 = *a2;
  v4 = *a1;
  v5 = *(unsigned __int8 *)(*a2 + 338);
  v6 = *(unsigned __int8 *)(*a1 + 338);
  if (*(char *)(*a2 + 338) < *(char *)(*a1 + 338)
    || v5 == v6 && *(unsigned __int16 *)(v3 + 336) < *(unsigned __int16 *)(v4 + 336))
  {
    v7 = *a3;
    if (*(char *)(*a3 + 338) < (char)v5
      || *(unsigned __int8 *)(*a3 + 338) == v5
      && *(unsigned __int16 *)(v7 + 336) < *(unsigned __int16 *)(v3 + 336))
    {
      *a1 = v7;
      *a3 = v4;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      v14 = *a3;
      if (*(char *)(*a3 + 338) < (char)v6
        || *(unsigned __int8 *)(*a3 + 338) == v6
        && *(unsigned __int16 *)(v14 + 336) < *(unsigned __int16 *)(v4 + 336))
      {
        *a2 = v14;
        *a3 = v4;
        return 2;
      }
    }
    return 1;
  }
  v9 = *a3;
  if (*(char *)(*a3 + 338) < (char)v5
    || *(unsigned __int8 *)(*a3 + 338) == v5
    && *(unsigned __int16 *)(v9 + 336) < *(unsigned __int16 *)(v3 + 336))
  {
    *a2 = v9;
    *a3 = v3;
    v10 = *a2;
    v11 = *a1;
    v12 = *(char *)(*a2 + 338);
    v13 = *(char *)(*a1 + 338);
    if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(v10 + 336) < *(unsigned __int16 *)(v11 + 336))
    {
      *a1 = v10;
      *a2 = v11;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_10001F154(unsigned __int16 *a1, unsigned __int16 *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t i;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)a1;
  v3 = *((_QWORD *)a2 - 1);
  v4 = *(unsigned __int8 *)(*(_QWORD *)a1 + 338);
  v5 = *(char *)(v3 + 338);
  if (*(char *)(*(_QWORD *)a1 + 338) < (int)v5
    || v4 == *(unsigned __int8 *)(v3 + 338)
    && (v5 = *(unsigned __int16 *)(v2 + 336), v5 < *(unsigned __int16 *)(v3 + 336)))
  {
    for (i = (unint64_t)(a1 + 4); (unsigned __int16 *)i != a2; i += 8)
    {
      v5 = *(_QWORD *)i;
      if (*(char *)(*(_QWORD *)i + 338) > (char)v4)
        goto LABEL_16;
      if (v4 == *(unsigned __int8 *)(*(_QWORD *)i + 338))
      {
        v5 = *(unsigned __int16 *)(v5 + 336);
        if (*(unsigned __int16 *)(v2 + 336) < v5)
          goto LABEL_16;
      }
    }
  }
  else
  {
    for (i = (unint64_t)(a1 + 4);
          i < (unint64_t)a2
       && *(char *)(*(_QWORD *)i + 338) <= (char)v4
       && (v4 != *(unsigned __int8 *)(*(_QWORD *)i + 338)
        || *(unsigned __int16 *)(v2 + 336) >= *(unsigned __int16 *)(*(_QWORD *)i + 336));
LABEL_16:
    v5 = (unint64_t)a2;
    if (i >= (unint64_t)a2)
      goto LABEL_25;
    if (a2 != a1)
    {
      v5 = (unint64_t)(a2 - 4);
      do
      {
        if (*(char *)(*(_QWORD *)v5 + 338) <= (char)v4
          && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 338)
           || *(unsigned __int16 *)(v2 + 336) >= *(unsigned __int16 *)(*(_QWORD *)v5 + 336)))
        {
          goto LABEL_25;
        }
        v7 = v5 == (_QWORD)a1;
        v5 -= 8;
      }
      while (!v7);
    }
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5)
      break;
    v8 = *(_QWORD *)i;
    v9 = *(_QWORD *)v5;
LABEL_27:
    *(_QWORD *)i = v9;
    i += 8;
    *(_QWORD *)v5 = v8;
    while ((unsigned __int16 *)i != a2)
    {
      v8 = *(_QWORD *)i;
      if (*(char *)(*(_QWORD *)i + 338) > (char)v4
        || v4 == *(unsigned __int8 *)(*(_QWORD *)i + 338)
        && *(unsigned __int16 *)(v2 + 336) < *(unsigned __int16 *)(v8 + 336))
      {
        if ((unsigned __int16 *)v5 == a1)
          goto LABEL_24;
        v5 -= 8;
        while (1)
        {
          v9 = *(_QWORD *)v5;
          if (*(char *)(*(_QWORD *)v5 + 338) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 338)
             || *(unsigned __int16 *)(v2 + 336) >= *(unsigned __int16 *)(v9 + 336)))
          {
            break;
          }
          v7 = v5 == (_QWORD)a1;
          v5 -= 8;
          if (v7)
            goto LABEL_24;
        }
        if (i < v5)
          goto LABEL_27;
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((unsigned __int16 *)(i - 8) != a1)
    *(_QWORD *)a1 = *(_QWORD *)(i - 8);
  *(_QWORD *)(i - 8) = v2;
  return i;
}

uint64_t *sub_10001F32C(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;

  v4 = (_DWORD)a1 + 8;
  v5 = *a1;
  if (a1 + 1 != a2)
  {
    v4 = *(unsigned __int8 *)(v5 + 338);
    v6 = 1;
    while (1)
    {
      v3 = a1[v6];
      if (*(char *)(v3 + 338) >= (char)v4
        && (*(unsigned __int8 *)(v3 + 338) != v4
         || *(unsigned __int16 *)(v3 + 336) >= *(unsigned __int16 *)(v5 + 336)))
      {
        break;
      }
      v2 = &a1[++v6];
      if (&a1[v6] == a2)
        goto LABEL_16;
    }
    v2 = &a1[v6];
    if (v6 == 1)
      goto LABEL_17;
    if (a2 != a1)
    {
      v7 = a2 - 1;
      do
      {
        if (*(char *)(*v7 + 338) < (char)v4
          || *(unsigned __int8 *)(*v7 + 338) == v4
          && *(unsigned __int16 *)(*v7 + 336) < *(unsigned __int16 *)(v5 + 336))
        {
          goto LABEL_29;
        }
        v8 = v7-- == a1;
      }
      while (!v8);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    v7 = a2;
    if (v2 < a2)
    {
      v7 = a2 - 1;
      v9 = *(a2 - 1);
      if (*(char *)(v9 + 338) >= (char)v4)
      {
        v10 = *(unsigned __int8 *)(v9 + 338);
        do
        {
          if (v10 == v4)
          {
            if (*(unsigned __int16 *)(v9 + 336) < *(unsigned __int16 *)(v5 + 336) || v2 >= v7)
              break;
          }
          else if (v2 >= v7)
          {
            break;
          }
          v12 = *--v7;
          v9 = v12;
          v10 = *(unsigned __int8 *)(v12 + 338);
        }
        while (*(char *)(v12 + 338) >= (char)v4);
      }
    }
LABEL_29:
    if (v2 >= v7)
      break;
    v13 = *v7;
    v14 = v7;
    v15 = v2;
LABEL_31:
    *v15++ = v13;
    *v14 = v3;
    while (v15 != a2)
    {
      v3 = *v15;
      if (*(char *)(*v15 + 338) >= (char)v4
        && (*(unsigned __int8 *)(*v15 + 338) != v4
         || *(unsigned __int16 *)(v3 + 336) >= *(unsigned __int16 *)(v5 + 336)))
      {
        if (v14 == a1)
          goto LABEL_16;
        --v14;
        while (1)
        {
          v13 = *v14;
          if (*(char *)(*v14 + 338) < (char)v4
            || *(unsigned __int8 *)(*v14 + 338) == v4
            && *(unsigned __int16 *)(v13 + 336) < *(unsigned __int16 *)(v5 + 336))
          {
            break;
          }
          v8 = v14-- == a1;
          if (v8)
            goto LABEL_16;
        }
        if (v15 < v14)
          goto LABEL_31;
        goto LABEL_48;
      }
      ++v15;
    }
  }
  v15 = v2;
LABEL_48:
  v16 = v15 - 1;
  if (v15 - 1 != a1)
    *a1 = *v16;
  *v16 = v5;
  return v15 - 1;
}

BOOL sub_10001F518(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a2 - a1;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 1);
      v7 = *a1;
      v8 = *(char *)(v6 + 338);
      v9 = *(char *)(*a1 + 338);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 336) < *(unsigned __int16 *)(v7 + 336))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_10001F020(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_10001F708(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_10001F7E4(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      v10 = a1 + 2;
      sub_10001F020(a1, a1 + 1, a1 + 2);
      v11 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = *v11;
    v15 = *v10;
    v16 = *(unsigned __int8 *)(*v11 + 338);
    if (*(char *)(*v11 + 338) < *(char *)(*v10 + 338)
      || v16 == *(unsigned __int8 *)(*v10 + 338)
      && *(unsigned __int16 *)(v14 + 336) < *(unsigned __int16 *)(v15 + 336))
    {
      *v11 = v15;
      v17 = a1;
      if (v10 != a1)
      {
        v18 = v12;
        while (1)
        {
          v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 338) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 338))
            {
              v17 = v10;
              goto LABEL_20;
            }
            if (*(unsigned __int16 *)(v14 + 336) >= *(unsigned __int16 *)(v19 + 336))
              break;
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            v17 = a1;
            goto LABEL_20;
          }
        }
        v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *v17 = v14;
      if (++v13 == 8)
        return v11 + 1 == a2;
    }
    v10 = v11;
    v12 += 8;
    if (++v11 == a2)
      return 1;
  }
}

uint64_t sub_10001F708(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;

  result = sub_10001F020(a1, a2, a3);
  v9 = *a4;
  v10 = *a3;
  v11 = *(char *)(*a4 + 338);
  v12 = *(char *)(*a3 + 338);
  if (v11 < v12 || v11 == v12 && *(unsigned __int16 *)(v9 + 336) < *(unsigned __int16 *)(v10 + 336))
  {
    *a3 = v9;
    *a4 = v10;
    v13 = *a3;
    v14 = *a2;
    v15 = *(char *)(*a3 + 338);
    v16 = *(char *)(*a2 + 338);
    if (v15 < v16 || v15 == v16 && *(unsigned __int16 *)(v13 + 336) < *(unsigned __int16 *)(v14 + 336))
    {
      *a2 = v13;
      *a3 = v14;
      v17 = *a2;
      v18 = *a1;
      v19 = *(char *)(*a2 + 338);
      v20 = *(char *)(*a1 + 338);
      if (v19 < v20 || v19 == v20 && *(unsigned __int16 *)(v17 + 336) < *(unsigned __int16 *)(v18 + 336))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

uint64_t sub_10001F7E4(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  result = sub_10001F708(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *a4;
  v13 = *(char *)(*a5 + 338);
  v14 = *(char *)(*a4 + 338);
  if (v13 < v14 || v13 == v14 && *(unsigned __int16 *)(v11 + 336) < *(unsigned __int16 *)(v12 + 336))
  {
    *a4 = v11;
    *a5 = v12;
    v15 = *a4;
    v16 = *a3;
    v17 = *(char *)(*a4 + 338);
    v18 = *(char *)(*a3 + 338);
    if (v17 < v18 || v17 == v18 && *(unsigned __int16 *)(v15 + 336) < *(unsigned __int16 *)(v16 + 336))
    {
      *a3 = v15;
      *a4 = v16;
      v19 = *a3;
      v20 = *a2;
      v21 = *(char *)(*a3 + 338);
      v22 = *(char *)(*a2 + 338);
      if (v21 < v22 || v21 == v22 && *(unsigned __int16 *)(v19 + 336) < *(unsigned __int16 *)(v20 + 336))
      {
        *a2 = v19;
        *a3 = v20;
        v23 = *a2;
        v24 = *a1;
        v25 = *(char *)(*a2 + 338);
        v26 = *(char *)(*a1 + 338);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 336) < *(unsigned __int16 *)(v24 + 336))
        {
          *a1 = v23;
          *a2 = v24;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_10001F908(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[v10];
      do
      {
        sub_10001FA6C((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *v14;
        v16 = *a1;
        v17 = *(char *)(*v14 + 338);
        v18 = *(char *)(*a1 + 338);
        if (v17 < v18
          || v17 == v18 && *(unsigned __int16 *)(v15 + 336) < *(unsigned __int16 *)(v16 + 336))
        {
          *v14 = v16;
          *a1 = v15;
          sub_10001FA6C((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v19 = (unint64_t)v8 >> 3;
      v20 = a2 - 1;
      do
      {
        v21 = *a1;
        v22 = sub_10001FBBC(a1, a4, v19);
        if (v20 == v22)
        {
          *v22 = v21;
        }
        else
        {
          *v22 = *v20;
          *v20 = v21;
          sub_10001FC48((uint64_t)a1, (uint64_t)(v22 + 1), a4, v22 + 1 - a1);
        }
        --v20;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_10001FA6C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      v6 = v4 >> 2;
      v7 = (v4 >> 2) + 1;
      v8 = (_QWORD *)(result + 8 * v7);
      v9 = v6 + 2;
      if (v9 < a3)
      {
        v10 = v8[1];
        v11 = *(char *)(*v8 + 338);
        v12 = *(char *)(v10 + 338);
        if (v11 < v12
          || v11 == v12 && *(unsigned __int16 *)(*v8 + 336) < *(unsigned __int16 *)(v10 + 336))
        {
          ++v8;
          v7 = v9;
        }
      }
      v13 = *v8;
      v14 = *a4;
      if (*(char *)(*v8 + 338) >= *(char *)(*a4 + 338))
      {
        v15 = *(unsigned __int8 *)(*a4 + 338);
        if (*(unsigned __int8 *)(*v8 + 338) != v15
          || *(unsigned __int16 *)(v13 + 336) >= *(unsigned __int16 *)(v14 + 336))
        {
          *a4 = v13;
          if (v5 >= v7)
          {
            while (1)
            {
              v17 = 2 * v7;
              v7 = (2 * v7) | 1;
              v16 = (_QWORD *)(result + 8 * v7);
              v18 = v17 + 2;
              if (v18 < a3)
              {
                v19 = v16[1];
                v20 = *(char *)(*v16 + 338);
                v21 = *(char *)(v19 + 338);
                if (v20 < v21
                  || v20 == v21 && *(unsigned __int16 *)(*v16 + 336) < *(unsigned __int16 *)(v19 + 336))
                {
                  ++v16;
                  v7 = v18;
                }
              }
              v22 = *v16;
              if (*(char *)(*v16 + 338) < (char)v15
                || *(unsigned __int8 *)(*v16 + 338) == v15
                && *(unsigned __int16 *)(v22 + 336) < *(unsigned __int16 *)(v14 + 336))
              {
                break;
              }
              *v8 = v22;
              v8 = v16;
              if (v5 < v7)
                goto LABEL_22;
            }
          }
          v16 = v8;
LABEL_22:
          *v16 = v14;
        }
      }
    }
  }
  return result;
}

_QWORD *sub_10001FBBC(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = result;
    result += v3 + 1;
    v7 = 2 * v3;
    v3 = (2 * v3) | 1;
    v8 = v7 + 2;
    if (v8 < a3)
    {
      v9 = result[1];
      v10 = *(char *)(*result + 338);
      v11 = *(char *)(v9 + 338);
      if (v10 < v11
        || v10 == v11 && *(unsigned __int16 *)(*result + 336) < *(unsigned __int16 *)(v9 + 336))
      {
        ++result;
        v3 = v8;
      }
    }
    *v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_10001FC48(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v5 = v4 >> 1;
    v6 = (uint64_t *)(result + 8 * (v4 >> 1));
    v7 = *v6;
    v8 = *(_QWORD *)(a2 - 8);
    v9 = *(unsigned __int8 *)(v8 + 338);
    if (*(char *)(*v6 + 338) < *(char *)(v8 + 338)
      || *(unsigned __int8 *)(*v6 + 338) == v9
      && *(unsigned __int16 *)(v7 + 336) < *(unsigned __int16 *)(v8 + 336))
    {
      *(_QWORD *)(a2 - 8) = v7;
      if (v4 >= 2)
      {
        while (1)
        {
          v11 = v5 - 1;
          v5 = (v5 - 1) >> 1;
          v10 = (uint64_t *)(result + 8 * v5);
          v12 = *v10;
          if (*(char *)(*v10 + 338) >= (char)v9
            && (*(unsigned __int8 *)(*v10 + 338) != v9
             || *(unsigned __int16 *)(v12 + 336) >= *(unsigned __int16 *)(v8 + 336)))
          {
            break;
          }
          *v6 = v12;
          v6 = (uint64_t *)(result + 8 * v5);
          if (v11 <= 1)
            goto LABEL_11;
        }
      }
      v10 = v6;
LABEL_11:
      *v10 = v8;
    }
  }
  return result;
}

uint64_t sub_10001FCF4(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t *v20;
  char v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v23 = *(a2 - 1);
        v24 = *v9;
        v25 = *(char *)(v23 + 6526);
        v26 = *(char *)(*v9 + 6526);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 6524) < *(unsigned __int16 *)(v24 + 6524))
        {
          *v9 = v23;
          *(a2 - 1) = v24;
        }
        return result;
      case 3uLL:
        return sub_100020208(v9, v9 + 1, a2 - 1);
      case 4uLL:
        return sub_100020940(v9, v9 + 1, v9 + 2, a2 - 1);
      case 5uLL:
        return sub_100020A28(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)sub_100020064(v9, a2);
          else
            return (uint64_t)sub_100020144(v9, a2);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            sub_100020208(&v9[v13 >> 1], v9, a2 - 1);
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          else
          {
            sub_100020208(v9, &v9[v13 >> 1], a2 - 1);
            sub_100020208(v9 + 1, v15 - 1, a2 - 2);
            sub_100020208(v9 + 2, &v9[v14 + 1], a2 - 3);
            sub_100020208(v15 - 1, v15, &v9[v14 + 1]);
            v16 = *v9;
            *v9 = *v15;
            *v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_14;
          }
          v17 = *(v9 - 1);
          v18 = *(char *)(v17 + 6526);
          v19 = *(char *)(*v9 + 6526);
          if (v18 >= v19
            && (v18 != v19 || *(unsigned __int16 *)(v17 + 6524) >= *(unsigned __int16 *)(*v9 + 6524)))
          {
            result = sub_100020350(v9, (unint64_t)a2);
            v9 = (uint64_t *)result;
            goto LABEL_19;
          }
LABEL_14:
          v20 = (uint64_t *)sub_100020548(v9, a2);
          if ((v21 & 1) == 0)
            goto LABEL_17;
          v22 = sub_100020748(v9, v20);
          v9 = v20 + 1;
          result = sub_100020748(v20 + 1, a2);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v22)
              continue;
LABEL_17:
            result = sub_10001FCF4(v8, v20, a3, -v11, a5 & 1);
            v9 = v20 + 1;
LABEL_19:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v20;
          if (v22)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)sub_100020B5C(v9, a2, a2, a3);
        return result;
    }
  }
}

_QWORD *sub_100020064(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v4;
        v4 = v2;
        v7 = *v5;
        v6 = v5[1];
        v8 = *(unsigned __int8 *)(v6 + 6526);
        if (*(char *)(v6 + 6526) < *(char *)(*v5 + 6526)
          || v8 == *(unsigned __int8 *)(*v5 + 6526)
          && *(unsigned __int16 *)(v6 + 6524) < *(unsigned __int16 *)(v7 + 6524))
        {
          v5[1] = v7;
          v9 = result;
          if (v5 != result)
          {
            v10 = v3;
            while (1)
            {
              v11 = *(_QWORD *)((char *)result + v10 - 8);
              if (*(char *)(v11 + 6526) <= (char)v8)
              {
                if (v8 != *(unsigned __int8 *)(v11 + 6526))
                {
                  v9 = v5;
                  goto LABEL_17;
                }
                if (*(unsigned __int16 *)(v6 + 6524) >= *(unsigned __int16 *)(v11 + 6524))
                  break;
              }
              --v5;
              *(_QWORD *)((char *)result + v10) = v11;
              v10 -= 8;
              if (!v10)
              {
                v9 = result;
                goto LABEL_17;
              }
            }
            v9 = (_QWORD *)((char *)result + v10);
          }
LABEL_17:
          *v9 = v6;
        }
        v2 = v4 + 1;
        v3 += 8;
      }
      while (v4 + 1 != a2);
    }
  }
  return result;
}

uint64_t *sub_100020144(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;

  if (result != a2)
  {
    v2 = result + 1;
    if (result + 1 != a2)
    {
      v3 = 0;
      v4 = 1;
      do
      {
        v5 = v3;
        v3 = v4;
        v6 = *v2;
        v7 = result[v5];
        v8 = *(unsigned __int8 *)(*v2 + 6526);
        if (*(char *)(*v2 + 6526) < *(char *)(v7 + 6526)
          || v8 == *(unsigned __int8 *)(v7 + 6526)
          && *(unsigned __int16 *)(v6 + 6524) < *(unsigned __int16 *)(v7 + 6524))
        {
          *v2 = v7;
          while (1)
          {
            v9 = &result[v5];
            v10 = *(v9 - 1);
            if (*(char *)(v10 + 6526) <= (char)v8
              && (v8 != *(unsigned __int8 *)(v10 + 6526)
               || *(unsigned __int16 *)(v6 + 6524) >= *(unsigned __int16 *)(v10 + 6524)))
            {
              break;
            }
            --v5;
            *v9 = v10;
            if (v5 == -1)
            {
              __break(1u);
              return result;
            }
          }
          result[v5] = v6;
        }
        v4 = v3 + 1;
        v2 = &result[v3 + 1];
      }
      while (v2 != a2);
    }
  }
  return result;
}

uint64_t sub_100020208(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;

  v3 = *a2;
  v4 = *a1;
  v5 = *(unsigned __int8 *)(*a2 + 6526);
  v6 = *(unsigned __int8 *)(*a1 + 6526);
  if (*(char *)(*a2 + 6526) < *(char *)(*a1 + 6526)
    || v5 == v6 && *(unsigned __int16 *)(v3 + 6524) < *(unsigned __int16 *)(v4 + 6524))
  {
    v7 = *a3;
    if (*(char *)(*a3 + 6526) < (char)v5
      || *(unsigned __int8 *)(*a3 + 6526) == v5
      && *(unsigned __int16 *)(v7 + 6524) < *(unsigned __int16 *)(v3 + 6524))
    {
      *a1 = v7;
      *a3 = v4;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      v14 = *a3;
      if (*(char *)(*a3 + 6526) < (char)v6
        || *(unsigned __int8 *)(*a3 + 6526) == v6
        && *(unsigned __int16 *)(v14 + 6524) < *(unsigned __int16 *)(v4 + 6524))
      {
        *a2 = v14;
        *a3 = v4;
        return 2;
      }
    }
    return 1;
  }
  v9 = *a3;
  if (*(char *)(*a3 + 6526) < (char)v5
    || *(unsigned __int8 *)(*a3 + 6526) == v5
    && *(unsigned __int16 *)(v9 + 6524) < *(unsigned __int16 *)(v3 + 6524))
  {
    *a2 = v9;
    *a3 = v3;
    v10 = *a2;
    v11 = *a1;
    v12 = *(char *)(*a2 + 6526);
    v13 = *(char *)(*a1 + 6526);
    if (v12 < v13 || v12 == v13 && *(unsigned __int16 *)(v10 + 6524) < *(unsigned __int16 *)(v11 + 6524))
    {
      *a1 = v10;
      *a2 = v11;
      return 2;
    }
    return 1;
  }
  return 0;
}

unint64_t sub_100020350(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t i;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *a1;
  v3 = *(_QWORD *)(a2 - 8);
  v4 = *(unsigned __int8 *)(*a1 + 6526);
  v5 = *(char *)(v3 + 6526);
  if (*(char *)(*a1 + 6526) < (int)v5
    || v4 == *(unsigned __int8 *)(v3 + 6526)
    && (v5 = *(unsigned __int16 *)(v2 + 6524), v5 < *(unsigned __int16 *)(v3 + 6524)))
  {
    i = (unint64_t)(a1 + 1);
    if (a1 + 1 == (uint64_t *)a2)
      goto LABEL_24;
    v5 = 6526;
    while (*(char *)(*(_QWORD *)i + 6526) <= (char)v4
         && (v4 != *(unsigned __int8 *)(*(_QWORD *)i + 6526)
          || *(unsigned __int16 *)(v2 + 6524) >= *(unsigned __int16 *)(*(_QWORD *)i + 6524)))
    {
      i += 8;
      if (i == a2)
        goto LABEL_24;
    }
  }
  else
  {
    for (i = (unint64_t)(a1 + 1); i < a2; i += 8)
    {
      if (*(char *)(*(_QWORD *)i + 6526) > (char)v4
        || v4 == *(unsigned __int8 *)(*(_QWORD *)i + 6526)
        && *(unsigned __int16 *)(v2 + 6524) < *(unsigned __int16 *)(*(_QWORD *)i + 6524))
      {
        break;
      }
    }
  }
  v5 = a2;
  if (i >= a2)
    goto LABEL_25;
  if ((uint64_t *)a2 != a1)
  {
    v5 = a2 - 8;
    do
    {
      if (*(char *)(*(_QWORD *)v5 + 6526) <= (char)v4
        && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 6526)
         || *(unsigned __int16 *)(v2 + 6524) >= *(unsigned __int16 *)(*(_QWORD *)v5 + 6524)))
      {
        goto LABEL_25;
      }
      v7 = v5 == (_QWORD)a1;
      v5 -= 8;
    }
    while (!v7);
  }
LABEL_24:
  while (1)
  {
    __break(1u);
LABEL_25:
    if (i >= v5)
      break;
    v8 = *(_QWORD *)i;
    v9 = *(_QWORD *)v5;
LABEL_27:
    *(_QWORD *)i = v9;
    i += 8;
    *(_QWORD *)v5 = v8;
    while (i != a2)
    {
      v8 = *(_QWORD *)i;
      if (*(char *)(*(_QWORD *)i + 6526) > (char)v4
        || v4 == *(unsigned __int8 *)(*(_QWORD *)i + 6526)
        && *(unsigned __int16 *)(v2 + 6524) < *(unsigned __int16 *)(v8 + 6524))
      {
        if ((uint64_t *)v5 == a1)
          goto LABEL_24;
        v5 -= 8;
        while (1)
        {
          v9 = *(_QWORD *)v5;
          if (*(char *)(*(_QWORD *)v5 + 6526) <= (char)v4
            && (v4 != *(unsigned __int8 *)(*(_QWORD *)v5 + 6526)
             || *(unsigned __int16 *)(v2 + 6524) >= *(unsigned __int16 *)(v9 + 6524)))
          {
            break;
          }
          v7 = v5 == (_QWORD)a1;
          v5 -= 8;
          if (v7)
            goto LABEL_24;
        }
        if (i < v5)
          goto LABEL_27;
        goto LABEL_42;
      }
      i += 8;
    }
  }
LABEL_42:
  if ((uint64_t *)(i - 8) != a1)
    *a1 = *(_QWORD *)(i - 8);
  *(_QWORD *)(i - 8) = v2;
  return i;
}

unint64_t sub_100020548(uint64_t *a1, uint64_t *a2)
{
  unint64_t v2;
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t *v16;

  v4 = (_DWORD)a1 + 8;
  v5 = *a1;
  if (a1 + 1 != a2)
  {
    v2 = 6526;
    v4 = *(unsigned __int8 *)(v5 + 6526);
    v6 = 1;
    while (1)
    {
      v3 = (uint64_t *)a1[v6];
      if (*((char *)v3 + 6526) >= (char)v4
        && (*((unsigned __int8 *)v3 + 6526) != v4
         || *((unsigned __int16 *)v3 + 3262) >= *(unsigned __int16 *)(v5 + 6524)))
      {
        break;
      }
      v3 = &a1[++v6];
      if (&a1[v6] == a2)
        goto LABEL_16;
    }
    v2 = (unint64_t)&a1[v6];
    if (v6 == 1)
      goto LABEL_17;
    if (a2 != a1)
    {
      v7 = a2 - 1;
      do
      {
        if (*(char *)(*v7 + 6526) < (char)v4
          || *(unsigned __int8 *)(*v7 + 6526) == v4
          && *(unsigned __int16 *)(*v7 + 6524) < *(unsigned __int16 *)(v5 + 6524))
        {
          goto LABEL_29;
        }
        v8 = v7-- == a1;
      }
      while (!v8);
    }
  }
LABEL_16:
  while (1)
  {
    __break(1u);
LABEL_17:
    v7 = a2;
    if (v2 < (unint64_t)a2)
    {
      v7 = a2 - 1;
      v9 = *(a2 - 1);
      if (*(char *)(v9 + 6526) >= (char)v4)
      {
        v10 = *(unsigned __int8 *)(v9 + 6526);
        do
        {
          if (v10 == v4)
          {
            if (*(unsigned __int16 *)(v9 + 6524) < *(unsigned __int16 *)(v5 + 6524)
              || v2 >= (unint64_t)v7)
            {
              break;
            }
          }
          else if (v2 >= (unint64_t)v7)
          {
            break;
          }
          v12 = *--v7;
          v9 = v12;
          v10 = *(unsigned __int8 *)(v12 + 6526);
        }
        while (*(char *)(v12 + 6526) >= (char)v4);
      }
    }
LABEL_29:
    if (v2 >= (unint64_t)v7)
      break;
    v13 = *v7;
    v14 = v7;
    v15 = v2;
LABEL_31:
    *(_QWORD *)v15 = v13;
    v15 += 8;
    *v14 = (uint64_t)v3;
    while ((uint64_t *)v15 != a2)
    {
      v3 = *(uint64_t **)v15;
      if (*(char *)(*(_QWORD *)v15 + 6526) >= (char)v4
        && (*(unsigned __int8 *)(*(_QWORD *)v15 + 6526) != v4
         || *((unsigned __int16 *)v3 + 3262) >= *(unsigned __int16 *)(v5 + 6524)))
      {
        if (v14 == a1)
          goto LABEL_16;
        --v14;
        while (1)
        {
          v13 = *v14;
          if (*(char *)(*v14 + 6526) < (char)v4
            || *(unsigned __int8 *)(*v14 + 6526) == v4
            && *(unsigned __int16 *)(v13 + 6524) < *(unsigned __int16 *)(v5 + 6524))
          {
            break;
          }
          v8 = v14-- == a1;
          if (v8)
            goto LABEL_16;
        }
        if (v15 < (unint64_t)v14)
          goto LABEL_31;
        goto LABEL_48;
      }
      v15 += 8;
    }
  }
  v15 = v2;
LABEL_48:
  v16 = (uint64_t *)(v15 - 8);
  if ((uint64_t *)(v15 - 8) != a1)
    *a1 = *v16;
  *v16 = v5;
  return v15 - 8;
}

BOOL sub_100020748(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a2 - a1;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 1);
      v7 = *a1;
      v8 = *(char *)(v6 + 6526);
      v9 = *(char *)(*a1 + 6526);
      if (v8 < v9 || v8 == v9 && *(unsigned __int16 *)(v6 + 6524) < *(unsigned __int16 *)(v7 + 6524))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      sub_100020208(a1, a1 + 1, a2 - 1);
      return 1;
    case 4:
      sub_100020940(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5:
      sub_100020A28(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      v10 = a1 + 2;
      sub_100020208(a1, a1 + 1, a1 + 2);
      v11 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = *v11;
    v15 = *v10;
    v16 = *(unsigned __int8 *)(*v11 + 6526);
    if (*(char *)(*v11 + 6526) < *(char *)(*v10 + 6526)
      || v16 == *(unsigned __int8 *)(*v10 + 6526)
      && *(unsigned __int16 *)(v14 + 6524) < *(unsigned __int16 *)(v15 + 6524))
    {
      *v11 = v15;
      v17 = a1;
      if (v10 != a1)
      {
        v18 = v12;
        while (1)
        {
          v19 = *(uint64_t *)((char *)a1 + v18 + 8);
          if (*(char *)(v19 + 6526) <= (char)v16)
          {
            if (v16 != *(unsigned __int8 *)(v19 + 6526))
            {
              v17 = v10;
              goto LABEL_20;
            }
            if (*(unsigned __int16 *)(v14 + 6524) >= *(unsigned __int16 *)(v19 + 6524))
              break;
          }
          --v10;
          *(uint64_t *)((char *)a1 + v18 + 16) = v19;
          v18 -= 8;
          if (v18 == -16)
          {
            v17 = a1;
            goto LABEL_20;
          }
        }
        v17 = (uint64_t *)((char *)a1 + v18 + 16);
      }
LABEL_20:
      *v17 = v14;
      if (++v13 == 8)
        return v11 + 1 == a2;
    }
    v10 = v11;
    v12 += 8;
    if (++v11 == a2)
      return 1;
  }
}

uint64_t sub_100020940(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;

  result = sub_100020208(a1, a2, a3);
  v9 = *a4;
  v10 = *a3;
  v11 = *(char *)(*a4 + 6526);
  v12 = *(char *)(*a3 + 6526);
  if (v11 < v12 || v11 == v12 && *(unsigned __int16 *)(v9 + 6524) < *(unsigned __int16 *)(v10 + 6524))
  {
    *a3 = v9;
    *a4 = v10;
    v13 = *a3;
    v14 = *a2;
    v15 = *(char *)(*a3 + 6526);
    v16 = *(char *)(*a2 + 6526);
    if (v15 < v16 || v15 == v16 && *(unsigned __int16 *)(v13 + 6524) < *(unsigned __int16 *)(v14 + 6524))
    {
      *a2 = v13;
      *a3 = v14;
      v17 = *a2;
      v18 = *a1;
      v19 = *(char *)(*a2 + 6526);
      v20 = *(char *)(*a1 + 6526);
      if (v19 < v20
        || v19 == v20 && *(unsigned __int16 *)(v17 + 6524) < *(unsigned __int16 *)(v18 + 6524))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

uint64_t sub_100020A28(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;

  result = sub_100020940(a1, a2, a3, a4);
  v11 = *a5;
  v12 = *a4;
  v13 = *(char *)(*a5 + 6526);
  v14 = *(char *)(*a4 + 6526);
  if (v13 < v14 || v13 == v14 && *(unsigned __int16 *)(v11 + 6524) < *(unsigned __int16 *)(v12 + 6524))
  {
    *a4 = v11;
    *a5 = v12;
    v15 = *a4;
    v16 = *a3;
    v17 = *(char *)(*a4 + 6526);
    v18 = *(char *)(*a3 + 6526);
    if (v17 < v18 || v17 == v18 && *(unsigned __int16 *)(v15 + 6524) < *(unsigned __int16 *)(v16 + 6524))
    {
      *a3 = v15;
      *a4 = v16;
      v19 = *a3;
      v20 = *a2;
      v21 = *(char *)(*a3 + 6526);
      v22 = *(char *)(*a2 + 6526);
      if (v21 < v22
        || v21 == v22 && *(unsigned __int16 *)(v19 + 6524) < *(unsigned __int16 *)(v20 + 6524))
      {
        *a2 = v19;
        *a3 = v20;
        v23 = *a2;
        v24 = *a1;
        v25 = *(char *)(*a2 + 6526);
        v26 = *(char *)(*a1 + 6526);
        if (v25 < v26
          || v25 == v26 && *(unsigned __int16 *)(v23 + 6524) < *(unsigned __int16 *)(v24 + 6524))
        {
          *a1 = v23;
          *a2 = v24;
        }
      }
    }
  }
  return result;
}

uint64_t *sub_100020B5C(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[v10];
      do
      {
        sub_100020CC4((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = *v14;
        v16 = *a1;
        v17 = *(char *)(*v14 + 6526);
        v18 = *(char *)(*a1 + 6526);
        if (v17 < v18
          || v17 == v18 && *(unsigned __int16 *)(v15 + 6524) < *(unsigned __int16 *)(v16 + 6524))
        {
          *v14 = v16;
          *a1 = v15;
          sub_100020CC4((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v19 = (unint64_t)v8 >> 3;
      v20 = a2 - 1;
      do
      {
        v21 = *a1;
        v22 = sub_100020E20(a1, a4, v19);
        if (v20 == v22)
        {
          *v22 = v21;
        }
        else
        {
          *v22 = *v20;
          *v20 = v21;
          sub_100020EB0((uint64_t)a1, (uint64_t)(v22 + 1), a4, v22 + 1 - a1);
        }
        --v20;
      }
      while (v19-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_100020CC4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;

  if (a3 >= 2)
  {
    v4 = (uint64_t)a4 - result;
    v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      v6 = v4 >> 2;
      v7 = (v4 >> 2) + 1;
      v8 = (_QWORD *)(result + 8 * v7);
      v9 = v6 + 2;
      if (v9 < a3)
      {
        v10 = v8[1];
        v11 = *(char *)(*v8 + 6526);
        v12 = *(char *)(v10 + 6526);
        if (v11 < v12
          || v11 == v12 && *(unsigned __int16 *)(*v8 + 6524) < *(unsigned __int16 *)(v10 + 6524))
        {
          ++v8;
          v7 = v9;
        }
      }
      v13 = *v8;
      v14 = *a4;
      if (*(char *)(*v8 + 6526) >= *(char *)(*a4 + 6526))
      {
        v15 = *(unsigned __int8 *)(*a4 + 6526);
        if (*(unsigned __int8 *)(*v8 + 6526) != v15
          || *(unsigned __int16 *)(v13 + 6524) >= *(unsigned __int16 *)(v14 + 6524))
        {
          *a4 = v13;
          if (v5 >= v7)
          {
            while (1)
            {
              v17 = 2 * v7;
              v7 = (2 * v7) | 1;
              v16 = (_QWORD *)(result + 8 * v7);
              v18 = v17 + 2;
              if (v18 < a3)
              {
                v19 = v16[1];
                v20 = *(char *)(*v16 + 6526);
                v21 = *(char *)(v19 + 6526);
                if (v20 < v21
                  || v20 == v21
                  && *(unsigned __int16 *)(*v16 + 6524) < *(unsigned __int16 *)(v19 + 6524))
                {
                  ++v16;
                  v7 = v18;
                }
              }
              v22 = *v16;
              if (*(char *)(*v16 + 6526) < (char)v15
                || *(unsigned __int8 *)(*v16 + 6526) == v15
                && *(unsigned __int16 *)(v22 + 6524) < *(unsigned __int16 *)(v14 + 6524))
              {
                break;
              }
              *v8 = v22;
              v8 = v16;
              if (v5 < v7)
                goto LABEL_22;
            }
          }
          v16 = v8;
LABEL_22:
          *v16 = v14;
        }
      }
    }
  }
  return result;
}

_QWORD *sub_100020E20(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = result;
    result += v3 + 1;
    v7 = 2 * v3;
    v3 = (2 * v3) | 1;
    v8 = v7 + 2;
    if (v8 < a3)
    {
      v9 = result[1];
      v10 = *(char *)(*result + 6526);
      v11 = *(char *)(v9 + 6526);
      if (v10 < v11
        || v10 == v11 && *(unsigned __int16 *)(*result + 6524) < *(unsigned __int16 *)(v9 + 6524))
      {
        ++result;
        v3 = v8;
      }
    }
    *v6 = *result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t sub_100020EB0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v5 = v4 >> 1;
    v6 = (uint64_t *)(result + 8 * (v4 >> 1));
    v7 = *v6;
    v8 = *(_QWORD *)(a2 - 8);
    v9 = *(unsigned __int8 *)(v8 + 6526);
    if (*(char *)(*v6 + 6526) < *(char *)(v8 + 6526)
      || *(unsigned __int8 *)(*v6 + 6526) == v9
      && *(unsigned __int16 *)(v7 + 6524) < *(unsigned __int16 *)(v8 + 6524))
    {
      *(_QWORD *)(a2 - 8) = v7;
      if (v4 >= 2)
      {
        while (1)
        {
          v11 = v5 - 1;
          v5 = (v5 - 1) >> 1;
          v10 = (uint64_t *)(result + 8 * v5);
          v12 = *v10;
          if (*(char *)(*v10 + 6526) >= (char)v9
            && (*(unsigned __int8 *)(*v10 + 6526) != v9
             || *(unsigned __int16 *)(v12 + 6524) >= *(unsigned __int16 *)(v8 + 6524)))
          {
            break;
          }
          *v6 = v12;
          v6 = (uint64_t *)(result + 8 * v5);
          if (v11 <= 1)
            goto LABEL_11;
        }
      }
      v10 = v6;
LABEL_11:
      *v10 = v8;
    }
  }
  return result;
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

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

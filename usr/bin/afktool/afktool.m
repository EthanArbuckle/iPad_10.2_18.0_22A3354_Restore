void sub_100002AE0(uint64_t a1, unint64_t a2, const char *a3, int a4)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _BYTE *v13;
  int v14;
  NSObject *v15;
  size_t v16;
  _QWORD *v17;
  const std::locale::facet *v18;
  uint64_t v19;
  BOOL v20;
  const char *v21;
  int v22;
  uint8_t buf[4];
  char *v25;
  char __str[256];

  v5 = a1;
  v21 = a3;
  v22 = a1;
  do
  {
    v6 = 16;
    if (a2 < 0x10)
      v6 = a2;
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    if (!a2)
      break;
    v8 = a3 ? &__str[snprintf(__str, 0x100uLL, "%s ", a3)] : __str;
    v9 = v7 - 1;
    v10 = 0;
    v11 = &v8[snprintf(v8, 0x100uLL, "%08x: ", v5 - v22)];
    do
    {
      v11 += snprintf(v11, 0x100uLL, "%02x ", *(unsigned __int8 *)(v5 + v10));
      if (v10 == 7)
        *(_WORD *)v11++ = 32;
      ++v10;
    }
    while (v7 != v10);
    if (v7 <= 0xF)
    {
      do
      {
        *(_DWORD *)v11 = 2105376;
        if (v9 == 6)
        {
          *(_WORD *)(v11 + 3) = 32;
          v11 += 4;
        }
        else
        {
          v11 += 3;
        }
        ++v9;
      }
      while (v9 < 0xF);
    }
    v12 = 0;
    *(_DWORD *)v11 = 2128928;
    v13 = v11 + 3;
    do
    {
      v14 = *(unsigned __int8 *)(v5 + v12);
      if ((v14 - 33) >= 0x5E)
        LOBYTE(v14) = 46;
      *v13 = v14;
      v13[1] = 0;
      if (v12 == 7)
      {
        *(_WORD *)(v13 + 1) = 32;
        v13 += 2;
      }
      else
      {
        ++v13;
      }
      ++v12;
    }
    while (v7 != v12);
    if (a4)
    {
      v15 = _AFKUserLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = __str;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
      }
    }
    else
    {
      v16 = strlen(__str);
      v17 = sub_100002DA4(&std::cout, (uint64_t)__str, v16);
      std::ios_base::getloc((const std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
      v18 = std::locale::use_facet((const std::locale *)buf, &std::ctype<char>::id);
      v19 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v18->__vftable[2].~facet_0)(v18, 10);
      std::locale::~locale((std::locale *)buf);
      std::ostream::put(v17, v19);
      std::ostream::flush(v17);
    }
    v5 += v12;
    v20 = a2 > 0xF;
    a2 -= 16;
    a3 = v21;
  }
  while (v20);
}

void sub_100002D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::locale a17)
{
  std::locale::~locale(&a17);
  _Unwind_Resume(a1);
}

_QWORD *sub_100002DA4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  std::ostream::sentry::sentry(v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!sub_100002F08(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_100002EAC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  std::ostream::sentry::~sentry(&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100002E8CLL);
}

void sub_100002EF4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_100002F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      sub_100003054(__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_100003028(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_100003044(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *sub_100003054(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_1000030FC();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void sub_1000030FC()
{
  sub_100003110("basic_string");
}

void sub_100003110(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100003160(exception, a1);
}

void sub_10000314C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100003160(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_100003184(uint64_t **a1)
{
  int v2;
  uint64_t **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v7[3];
  uint64_t *v8[3];
  void *__p[2];
  char v10;
  void **v11;

  sub_100006264(__p, "FILENAME");
  v11 = __p;
  v2 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v11) + 14);
  if (v10 < 0)
  {
    operator delete(__p[0]);
    if (v2)
      goto LABEL_3;
LABEL_5:
    v3 = v7;
    sub_100006828((uint64_t *)v7, (const void ***)a1);
    v4 = sub_100003430(v7);
    goto LABEL_6;
  }
  if (!v2)
    goto LABEL_5;
LABEL_3:
  v3 = v8;
  sub_100006828((uint64_t *)v8, (const void ***)a1);
  v4 = sub_100003280(v8);
LABEL_6:
  v5 = v4;
  sub_100006F80((uint64_t)v3, v3[1]);
  return v5;
}

void sub_100003240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, _QWORD *a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  sub_100006F80((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

uint64_t sub_100003280(uint64_t **a1)
{
  _OWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  void *__p[2];
  char v15;
  void **v16;

  sub_100006264(__p, "FILENAME");
  v16 = __p;
  v2 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v16);
  sub_10000516C((int *)v2 + 14, 3u);
  v3 = v2 + 4;
  if (*((char *)v2 + 87) < 0)
    v3 = (_QWORD *)*v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", v4));

  if (v15 < 0)
    operator delete(__p[0]);
  v13 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v5, 0, 0, &v13));
  v7 = v13;
  v8 = v7;
  if (v7)
  {
    NSLog(CFSTR("ERROR! NSPropertyListSerialization:%@\n"), v7);
LABEL_10:
    v10 = 1;
    goto LABEL_11;
  }
  v9 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v9) & 1) == 0)
  {
    v11 = objc_opt_class(v6);
    NSLog(CFSTR("ERROR! Unexpected type:%@\n"), v11);
    goto LABEL_10;
  }
  sub_100004328(v6);
  v10 = 0;
LABEL_11:

  return v10;
}

void sub_1000033EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

uint64_t sub_100003430(uint64_t **a1)
{
  int *v2;
  int v3;
  int *v4;
  int v5;
  int v6;
  _OWORD *v7;
  unsigned __int16 *v8;
  int v9;
  int v10;
  int v11;
  BOOL v13;
  uint64_t v14;
  int v15;
  int *v16;
  _OWORD *v17;
  int v18;
  _OWORD *v19;
  unsigned __int16 *v20;
  int v21;
  int v22;
  int v23;
  BOOL v25;
  int v26;
  _OWORD *v27;
  _QWORD *v28;
  int v29;
  int v30;
  int v31;
  BOOL v33;
  __CFString *v34;
  BOOL v35;
  _OWORD *v36;
  _QWORD *v37;
  int v38;
  BOOL v39;
  int v40;
  _OWORD *v41;
  _QWORD *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  int *v47;
  int v48;
  _OWORD *v49;
  unint64_t v50;
  uint64_t v51;
  __CFDictionary *v52;
  uint64_t v53;
  int v54;
  int v55;
  _OWORD *v56;
  _QWORD *v57;
  void *v58;
  void *v59;
  CFMutableDictionaryRef v60;
  int v61;
  NSMutableDictionary *v62;
  NSMutableDictionary *v63;
  NSMutableDictionary *v64;
  id v65;
  uint64_t v66;
  void *i;
  id v68;
  void *v69;
  void *v70;
  int v71;
  NSMutableDictionary *v73;
  NSMutableDictionary *v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  NSMutableDictionary *v82;
  NSMutableDictionary *v83;
  uint64_t *v84;
  uint64_t v85;
  unint64_t v86;
  int v87;
  void *v88[2];
  char v89;
  void *__p[2];
  char v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  void **v96;
  _BYTE v97[128];

  v73 = objc_opt_new(NSMutableDictionary);
  v74 = objc_opt_new(NSMutableDictionary);
  v92 = 0;
  v93 = &v92;
  v94 = 0x2020000000;
  v95 = 0;
  sub_100006264(__p, "--hex");
  v88[0] = __p;
  v2 = (int *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_10000516C(v2 + 14, 1u);
  v3 = *((unsigned __int8 *)v2 + 64);
  if (v91 < 0)
    operator delete(__p[0]);
  if (v3)
    byte_100010208 = 1;
  sub_100006264(__p, "--archive");
  v88[0] = __p;
  v4 = (int *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_10000516C(v4 + 14, 1u);
  v5 = *((unsigned __int8 *)v4 + 64);
  if (v91 < 0)
    operator delete(__p[0]);
  sub_100006264(__p, "--format");
  v88[0] = __p;
  v6 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (!v6)
    {
LABEL_25:
      v14 = 100;
      goto LABEL_26;
    }
  }
  else if (!v6)
  {
    goto LABEL_25;
  }
  sub_100006264(__p, "--format");
  v88[0] = __p;
  v7 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_10000516C((int *)v7 + 14, 3u);
  v8 = (unsigned __int16 *)(v7 + 4);
  v9 = *((char *)v7 + 87);
  if (v9 < 0)
  {
    if (*((_QWORD *)v7 + 9) != 3)
    {
LABEL_22:
      v13 = 0;
      goto LABEL_23;
    }
    v8 = *(unsigned __int16 **)v8;
  }
  else if (v9 != 3)
  {
    goto LABEL_22;
  }
  v10 = *v8;
  v11 = *((unsigned __int8 *)v8 + 2);
  v13 = v10 == 28024 && v11 == 108;
LABEL_23:
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (v13)
      goto LABEL_25;
  }
  else if (v13)
  {
    goto LABEL_25;
  }
  sub_100006264(__p, "--format");
  v88[0] = __p;
  v19 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_10000516C((int *)v19 + 14, 3u);
  v20 = (unsigned __int16 *)(v19 + 4);
  v21 = *((char *)v19 + 87);
  if (v21 < 0)
  {
    if (*((_QWORD *)v19 + 9) != 3)
    {
LABEL_62:
      v33 = 0;
      goto LABEL_63;
    }
    v20 = *(unsigned __int16 **)v20;
  }
  else if (v21 != 3)
  {
    goto LABEL_62;
  }
  v30 = *v20;
  v31 = *((unsigned __int8 *)v20 + 2);
  v33 = v30 == 26978 && v31 == 110;
LABEL_63:
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (v33)
      goto LABEL_65;
LABEL_67:
    v34 = CFSTR("ERROR! Unknown plist format. Options are xml, bin");
    goto LABEL_163;
  }
  if (!v33)
    goto LABEL_67;
LABEL_65:
  v14 = 200;
LABEL_26:
  v75 = v14;
  sub_100006264(__p, "--protocol");
  v88[0] = __p;
  v15 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (!v15)
      goto LABEL_86;
LABEL_30:
    sub_100006264(__p, "--protocol");
    v88[0] = __p;
    v16 = (int *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
    sub_10000516C(v16 + 14, 3u);
    v17 = v16 + 16;
    v18 = *((char *)v16 + 87);
    if (v18 < 0)
    {
      if (*((_QWORD *)v16 + 9) != 6)
      {
LABEL_45:
        v25 = 0;
        goto LABEL_46;
      }
      v17 = *(_OWORD **)v17;
    }
    else if (v18 != 6)
    {
      goto LABEL_45;
    }
    v22 = *(_DWORD *)v17;
    v23 = *((unsigned __int16 *)v17 + 2);
    v25 = v22 == 1701999731 && v23 == 28001;
LABEL_46:
    if (v91 < 0)
    {
      operator delete(__p[0]);
      if (v25)
      {
LABEL_48:
        v26 = 2;
        if (!v5)
          goto LABEL_98;
        goto LABEL_87;
      }
    }
    else if (v25)
    {
      goto LABEL_48;
    }
    sub_100006264(__p, "--protocol");
    v88[0] = __p;
    v27 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
    sub_10000516C((int *)v27 + 14, 3u);
    v28 = v27 + 4;
    v29 = *((char *)v27 + 87);
    if (v29 < 0)
    {
      if (*((_QWORD *)v27 + 9) != 4)
      {
LABEL_71:
        v35 = 0;
LABEL_72:
        if (v91 < 0)
        {
          operator delete(__p[0]);
          if (v35)
          {
LABEL_74:
            v26 = 1;
            if (!v5)
              goto LABEL_98;
            goto LABEL_87;
          }
        }
        else if (v35)
        {
          goto LABEL_74;
        }
        sub_100006264(__p, "--protocol");
        v88[0] = __p;
        v36 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
        sub_10000516C((int *)v36 + 14, 3u);
        v37 = v36 + 4;
        v38 = *((char *)v36 + 87);
        if (v38 < 0)
        {
          if (*((_QWORD *)v36 + 9) != 4)
          {
LABEL_83:
            v39 = 0;
            goto LABEL_84;
          }
          v37 = (_QWORD *)*v37;
        }
        else if (v38 != 4)
        {
          goto LABEL_83;
        }
        v39 = *(_DWORD *)v37 == 1869903201;
LABEL_84:
        if (v91 < 0)
        {
          operator delete(__p[0]);
          if (v39)
            goto LABEL_86;
        }
        else if (v39)
        {
          goto LABEL_86;
        }
        v34 = CFSTR("ERROR! Unknown registry collection protocol.");
LABEL_163:
        v43 = 0;
        NSLog(&v34->isa);
        v53 = 1;
        v52 = 0;
        goto LABEL_164;
      }
      v28 = (_QWORD *)*v28;
    }
    else if (v29 != 4)
    {
      goto LABEL_71;
    }
    v35 = *(_DWORD *)v28 == 1886221668;
    goto LABEL_72;
  }
  if (v15)
    goto LABEL_30;
LABEL_86:
  v26 = 0;
  if (!v5)
    goto LABEL_98;
LABEL_87:
  sub_100006264(__p, "--path");
  v88[0] = __p;
  v40 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
  if (v91 < 0)
  {
    operator delete(__p[0]);
    if (v40)
      goto LABEL_89;
LABEL_98:
    v43 = 0;
    goto LABEL_99;
  }
  if (!v40)
    goto LABEL_98;
LABEL_89:
  sub_100006264(__p, "--path");
  v88[0] = __p;
  v41 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_10000516C((int *)v41 + 14, 3u);
  v42 = v41 + 4;
  if (*((char *)v41 + 87) < 0)
    v42 = (_QWORD *)*v42;
  v43 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 1));
  if (v91 < 0)
    operator delete(__p[0]);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "contentsOfDirectoryAtPath:error:", v43, 0));
  v46 = v45;
  if (!v45)
  {
    NSLog(CFSTR("contentsOfDirectoryAtPath returned nil"));
    exit(1);
  }
  if (!objc_msgSend(v45, "count"))
    NSLog(CFSTR("contentsOfDirectoryAtPath no files "));

LABEL_99:
  sub_100006264(__p, "--buffer");
  v88[0] = __p;
  if (!*((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14))
  {
    v48 = 0;
    goto LABEL_108;
  }
  sub_100006264(v88, "--buffer");
  v96 = v88;
  v47 = (int *)sub_10000633C(a1, (const void **)v88, (uint64_t)&unk_10000A114, (_OWORD **)&v96);
  sub_10000516C(v47 + 14, 3u);
  if (*((char *)v47 + 87) < 0)
  {
    if (*((_QWORD *)v47 + 9))
      goto LABEL_102;
  }
  else if (*((_BYTE *)v47 + 87))
  {
LABEL_102:
    v48 = 1;
    goto LABEL_106;
  }
  v48 = 0;
LABEL_106:
  if (v89 < 0)
    operator delete(v88[0]);
LABEL_108:
  if ((v91 & 0x80000000) == 0)
  {
    if (v48)
      goto LABEL_110;
LABEL_115:
    v51 = 0x100000;
    v50 = 0x400000;
    goto LABEL_116;
  }
  operator delete(__p[0]);
  if (!v48)
    goto LABEL_115;
LABEL_110:
  sub_100006264(__p, "--buffer");
  v88[0] = __p;
  v49 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
  sub_10000516C((int *)v49 + 14, 3u);
  v50 = std::stoul((const std::string *)(v49 + 4), 0, 0);
  if (v91 < 0)
    operator delete(__p[0]);
  v51 = v50;
  if (v50)
  {
LABEL_116:
    sub_100006264(__p, "--matching");
    v88[0] = __p;
    v54 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
    if (v91 < 0)
    {
      operator delete(__p[0]);
      if (v54)
        goto LABEL_118;
    }
    else if (v54)
    {
LABEL_118:
      NSLog(CFSTR("ERROR! '--matching' not allowed"));
LABEL_119:
      v52 = 0;
      goto LABEL_136;
    }
    sub_100006264(__p, "--role");
    v88[0] = __p;
    v55 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
    if (v91 < 0)
      operator delete(__p[0]);
    if (!v55)
      goto LABEL_119;
    sub_100006264(__p, "--role");
    v88[0] = __p;
    v56 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88);
    sub_10000516C((int *)v56 + 14, 3u);
    v57 = v56 + 4;
    if (*((char *)v56 + 87) < 0)
      v57 = (_QWORD *)*v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v57, 1));
    if (v91 < 0)
      operator delete(__p[0]);
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", &__kCFBooleanTrue, CFSTR("system-service")));
    v60 = IOServiceMatching("AFKEndpointInterface");
    if ((objc_msgSend(v58, "isEqualToString:", CFSTR("all")) & 1) == 0)
      objc_msgSend(v59, "setObject:forKey:", v58, CFSTR("role"));
    -[__CFDictionary setObject:forKey:](v60, "setObject:forKey:", v59, CFSTR("IOPropertyMatch"));
    sub_100006264(__p, "--name");
    v88[0] = __p;
    v61 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)v88) + 14);
    if (v91 < 0)
    {
      operator delete(__p[0]);
      if (!v61)
      {
LABEL_135:
        v52 = v60;

LABEL_136:
        v80[0] = _NSConcreteStackBlock;
        v80[1] = 3221225472;
        v80[2] = sub_1000043AC;
        v80[3] = &unk_10000C540;
        v84 = &v92;
        v85 = v51;
        v87 = v26;
        v86 = v50;
        v43 = v43;
        v81 = v43;
        v62 = v74;
        v82 = v62;
        v63 = v73;
        v83 = v63;
        sub_100007744(v52, v80);
        if (v93[3])
        {
          if (!-[NSMutableDictionary count](v62, "count") && !-[NSMutableDictionary count](v63, "count"))
            goto LABEL_156;
          if (v5)
          {
            if (-[NSMutableDictionary count](v62, "count") || -[NSMutableDictionary count](v63, "count"))
            {
              if (-[NSMutableDictionary count](v62, "count"))
              {
                v78 = 0u;
                v79 = 0u;
                v76 = 0u;
                v77 = 0u;
                v64 = v62;
                v65 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
                if (v65)
                {
                  v66 = *(_QWORD *)v77;
                  while (2)
                  {
                    for (i = 0; i != v65; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v77 != v66)
                        objc_enumerationMutation(v64);
                      v68 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)i));
                      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "stringByAppendingFormat:", CFSTR("/%s.plist"), objc_msgSend(v68, "UTF8String")));
                      v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v64, "objectForKeyedSubscript:", v68));
                      v71 = sub_10000506C(v70, v69, v75);

                      if (v71)
                      {
                        v53 = 1;
                        goto LABEL_158;
                      }
                    }
                    v65 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v76, v97, 16);
                    if (v65)
                      continue;
                    break;
                  }
                }
                v53 = 0;
LABEL_158:

              }
              else
              {
                v53 = sub_10000506C(v63, CFSTR("/dev/stdout"), v75);
              }
              goto LABEL_160;
            }
            goto LABEL_156;
          }
          if (!-[NSMutableDictionary count](v63, "count"))
          {
LABEL_156:
            v53 = 1;
            goto LABEL_160;
          }
          sub_100004328(v63);
        }
        else
        {
          NSLog(CFSTR("WARNING! No AppleFirmwareKit IOP matched."));
        }
        v53 = 0;
LABEL_160:

        goto LABEL_164;
      }
    }
    else if (!v61)
    {
      goto LABEL_135;
    }
    NSLog(CFSTR("ERROR! '--name' not allowed"));
    goto LABEL_135;
  }
  NSLog(CFSTR("ERROR! Failed to parse buffer size."));
  v52 = 0;
  v53 = 1;
LABEL_164:

  _Block_object_dispose(&v92, 8);
  return v53;
}

void sub_1000040C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44,char a45)
{
  void *v45;
  void *v46;
  void *v47;

  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_100004328(void *a1)
{
  void *v1;
  id v2;

  v2 = a1;
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("class")));

  if (v1)
    sub_1000056BC(v2, 0, 0, 0);
  else
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &stru_10000C670);

}

void sub_100004398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1000043AC(uint64_t a1, uint64_t entry)
{
  unint64_t v3;
  void *CFProperty;
  uint64_t v5;
  id v6;
  CFTypeRef v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  dispatch_semaphore_t v16;
  dispatch_queue_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  dispatch_semaphore_t v27;
  dispatch_queue_t v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  char *v35;
  __CFSet *v36;
  id v37;
  void *v38;
  int v39;
  void *v40;
  id v41;
  unint64_t i;
  id v43;
  void *v44;
  void *v45;
  id v46;
  __CFSet *v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  uint64_t entryID;
  int v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  int v71;
  void **v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  uint64_t *v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  _QWORD v85[6];
  NSErrorUserInfoKey v86;
  _QWORD v87[6];
  _QWORD v88[4];
  NSObject *v89;
  uint64_t *v90;
  uint64_t v91;
  _UNKNOWN **v92;

  entryID = 0;
  v3 = *(_QWORD *)(a1 + 64);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  IORegistryEntryGetRegistryEntryID(entry, &entryID);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, CFSTR("role"), 0, 0);
  v5 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(CFProperty, v5) & 1) != 0)
    v6 = CFProperty;
  else
    v6 = 0;
  v7 = IORegistryEntryCreateCFProperty(entry, CFSTR("compartment"), 0, 0);

  v8 = (void *)v7;
  v9 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v6, v7));

  }
  else
  {
    v57 = v6;
  }
  v10 = (void *)IORegistryEntryCreateCFProperty(entry, CFSTR("reg-stream-block-size"), 0, 0);

  v11 = *(_DWORD *)(a1 + 80);
  if (v11 != 2)
  {
    if (v11 || (v12 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v10, v12) & 1) == 0))
    {
      v56 = (id)IORegistryEntryCreateCFProperty(entry, CFSTR("reg-size-inc"), 0, 0);

      v20 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v56, v20) & 1) != 0)
      {
        v21 = v56;
        v22 = objc_msgSend(v21, "unsignedIntValue");
        v23 = objc_msgSend(v21, "unsignedIntValue");

        v3 = v22;
        v24 = v23;
      }
      else
      {
        v24 = 0x100000;
      }
      v58 = v24;
      v25 = a1;
      while (v3 <= *(_QWORD *)(v25 + 72))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[AFKEndpointInterface withService:](AFKEndpointInterface, "withService:", entry));
        v27 = dispatch_semaphore_create(0);
        v79 = 0;
        v80 = &v79;
        v81 = 0x3032000000;
        v82 = sub_100005270;
        v83 = sub_100005280;
        v84 = 0;
        v62 = 0;
        v63 = &v62;
        v64 = 0x2020000000;
        LODWORD(v65) = 0;
        v28 = dispatch_queue_create("afkregistry", 0);
        objc_msgSend(v26, "setDispatchQueue:", v28);
        v72 = _NSConcreteStackBlock;
        v73 = 3221225472;
        v74 = (uint64_t)sub_10000565C;
        v75 = (uint64_t (*)(uint64_t, uint64_t))&unk_10000C630;
        v77 = &v79;
        v78 = &v62;
        v29 = v27;
        v76 = (void (*)(uint64_t))v29;
        objc_msgSend(v26, "setResponseHandler:", &v72);
        objc_msgSend(v26, "activate:", 1);
        LODWORD(v92) = 0;
        LODWORD(v55) = 2;
        v30 = objc_msgSend(v26, "enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:", 128, mach_continuous_time(), 0, 0, v3, &v92, v55);
        *((_DWORD *)v63 + 6) = (_DWORD)v30;
        if ((_DWORD)v30)
        {
          NSLog(CFSTR("enqueueCommand:%x"), v30);
        }
        else if (dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL))
        {
          *((_DWORD *)v63 + 6) = -536870186;
        }
        objc_msgSend(v26, "cancel");
        v31 = *((int *)v63 + 6);
        if ((_DWORD)v31 || (v34 = (void *)v80[5]) == 0)
        {
          v87[0] = NSDebugDescriptionErrorKey;
          v88[0] = CFSTR("Did not receive registry dump AFK Endpoint Interface");
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v88, v87, 1));
          v33 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.afktool"), v31, v32));

          v34 = (void *)v80[5];
        }
        else
        {
          v33 = 0;
        }
        v85[0] = 0;
        v35 = (char *)objc_msgSend(objc_retainAutorelease(v34), "bytes");
        v36 = sub_1000076B8(v35, (unint64_t)objc_msgSend((id)v80[5], "length"), kCFAllocatorDefault, 0, v85);
        if (!v36)
        {
          v68 = 0;
          IORegistryEntryGetRegistryEntryID(entry, &v68);
          NSLog(CFSTR("ERROR! Unserialize registry dump for service:0x%llx error:%@"), v68, v85[0]);
        }

        _Block_object_dispose(&v62, 8);
        _Block_object_dispose(&v79, 8);

        v37 = v33;
        if (v37)
        {
          v38 = v37;
          NSLog(CFSTR("ERROR! Registry dump for service:0x%llx error:%@ buffer:%zu"), entryID, v37, v3);
          if (objc_msgSend(v38, "code") == (id)-536870211)
            goto LABEL_51;

        }
        v25 = a1;
        v3 += v58;
        if (v36)
        {
          v38 = 0;
          goto LABEL_52;
        }
      }
      v38 = 0;
      v36 = 0;
      goto LABEL_55;
    }
  }
  v56 = v10;
  objc_msgSend(v56, "unsignedIntValue");
  v13 = entryID;
  v91 = AFKEndpointInterfaceEnsureReportDeliveryKey;
  v92 = &off_10000CE90;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFKEndpointInterface withService:properties:](AFKEndpointInterface, "withService:properties:", entry, v14));

  v16 = dispatch_semaphore_create(0);
  v72 = 0;
  v73 = (uint64_t)&v72;
  v74 = 0x3032000000;
  v75 = sub_100005270;
  v76 = sub_100005280;
  v77 = (uint64_t *)objc_alloc_init((Class)NSMutableArray);
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = sub_100005270;
  v83 = sub_100005280;
  v84 = 0;
  v68 = 0;
  v69 = &v68;
  v70 = 0x2020000000;
  v71 = 0;
  v17 = dispatch_queue_create("afkregistry", 0);
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = sub_100005270;
  v66 = sub_100005280;
  v67 = 0;
  objc_msgSend(v15, "setDispatchQueue:", v17);
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_100005288;
  v88[3] = &unk_10000C568;
  v90 = &v68;
  v18 = v16;
  v89 = v18;
  objc_msgSend(v15, "setResponseHandler:", v88);
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_10000529C;
  v87[3] = &unk_10000C590;
  v87[4] = &v62;
  v87[5] = &v72;
  objc_msgSend(v15, "setReportHandler:", v87);
  objc_msgSend(v15, "activate:", 1);
  v61 = 0;
  LODWORD(v55) = 0;
  v19 = objc_msgSend(v15, "enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:", 129, mach_continuous_time(), 0, 0, 16, &v61, v55);
  *((_DWORD *)v69 + 6) = (_DWORD)v19;
  if ((_DWORD)v19)
  {
    NSLog(CFSTR("enqueueCommand:%x"), v19);
  }
  else if (dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL))
  {
    *((_DWORD *)v69 + 6) = -536870186;
  }
  objc_msgSend(v15, "cancel");
  v39 = *((_DWORD *)v69 + 6);
  if (!v39)
  {
    if (objc_msgSend(*(id *)(v73 + 40), "count"))
    {
      for (i = 0; ; ++i)
      {
        v43 = objc_msgSend(*(id *)(v73 + 40), "count");
        v44 = *(void **)(v73 + 40);
        if (i >= (unint64_t)v43)
        {
          v85[0] = _NSConcreteStackBlock;
          v85[1] = 3221225472;
          v85[2] = sub_100005380;
          v85[3] = &unk_10000C608;
          v85[4] = &v79;
          v85[5] = &v72;
          objc_msgSend(v44, "enumerateObjectsUsingBlock:", v85);
          v36 = (__CFSet *)(id)v80[5];
          goto LABEL_47;
        }
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndexedSubscript:", i));
        v85[0] = 0;
        v46 = objc_retainAutorelease(v45);
        v47 = sub_1000076B8((char *)objc_msgSend(v46, "bytes"), (unint64_t)objc_msgSend(v46, "length"), kCFAllocatorDefault, 0, v85);
        if (!v47)
          break;
        objc_msgSend(*(id *)(v73 + 40), "setObject:atIndexedSubscript:", v47, i);

      }
      v48 = objc_retainAutorelease(v46);
      sub_100002AE0((uint64_t)objc_msgSend(v48, "bytes"), (unint64_t)objc_msgSend(v48, "length"), "AFKReg Failed", 1);
      v49 = _AFKUserLog();
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
        sub_1000092BC(v13, v50);

      v36 = (__CFSet *)*(id *)(v73 + 40);
LABEL_47:
      v41 = 0;
      goto LABEL_48;
    }
    v39 = *((_DWORD *)v69 + 6);
  }
  v86 = NSDebugDescriptionErrorKey;
  v85[0] = CFSTR("Did not receive registry dump AFK Endpoint Interface");
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, &v86, 1));
  v41 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.afktool"), v39, v40));

  v36 = 0;
LABEL_48:

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v79, 8);

  _Block_object_dispose(&v72, 8);
  v51 = v41;
  v38 = v51;
  if (v51)
    NSLog(CFSTR("ERROR! Registry dump for service:0x%llx error:%@"), entryID, v51);

LABEL_51:
  if (!v36)
  {
LABEL_55:
    v52 = v56;
    goto LABEL_58;
  }
LABEL_52:
  v52 = v56;
  if (*(_QWORD *)(a1 + 32))
  {
    if (v57)
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v36);
    else
      NSLog(CFSTR("ERROR! no role:0x%llx"), entryID);
  }
  else
  {
    v53 = *(void **)(a1 + 48);
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%llx"), entryID));
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v36, v54);

  }
LABEL_58:

}

void sub_100004EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,id a41)
{
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a36, 8);

  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000506C(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v11;

  v5 = a1;
  v6 = a2;
  v7 = objc_msgSend(objc_alloc((Class)NSOutputStream), "initToFileAtPath:append:", v6, 1);
  objc_msgSend(v7, "open");
  v11 = 0;
  +[NSPropertyListSerialization writePropertyList:toStream:format:options:error:](NSPropertyListSerialization, "writePropertyList:toStream:format:options:error:", v5, v7, a3, 0, &v11);
  v8 = v11;
  objc_msgSend(v7, "close");
  if (v8)
  {
    NSLog(CFSTR("ERROR! Unable to write registry output, serialization error: %@"), v8);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_100005148(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

int *sub_10000516C(int *result, unsigned int a2)
{
  int *v3;
  const std::string::value_type *v4;
  uint64_t v5;
  const std::string::value_type *v6;
  std::runtime_error *exception;
  std::string v8;

  if (*result != a2)
  {
    v3 = result;
    sub_100006264(&v8, "Illegal cast to ");
    if (a2 > 4)
      v4 = "unknown";
    else
      v4 = off_10000C6C0[a2];
    std::string::append(&v8, v4);
    std::string::append(&v8, "; type is actually ");
    v5 = *v3;
    if (v5 > 4)
      v6 = "unknown";
    else
      v6 = off_10000C6C0[v5];
    std::string::append(&v8, v6);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, &v8);
  }
  return result;
}

void sub_100005244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_100005270(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005280(uint64_t a1)
{

}

intptr_t sub_100005288(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000529C(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  if (a3 == 130)
  {
    if (a6)
    {
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (!v10)
      {
        v11 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", a6);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      }
      objc_msgSend(v10, "appendBytes:length:", a5, a6);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = 0;

    }
  }

}

void sub_10000536C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100005380(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v8 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("class")));
  if (objc_msgSend(v4, "isEqual:", CFSTR("AFKRootService")))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("children")));
  if (v5)
  {
    v6 = objc_alloc_init((Class)NSMutableArray);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000054EC;
    v9[3] = &unk_10000C5E0;
    v11 = *(_QWORD *)(a1 + 40);
    v7 = v6;
    v10 = v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("children"));

  }
}

void sub_10000549C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1000054EC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000055A8;
  v7[3] = &unk_10000C5B8;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void sub_100005584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_1000055A8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v9 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id")));
  LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    *a4 = 1;
  }

}

void sub_100005634(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

intptr_t sub_10000565C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (a4)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a4;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a6, a7));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000056BC(void *a1, int a2, int a3, unint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  const char *v23;
  const char *v24;
  const char *v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  unsigned int v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  int v38;
  uint64_t v39;

  v7 = a1;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("children")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectEnumerator"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));
  v10 = (1 << a3) | a4;
  if (!a2)
    v10 = ~(1 << a3) & a4;
  v11 = (void *)v9;
  v12 = v10 & ~(2 << a3);
  v13 = v10 | (2 << a3);
  if (v9)
    v14 = v13;
  else
    v14 = v12;
  v15 = v7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("properties")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("name")));

  if (a3)
  {
    v18 = 0;
    do
    {
      if ((v14 & (1 << v18)) != 0)
        printf("| ");
      else
        printf("  ");
      ++v18;
    }
    while (a3 != v18);
  }
  printf("+-o ");
  v19 = objc_retainAutorelease(v17);
  printf("%s", (const char *)objc_msgSend(v19, "UTF8String"));
  printf("  <class ");
  v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("class"))));
  printf("%s", (const char *)objc_msgSend(v32, "UTF8String"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("id")));
  printf(", id 0x%llx", objc_msgSend(v20, "longLongValue"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("state")));
  v34 = v20;
  v22 = objc_msgSend(v21, "longLongValue");

  v23 = "";
  v24 = "!";
  if ((v22 & 0x20) != 0)
    v25 = "";
  else
    v25 = "!";
  if ((v22 & 8) != 0)
    v24 = "";
  if ((v22 & 1) != 0)
    v23 = "in";
  printf(", %sregistered, %sterminated, %sactive", v25, v24, v23);
  puts(">");
  v26 = 0;
  v27 = (a3 + 1);
  do
  {
    if ((v14 & (1 << v26)) != 0)
      printf("| ");
    else
      printf("  ");
    ++v26;
  }
  while (v26 <= v27);
  puts("{");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("properties")));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3321888768;
  v36[2] = sub_100005BCC;
  v36[3] = &unk_10000C690;
  v35 = v15;
  v37 = v35;
  v38 = a3;
  v39 = v14;
  objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v36);
  v29 = 0;
  do
  {
    if ((v14 & (1 << v29)) != 0)
      printf("| ");
    else
      printf("  ");
    ++v29;
  }
  while (v29 <= v27);
  puts("}");
  v30 = 0;
  do
  {
    if ((v14 & (1 << v30)) != 0)
      printf("| ");
    else
      printf("  ");
    ++v30;
  }
  while (v30 <= v27);
  putchar(10);

  while (v11)
  {
    v31 = v11;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nextObject"));

    sub_1000056BC(v31, v11 != 0, v27, v14);
  }

}

void sub_100005AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_100005B5C(id a1, id a2, id a3, BOOL *a4)
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    sub_1000056BC(v5, 0, 0, 0);

}

void sub_100005BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100005BCC(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  __CFString *v8;
  __CFString *v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  id v14;

  v14 = a2;
  v7 = a3;
  *a4 = 0;
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("children")) & 1) == 0)
  {
    v8 = (__CFString *)v14;
    v9 = (__CFString *)v7;
    v10 = 0;
    v11 = *(_DWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v13 = v11 + 1;
    do
    {
      if ((v12 & (1 << v10)) != 0)
        printf("| ");
      else
        printf("  ");
      ++v10;
    }
    while (v10 <= v13);
    printf("  ");
    sub_100005D3C(v8);
    printf(" = ");
    sub_100005D3C(v9);
    putchar(10);

  }
}

void sub_100005CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

__n128 sub_100005D00(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)(a1 + 32) = *(id *)(a2 + 32);
  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void sub_100005D34(uint64_t a1)
{

}

void sub_100005D3C(const __CFString *a1)
{
  CFTypeID v2;
  CFIndex Count;
  int v4;
  CFIndex Length;
  const UInt8 *BytePtr;
  CFIndex v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  uint64_t v11;
  BOOL v13;
  CFIndex v14;
  int v15;
  uint64_t i;
  int v17;
  int v18;
  char context;
  char v20;
  uint64_t valuePtr;
  CFRange v22;

  v2 = CFGetTypeID(a1);
  if (v2 == CFArrayGetTypeID())
  {
    context = 1;
    Count = CFArrayGetCount((CFArrayRef)a1);
    putchar(40);
    v22.location = 0;
    v22.length = Count;
    CFArrayApplyFunction((CFArrayRef)a1, v22, (CFArrayApplierFunction)sub_1000061A8, &context);
    v4 = 41;
LABEL_3:
    putchar(v4);
    return;
  }
  if (v2 == CFBooleanGetTypeID())
  {
    if (CFBooleanGetValue((CFBooleanRef)a1))
      printf("Yes");
    else
      printf("No");
    return;
  }
  if (v2 == CFDataGetTypeID())
  {
    putchar(60);
    Length = CFDataGetLength((CFDataRef)a1);
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    if (Length >= 1)
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
LABEL_12:
      if (BytePtr[v7])
        v10 = v7 < Length;
      else
        v10 = 0;
      if (!v10)
        goto LABEL_36;
      while (1)
      {
        v11 = BytePtr[v7];
        if ((char)BytePtr[v7] < 0)
        {
          if (__maskrune(v11, 0x40000uLL))
          {
LABEL_19:
            ++v9;
            goto LABEL_23;
          }
        }
        else if ((_DefaultRuneLocale.__runetype[v11] & 0x40000) != 0)
        {
          goto LABEL_19;
        }
        if ((char)BytePtr[v7] > -2)
        {
          if (BytePtr[v7])
            goto LABEL_36;
          if (++v7 >= Length)
            goto LABEL_36;
          goto LABEL_12;
        }
        ++v8;
LABEL_23:
        if (Length == ++v7)
        {
          v7 = Length;
          goto LABEL_36;
        }
      }
    }
    v9 = 0;
    v8 = 0;
    v7 = 0;
LABEL_36:
    v13 = v8 > v9 >> 2 || Length == 1;
    if (((v13 | byte_100010208) & 1) != 0)
      v14 = 0;
    else
      v14 = v7;
    if (v9 && v14 >= Length)
    {
      if (Length >= 1)
      {
        v15 = 0;
        for (i = 0; i != Length; ++i)
        {
          if (BytePtr[i])
          {
            if (!v15)
            {
              if (i)
                printf(",\"");
              else
                putchar(34);
              v15 = 1;
            }
            v17 = BytePtr[i];
          }
          else
          {
            if (v15 != 1)
              goto LABEL_63;
            v15 = 0;
            v17 = 34;
          }
          putchar(v17);
        }
        if (v15 == 1)
          putchar(34);
      }
    }
    else if (Length >= 1)
    {
      do
      {
        v18 = *BytePtr++;
        printf("%02x", v18);
        --Length;
      }
      while (Length);
    }
LABEL_63:
    putchar(62);
  }
  else
  {
    if (v2 == CFDictionaryGetTypeID())
    {
      v20 = 1;
      putchar(123);
      CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)sub_1000061E0, &v20);
      v4 = 125;
      goto LABEL_3;
    }
    if (v2 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr))
      {
        if (byte_100010208)
          printf("0x%qx");
        else
          printf("%qu");
      }
    }
    else if (v2 == CFSetGetTypeID())
    {
      sub_1000060AC((const __CFSet *)a1);
    }
    else if (v2 == CFStringGetTypeID())
    {
      sub_1000060FC(a1);
    }
    else
    {
      printf("<unknown object>");
    }
  }
}

uint64_t sub_1000060AC(const __CFSet *a1)
{
  char context;

  context = 1;
  putchar(91);
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_10000622C, &context);
  return putchar(93);
}

void sub_1000060FC(const __CFString *a1)
{
  const char *CStringPtr;
  CFIndex v3;
  char *v4;
  char *v5;

  CStringPtr = CFStringGetCStringPtr(a1, 0);
  if (CStringPtr)
  {
    printf("\"%s\"", CStringPtr);
  }
  else
  {
    v3 = CFStringGetLength(a1) + 1;
    v4 = (char *)malloc_type_malloc(v3, 0x4A2F5AA8uLL);
    if (v4)
    {
      v5 = v4;
      if (CFStringGetCString(a1, v4, v3, 0))
        printf("\"%s\"", v5);
      free(v5);
    }
  }
}

uint64_t sub_1000061A8(uint64_t a1, _BYTE *a2)
{
  if (*a2)
    *a2 = 0;
  else
    putchar(44);
  return sub_100005D3C(a1);
}

uint64_t sub_1000061E0(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if (*a3)
    *a3 = 0;
  else
    putchar(44);
  sub_100005D3C(a1);
  putchar(61);
  return sub_100005D3C(a2);
}

uint64_t sub_10000622C(uint64_t a1, _BYTE *a2)
{
  if (*a2)
    *a2 = 0;
  else
    putchar(44);
  return sub_100005D3C(a1);
}

_QWORD *sub_100006264(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_1000030FC();
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

void sub_100006314()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

_OWORD *sub_10000633C(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;
  uint64_t v14;

  v6 = (void **)sub_1000063FC((uint64_t)a1, &v14, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x58uLL);
    v12[1] = a1 + 1;
    v9 = *a4;
    v10 = *((_QWORD *)*a4 + 2);
    v7[2] = **a4;
    *((_QWORD *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *v9 = 0;
    *((_DWORD *)v7 + 14) = 0;
    v13 = 1;
    sub_100006498(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    sub_1000066EC((uint64_t)v12, 0);
  }
  return v7;
}

_QWORD *sub_1000063FC(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!sub_1000064EC(v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!sub_1000064EC(v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *sub_100006498(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_100006554(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_1000064EC(uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

uint64_t *sub_100006554(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_1000066EC(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_100006730((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void sub_100006730(uint64_t a1)
{
  int v2;
  void **v3;

  v2 = *(_DWORD *)(a1 + 24);
  if (v2 == 4)
  {
    v3 = (void **)(a1 + 32);
    sub_10000679C(&v3);
  }
  else if (v2 == 3 && *(char *)(a1 + 55) < 0)
  {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void sub_10000679C(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_1000067DC((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_1000067DC(uint64_t *a1)
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

uint64_t *sub_100006828(uint64_t *a1, const void ***a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  sub_10000687C(a1, *a2, a2 + 1);
  return a1;
}

void sub_100006864(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_100006F80(v1, *(_QWORD **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *sub_10000687C(uint64_t *result, const void **a2, const void ***a3)
{
  const void **v4;
  uint64_t **v5;
  uint64_t *v6;
  const void **v7;
  const void ***v8;
  BOOL v9;

  if (a2 != (const void **)a3)
  {
    v4 = a2;
    v5 = (uint64_t **)result;
    v6 = result + 1;
    do
    {
      result = sub_100006900(v5, v6, v4 + 4, (__int128 *)v4 + 2);
      v7 = (const void **)v4[1];
      if (v7)
      {
        do
        {
          v8 = (const void ***)v7;
          v7 = (const void **)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (const void ***)v4[2];
          v9 = *v8 == v4;
          v4 = (const void **)v8;
        }
        while (!v9);
      }
      v4 = (const void **)v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *sub_100006900(uint64_t **a1, uint64_t *a2, const void **a3, __int128 *a4)
{
  const void **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t *v10[3];
  uint64_t v11;
  const void **v12;

  v6 = sub_100006994(a1, a2, &v12, &v11, a3);
  v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    sub_100006B2C((uint64_t)a1, a4, (uint64_t)v10);
    sub_100006498(a1, (uint64_t)v12, v8, v10[0]);
    v7 = v10[0];
    v10[0] = 0;
    sub_1000066EC((uint64_t)v10, 0);
  }
  return v7;
}

const void **sub_100006994(_QWORD *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  const void **v9;
  const void **v11;
  const void **v12;
  uint64_t v13;
  const void **v14;
  const void **v15;
  uint64_t *v16;
  BOOL v17;
  const void **v18;

  v9 = (const void **)(a1 + 1);
  if (a1 + 1 == a2 || sub_1000064EC((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if ((uint64_t *)*a1 == a2)
    {
      v12 = (const void **)a2;
LABEL_16:
      if (*a2)
      {
        *a3 = v12;
        return v12 + 1;
      }
      else
      {
        *a3 = (const void **)a2;
        return (const void **)a2;
      }
    }
    v11 = (const void **)*a2;
    if (*a2)
    {
      do
      {
        v12 = v11;
        v11 = (const void **)v11[1];
      }
      while (v11);
    }
    else
    {
      v16 = a2;
      do
      {
        v12 = (const void **)v16[2];
        v17 = *v12 == v16;
        v16 = (uint64_t *)v12;
      }
      while (v17);
    }
    if (sub_1000064EC((uint64_t)(a1 + 2), v12 + 4, a5))
      goto LABEL_16;
    return (const void **)sub_1000063FC((uint64_t)a1, a3, a5);
  }
  if (sub_1000064EC((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
  {
    a4 = a2 + 1;
    v13 = a2[1];
    if (v13)
    {
      v14 = (const void **)a2[1];
      do
      {
        v15 = v14;
        v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      v18 = (const void **)a2;
      do
      {
        v15 = (const void **)v18[2];
        v17 = *v15 == v18;
        v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!sub_1000064EC((uint64_t)(a1 + 2), a5, v15 + 4))
        return (const void **)sub_1000063FC((uint64_t)a1, a3, a5);
      v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  *a3 = (const void **)a2;
  *a4 = (uint64_t)a2;
  return (const void **)a4;
}

char *sub_100006B2C@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  char *result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x58uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = sub_100006B94(v6 + 32, a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_100006B7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1000066EC(v1, 0);
  _Unwind_Resume(a1);
}

char *sub_100006B94(char *__dst, __int128 *a2)
{
  __int128 v4;
  int v5;
  char *v6;
  __int128 v7;

  if (*((char *)a2 + 23) < 0)
  {
    sub_100006C94(__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *((_QWORD *)__dst + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }
  v5 = *((_DWORD *)a2 + 6);
  *((_DWORD *)__dst + 6) = v5;
  v6 = __dst + 32;
  switch(v5)
  {
    case 1:
      *v6 = *((_BYTE *)a2 + 32);
      break;
    case 2:
      *(_QWORD *)v6 = *((_QWORD *)a2 + 4);
      break;
    case 3:
      if (*((char *)a2 + 55) < 0)
      {
        sub_100006C94(v6, *((void **)a2 + 4), *((_QWORD *)a2 + 5));
      }
      else
      {
        v7 = a2[2];
        *((_QWORD *)__dst + 6) = *((_QWORD *)a2 + 6);
        *(_OWORD *)v6 = v7;
      }
      break;
    case 4:
      *(_QWORD *)v6 = 0;
      *((_QWORD *)__dst + 5) = 0;
      *((_QWORD *)__dst + 6) = 0;
      sub_100006D20(v6, *((__int128 **)a2 + 4), *((__int128 **)a2 + 5), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 5) - *((_QWORD *)a2 + 4)) >> 3));
      break;
    default:
      return __dst;
  }
  return __dst;
}

void sub_100006C78(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void *sub_100006C94(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_1000030FC();
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

char *sub_100006D20(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;

  if (a4)
  {
    v6 = result;
    sub_100006DA4(result, a4);
    result = sub_100006E4C((uint64_t)(v6 + 16), a2, a3, *((char **)v6 + 1));
    *((_QWORD *)v6 + 1) = result;
  }
  return result;
}

void sub_100006D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  sub_10000679C(&a9);
  _Unwind_Resume(a1);
}

char *sub_100006DA4(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_100006DF4();
  result = (char *)sub_100006E08((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void sub_100006DF4()
{
  sub_100003110("vector");
}

void *sub_100006E08(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_100006314();
  return operator new(24 * a2);
}

char *sub_100006E4C(uint64_t a1, __int128 *a2, __int128 *a3, char *__dst)
{
  char *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  char *v11;
  char *v12;

  v4 = __dst;
  v11 = __dst;
  v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_100006C94(v4, *(void **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        *((_QWORD *)v4 + 2) = *((_QWORD *)v6 + 2);
        *(_OWORD *)v4 = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v4 += 24;
      v12 = v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  sub_100006F08((uint64_t)v9);
  return v4;
}

void sub_100006EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100006F08((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_100006F08(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_100006F3C(a1);
  return a1;
}

void sub_100006F3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0)
      operator delete(*(void **)(v1 - 24));
    v1 -= 24;
  }
}

void sub_100006F80(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_100006F80(a1, *a2);
    sub_100006F80(a1, a2[1]);
    sub_100006730((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

__CFSet *sub_100006FC8(char *__s2, unint64_t a2, const __CFAllocator *a3, uint64_t a4, _QWORD *a5)
{
  __CFSet *v6;
  _QWORD *v7;
  __CFArray *v8;
  __CFDictionary *v9;
  const __CFString *v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  int v14;
  int v15;
  CFIndex v16;
  uint64_t v17;
  CFMutableDictionaryRef Mutable;
  __CFArray *v19;
  _BOOL4 v20;
  CFNumberType v21;
  CFIndex v22;
  const char *CStringPtr;
  unsigned int v24;
  uint64_t v25;
  char *v26;
  int v27;
  char v28;
  char *v29;
  __CFDictionary *v30;
  unsigned int v31;
  const __CFString **v32;
  const __CFString *v33;
  CFTypeID TypeID;
  BOOL v35;
  unint64_t v36;
  unsigned int v37;
  CFTypeID v38;
  unsigned int v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  unsigned int v43;
  int v44;
  const void **v45;
  const void *v46;
  unint64_t v48;
  __CFString *v49;
  uint64_t v50;
  void *v51;
  _BOOL4 v52;
  unsigned int v53;
  char *v54;
  __CFSet *theSet;
  _QWORD *v56;
  char *__src;
  const __CFString *v59;
  CFMutableDictionaryRef v60;
  __CFDictionary *v61;
  __CFArray *v62;
  _BOOL4 v63;
  uint64_t v64;
  const __CFString *v65;
  unsigned int v66;
  char *v67;

  if (a5)
    *a5 = 0;
  v6 = 0;
  if (a2 < 4 || (__s2 & 3) != 0)
    return v6;
  if (*__s2 == 212)
  {
    v48 = a2 >> 2;
    v7 = malloc_type_calloc(a2 >> 2, 8uLL, 0xC0040B8AA526DuLL);
  }
  else
  {
    if (strcmp(byte_10000A130, __s2))
      return 0;
    v48 = 0;
    v7 = 0;
  }
  v65 = 0;
  v6 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v49 = 0;
  v53 = 0;
  v50 = 0;
  v51 = 0;
  v66 = 0;
  v64 = 0;
  __src = 0;
  v54 = __s2;
  v67 = __s2 + 4;
  v52 = v7 != 0;
  v11 = 4;
  v56 = v7;
LABEL_11:
  theSet = v6;
  v61 = v9;
  v62 = v8;
  while (2)
  {
    v59 = v10;
    v12 = v11 + 4;
    if (v11 + 4 > a2)
      goto LABEL_93;
    v6 = 0;
    v13 = v67 + 4;
    v14 = *(_DWORD *)v67;
    v15 = *(_DWORD *)v67 & 0x7F000000;
    v16 = *(_DWORD *)v67 & 0xFFFFFFLL;
    v17 = (v16 + 3) >> 2;
    switch((v15 - 0x1000000) >> 24)
    {
      case 0u:
        Mutable = CFDictionaryCreateMutable(a3, v16, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v19 = 0;
        v6 = 0;
        v63 = v16 != 0;
        v60 = Mutable;
        goto LABEL_17;
      case 1u:
        Mutable = CFArrayCreateMutable(a3, v16, &kCFTypeArrayCallBacks);
        v60 = 0;
        v6 = 0;
        v63 = v16 != 0;
        v19 = Mutable;
        goto LABEL_17;
      case 2u:
        Mutable = CFSetCreateMutable(a3, v16, &kCFTypeSetCallBacks);
        v6 = Mutable;
        v60 = 0;
        v19 = 0;
        v63 = v16 != 0;
LABEL_17:
        v10 = (const __CFString *)Mutable;
        v20 = v52;
        goto LABEL_37;
      case 3u:
        v12 = v11 + 12;
        if (v11 + 12 > a2)
          goto LABEL_93;
        if (v16 < 0x21)
          v21 = kCFNumberSInt32Type;
        else
          v21 = kCFNumberSInt64Type;
        v10 = (const __CFString *)CFNumberCreate(a3, v21, v13);
        v60 = 0;
        v19 = 0;
        v6 = 0;
        v63 = 0;
        v20 = 0;
        v13 = v67 + 12;
        goto LABEL_37;
      case 7u:
        if (!(_DWORD)v16)
          goto LABEL_93;
        LODWORD(v16) = v16 - 1;
        goto LABEL_25;
      case 8u:
LABEL_25:
        v12 += 4 * v17;
        if (v12 > a2)
          goto LABEL_93;
        v22 = v16;
        if (v15 == 0x8000000)
        {
          if (v13[v16])
            goto LABEL_93;
        }
        v10 = CFStringCreateWithBytes(a3, (const UInt8 *)v13, v16, 0x8000100u, 0);
        if (!v10)
        {
          v10 = CFStringCreateWithBytes(a3, (const UInt8 *)v13, v22, 0, 0);
          CStringPtr = CFStringGetCStringPtr(v10, 0);
          syslog(3, "FIXME: IOUnserialize has detected a string that is not valid UTF-8, \"%s\".", CStringPtr);
        }
LABEL_32:
        v60 = 0;
        v19 = 0;
        v6 = 0;
        v63 = 0;
        v20 = 0;
        v13 += 4 * v17;
LABEL_37:
        v24 = v66;
        v25 = v64;
        if (!v10)
          goto LABEL_93;
        if (v66 < v64)
        {
          v26 = __src;
LABEL_46:
          v28 = 0;
          *(_QWORD *)&v26[8 * v24] = v10;
          v27 = 1;
          v64 = v25;
          __src = v26;
          v7 = v56;
          goto LABEL_47;
        }
        if (BYTE3(v64))
        {
          v27 = 0;
          v28 = 1;
          goto LABEL_47;
        }
        v25 = (v64 + 64);
        v29 = (char *)malloc_type_malloc(8 * v25, 0xC0040B8AA526DuLL);
        if (v29)
        {
          v26 = v29;
          if (__src)
          {
            memmove(v29, __src, 8 * v64);
            free(__src);
          }
          v24 = v66;
          goto LABEL_46;
        }
        v27 = 0;
        v28 = 1;
        v7 = v56;
        v24 = v66;
LABEL_47:
        v30 = v60;
        if (v7)
          v7[(v67 - v54) >> 2] = v10;
        if ((v28 & 1) != 0)
          goto LABEL_92;
        v31 = v24 + 1;
        if (v20)
        {
          v11 = v12 + 4;
          if (v12 + 4 > a2)
          {
            v66 = v31;
LABEL_92:
            CFRelease(v10);
LABEL_93:
            v6 = 0;
            goto LABEL_94;
          }
          v67 = v13 + 4;
          v27 = 1;
        }
        else
        {
LABEL_61:
          v11 = v12;
          v67 = v13;
        }
        v33 = v65;
        v66 = v31;
        if (v61)
        {
          if (v65)
          {
            if (v10 != (const __CFString *)v61)
              CFDictionarySetValue(v61, v65, v10);
            v33 = 0;
          }
          else
          {
            TypeID = CFStringGetTypeID();
            v33 = v10;
            v35 = TypeID == CFGetTypeID(v10);
            v7 = v56;
            if (!v35)
              goto LABEL_93;
          }
        }
        else if (v62)
        {
          CFArrayAppendValue(v62, v10);
        }
        else if (theSet)
        {
          CFSetAddValue(theSet, v10);
        }
        else
        {
          v36 = (unint64_t)v49 | (unint64_t)v59;
          v49 = (__CFString *)v10;
          if (v36)
            goto LABEL_93;
        }
        if (!v27)
          goto LABEL_93;
        v65 = v33;
        if (v63)
        {
          theSet = v6;
          v61 = v30;
          v62 = v19;
          if (v14 < 0)
            continue;
          v39 = v53 + 1;
          if (v53 + 1 >= v50)
          {
            if (WORD1(v50))
              goto LABEL_93;
            v41 = (v50 + 64);
            v42 = malloc_type_malloc(8 * v41, 0xC0040B8AA526DuLL);
            if (!v42)
              goto LABEL_93;
            v40 = v42;
            if (v51)
            {
              memmove(v42, v51, 8 * v50);
              free(v51);
            }
          }
          else
          {
            v40 = v51;
            v41 = v50;
          }
          v9 = v30;
          v8 = v19;
          ++v53;
          v40[v39] = v59;
          v50 = v41;
          v51 = v40;
          goto LABEL_11;
        }
        v10 = v59;
        if ((v14 & 0x80000000) == 0)
          continue;
        v37 = v53;
        if (v53)
        {
          v10 = (const __CFString *)*((_QWORD *)v51 + v53--);
          v38 = CFGetTypeID(*((CFTypeRef *)v51 + v37));
          theSet = 0;
          v61 = (__CFDictionary *)v10;
          v62 = 0;
          if (v38 != CFDictionaryGetTypeID())
          {
            theSet = 0;
            v61 = 0;
            v62 = (__CFArray *)v10;
            if (v38 != CFArrayGetTypeID())
            {
              v61 = 0;
              v62 = 0;
              v6 = 0;
              theSet = (__CFSet *)v10;
              if (v38 != CFSetGetTypeID())
                goto LABEL_94;
            }
          }
          continue;
        }
        v6 = (__CFSet *)v49;
LABEL_94:
        if ((_DWORD)v64)
        {
          v43 = v6 != 0;
          v44 = v66 - v43;
          if (v66 > v43)
          {
            v45 = (const void **)&__src[8 * (v6 != 0)];
            do
            {
              v46 = *v45++;
              CFRelease(v46);
              --v44;
            }
            while (v44);
          }
          free(__src);
        }
        if ((_DWORD)v50)
          free(v51);
        if (v7)
          free(v7);
        return v6;
      case 9u:
        v12 += 4 * v17;
        if (v12 > a2)
          goto LABEL_93;
        v10 = (const __CFString *)CFDataCreate(a3, (const UInt8 *)v13, v16);
        goto LABEL_32;
      case 0xAu:
        if ((_DWORD)v16)
          v10 = (const __CFString *)kCFBooleanTrue;
        else
          v10 = (const __CFString *)kCFBooleanFalse;
        CFRetain(v10);
        v60 = 0;
        v19 = 0;
        v6 = 0;
        v63 = 0;
        v20 = 0;
        goto LABEL_37;
      case 0xBu:
        if (v7)
        {
          v31 = v66;
          if (v48 <= v16)
            goto LABEL_93;
          v32 = (const __CFString **)&v7[v16];
        }
        else
        {
          v31 = v66;
          if (v16 >= v66)
            goto LABEL_93;
          v32 = (const __CFString **)&__src[8 * v16];
        }
        v6 = 0;
        v10 = *v32;
        if (!*v32)
          goto LABEL_94;
        v63 = 0;
        v27 = 1;
        v19 = 0;
        v30 = 0;
        goto LABEL_61;
      default:
        goto LABEL_94;
    }
  }
}

__CFSet *sub_1000076B8(char *__s2, unint64_t a2, const __CFAllocator *a3, uint64_t a4, _QWORD *a5)
{
  if (a5)
    *a5 = 0;
  if (__s2 && a2 >= 4 && ((a4 & 1) != 0 || !strcmp(byte_10000A130, __s2) || *__s2 == 212))
    return sub_100006FC8(__s2, a2, a3, a4, a5);
  else
    return 0;
}

uint64_t sub_100007744(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  uint64_t v5;
  uint64_t MatchingServices;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  io_iterator_t existing;
  _BYTE v22[128];

  v3 = a1;
  v4 = a2;
  existing = 0;
  v5 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, (CFDictionaryRef)v3, &existing);
    if ((_DWORD)MatchingServices)
    {
      NSLog(CFSTR("Matching returned error: %d"), MatchingServices);
      v7 = 0;
      goto LABEL_22;
    }
    while (1)
    {
      v8 = IOIteratorNext(existing);
      if (!(_DWORD)v8)
        break;
      v4[2](v4, v8);
      IOObjectRelease(v8);
    }
    IOObjectRelease(existing);
LABEL_19:
    v7 = 1;
    goto LABEL_22;
  }
  v9 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v3, v9) & 1) == 0)
    goto LABEL_19;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = IOServiceGetMatchingServices(kIOMainPortDefault, (CFDictionaryRef)*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13), &existing);
        if ((_DWORD)v14)
        {
          NSLog(CFSTR("Matching returned error: %d"), v14);
          v7 = 0;
          goto LABEL_21;
        }
        while (1)
        {
          v15 = IOIteratorNext(existing);
          if (!(_DWORD)v15)
            break;
          v4[2](v4, v15);
          IOObjectRelease(v15);
        }
        IOObjectRelease(existing);
        v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_21:

LABEL_22:
  return v7;
}

void sub_10000797C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id sub_1000079C0(void *a1, uint64_t a2)
{
  _UNKNOWN **v3;
  BOOL v4;
  _UNKNOWN **v5;
  uint64_t v6;
  id v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;

  v3 = a1;
  if (a2)
    v4 = v3 == 0;
  else
    v4 = 0;
  if (v4)
    v5 = &off_10000CEA8;
  else
    v5 = v3;
  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = objc_msgSend(v5, "longLongValue");
    if (a2 == 16)
      v8 = CFSTR("%#llx");
    else
      v8 = CFSTR("%lld");
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v7));
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v5));
  }
  v10 = (void *)v9;

  return v10;
}

void sub_100007A8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100007A9C(uint64_t *a1)
{
  uint64_t *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v26;
  id v27;
  uint64_t v28;
  id v29;

  if (*((char *)a1 + 23) >= 0)
    v1 = a1;
  else
    v1 = (uint64_t *)*a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithUTF8String:](NSMutableString, "stringWithUTF8String:", v1));
  v29 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("0[xX][0-9a-f]+"), 1, &v29));
  v4 = v29;
  v5 = 0;
  v6 = 0;
  while (1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstMatchInString:options:range:", v2, 0, v6, (_BYTE *)objc_msgSend(v2, "length") - v6));

    if (!v7)
      break;
    v8 = objc_msgSend(v7, "range");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "substringWithRange:", v8, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v10));

    v28 = 0;
    objc_msgSend(v11, "scanHexLongLong:", &v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), v28));
    v13 = objc_msgSend(v7, "range");
    objc_msgSend(v2, "replaceCharactersInRange:withString:", v13, v14, v12);
    v15 = (char *)objc_msgSend(v7, "range");
    v6 = &v15[(_QWORD)objc_msgSend(v12, "length")];

    v5 = v7;
  }

  if (!v2 || !objc_msgSend(v2, "length"))
  {
    v17 = 0;
    goto LABEL_19;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "substringToIndex:", 1));
  if (objc_msgSend(v16, "isEqual:", CFSTR("[")))
  {

    goto LABEL_13;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "substringToIndex:", 1));
  v19 = objc_msgSend(v18, "isEqual:", CFSTR("{"));

  if (v19)
  {
LABEL_13:
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataUsingEncoding:", 4));
    v27 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v20, 1, &v27));
    v22 = v27;

    v17 = v21;
    if (!v22)
      goto LABEL_19;
    goto LABEL_16;
  }
  v22 = 0;
  v21 = 0;
LABEL_16:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataUsingEncoding:", 4));
  v26 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v23, 0, 0, &v26));
  v24 = v26;

  if (v24)
    NSLog(CFSTR("ERROR! Failed to parse property string [%@] JSON error: %@ Plist error: %@"), v2, v22, v24);

LABEL_19:
  return v17;
}

void sub_100007DAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

NSMutableData *sub_100007E40(unsigned __int8 **a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v2;
  uint64_t v4;
  unint64_t v5;
  NSMutableData *v6;
  NSMutableData *v7;
  _BYTE *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned __int8 *v16;
  int v17;
  unsigned int v18;
  char v19;
  unsigned __int8 *v20;
  char v21;
  int v22;
  unsigned int v23;
  char v24;
  unsigned __int8 *v25;
  int v26;
  unsigned int v27;
  char v28;

  v2 = *a1;
  v1 = a1[1];
  if (v1 == *a1)
  {
    v7 = 0;
  }
  else
  {
    v4 = 0;
    do
    {
      if ((char)v2[23] < 0)
        v5 = *((_QWORD *)v2 + 1);
      else
        v5 = v2[23];
      v4 += (v5 >> 1) + (v5 & 1);
      v2 += 24;
    }
    while (v2 != v1);
    v6 = objc_opt_new(NSMutableData);
    -[NSMutableData setLength:](v6, "setLength:", v4);
    v7 = objc_retainAutorelease(v6);
    v8 = -[NSMutableData mutableBytes](v7, "mutableBytes");
    v9 = *a1;
    v10 = a1[1];
    if (*a1 != v10)
    {
      v11 = 0;
      do
      {
        if ((char)v9[23] < 0)
          v12 = *((_QWORD *)v9 + 1);
        else
          LODWORD(v12) = v9[23];
        v13 = (v12 - 1);
        if ((int)v12 >= 1)
        {
          v14 = v12 + 1;
          while (1)
          {
            v15 = v14 - 2;
            if (v14 == 2)
              break;
            v16 = v9;
            if ((char)v9[23] < 0)
              v16 = *(unsigned __int8 **)v9;
            v17 = v16[v13];
            v18 = v17 - 97;
            v19 = v17 + 9;
            if ((v17 - 65) < 6)
              LOBYTE(v17) = v17 + 9;
            if (v18 <= 5)
              LOBYTE(v17) = v19;
            v20 = v9;
            if ((char)v9[23] < 0)
              v20 = *(unsigned __int8 **)v9;
            v21 = v17 & 0xF;
            v22 = v20[v14 - 3];
            v23 = v22 - 97;
            v24 = v22 + 9;
            if ((v22 - 65) < 6)
              LOBYTE(v22) = v22 + 9;
            if (v23 <= 5)
              LOBYTE(v22) = v24;
            v8[v11++] = v21 | (16 * v22);
            v13 -= 2;
            v14 = v15;
            if (v15 <= 1)
              goto LABEL_36;
          }
          v25 = v9;
          if ((char)v9[23] < 0)
            v25 = *(unsigned __int8 **)v9;
          v26 = *v25;
          v27 = v26 - 97;
          v28 = v26 + 9;
          if ((v26 - 65) < 6)
            LOBYTE(v26) = v26 + 9;
          if (v27 <= 5)
            LOBYTE(v26) = v28;
          v8[v11++] = v26 & 0xF;
        }
LABEL_36:
        v9 += 24;
      }
      while (v9 != v10);
    }
  }
  return v7;
}

void sub_100007FDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100007FF0(const char *a1, unint64_t a2, int a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  CFStringRef errorString;

  errorString = 0;
  if (!a2)
  {
    puts("(blank)");
    return;
  }
  if (a3 == 2)
  {
    sub_100002AE0((uint64_t)a1, a2, 0, 0);
    return;
  }
  v4 = (void *)IOCFUnserializeWithSize(a1, a2, kCFAllocatorDefault, 0, &errorString);
  v5 = v4;
  if (v4)
  {
    switch(a3)
    {
      case 0:
        v13 = 0;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 100, 0, &v13));
        v7 = v13;
        if (v9)
          printf("%.*s", (int)objc_msgSend(v9, "length"), (const char *)objc_msgSend(objc_retainAutorelease(v9), "bytes"));
        else
          NSLog(CFSTR("ERROR! Unable to convert to xml\n"));

        goto LABEL_22;
      case 1:
        if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v4))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 1, 0));
          v11 = v10;
          if (v10)
          {
            v12 = objc_msgSend(v10, "length");
            v7 = objc_retainAutorelease(v11);
            printf("%.*s\n", v12, (const char *)objc_msgSend(v7, "bytes"));
LABEL_22:

            break;
          }
        }
        NSLog(CFSTR("ERROR! Unable to convert to json\n"));
        break;
      case 3:
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
        v7 = v6;
        if (v6)
          v8 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
        else
          v8 = "(blank)";
        puts(v8);
        goto LABEL_22;
    }
  }
  else
  {
    NSLog(CFSTR("ERROR! Unable to unserialize object\n"));
  }

}

void sub_1000081E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000821C(io_registry_entry_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *CFProperty;
  void *v8;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(a1, CFSTR("role"), 0, 0);
    v10 = CFProperty;
    v11[0] = CFSTR("IOPropertyMatch");
    v9 = CFSTR("role");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    v12[0] = v8;
    v12[1] = CFSTR("md-allocator");
    v11[1] = CFSTR("IOPropertyExistsMatch");
    v11[2] = CFSTR("IOProviderClass");
    v12[2] = CFSTR("AFKMemoryDescriptorManager");
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));

  }
  sub_100007744(v5, v6);

}

void sub_100008340(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t sub_100008380(uint64_t **a1)
{
  int v2;
  _OWORD *v3;
  id v4;
  CFMutableDictionaryRef v5;
  int v6;
  _OWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  int v11;
  _OWORD *v12;
  _QWORD *v13;
  void *v14;
  int v15;
  _OWORD *v16;
  _QWORD *v17;
  BOOL v18;
  uint64_t v19;
  _QWORD v21[6];
  BOOL v22;
  void *__p[2];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  void **v29;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  sub_100006264(__p, "--matching");
  v29 = __p;
  v2 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29) + 14);
  if ((v24 & 0x80000000) == 0)
  {
    if (v2)
      goto LABEL_3;
LABEL_6:
    sub_100006264(__p, "--role");
    v29 = __p;
    v6 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29) + 14);
    if (v24 < 0)
    {
      operator delete(__p[0]);
      if (v6)
      {
LABEL_8:
        sub_100006264(__p, "--role");
        v29 = __p;
        v7 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29);
        sub_10000516C((int *)v7 + 14, 3u);
        v8 = v7 + 4;
        if (*((char *)v7 + 87) < 0)
          v8 = (_QWORD *)*v8;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 1));
        if (v24 < 0)
          operator delete(__p[0]);
        v5 = IOServiceMatching("AFKEndpointInterface");
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", v9, CFSTR("role")));
        sub_100006264(__p, "--name");
        v29 = __p;
        v11 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29) + 14);
        if (v24 < 0)
        {
          operator delete(__p[0]);
          if (v11)
            goto LABEL_14;
        }
        else if (v11)
        {
LABEL_14:
          sub_100006264(__p, "--name");
          v29 = __p;
          v12 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29);
          sub_10000516C((int *)v12 + 14, 3u);
          v13 = v12 + 4;
          if (*((char *)v12 + 87) < 0)
            v13 = (_QWORD *)*v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 1));
          if (v24 < 0)
            operator delete(__p[0]);
          -[__CFDictionary setObject:forKey:](v5, "setObject:forKey:", v14, CFSTR("IONameMatch"));

          goto LABEL_23;
        }
        objc_msgSend(v10, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("system-service"));
LABEL_23:
        -[__CFDictionary setObject:forKey:](v5, "setObject:forKey:", v10, CFSTR("IOPropertyMatch"));

        goto LABEL_24;
      }
    }
    else if (v6)
    {
      goto LABEL_8;
    }
    v5 = 0;
    goto LABEL_24;
  }
  operator delete(__p[0]);
  if (!v2)
    goto LABEL_6;
LABEL_3:
  sub_100006264(__p, "--matching");
  v29 = __p;
  v3 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29);
  sub_10000516C((int *)v3 + 14, 3u);
  v4 = sub_100007A9C((uint64_t *)v3 + 8);
  v5 = (CFMutableDictionaryRef)objc_claimAutoreleasedReturnValue(v4);
  if (v24 < 0)
    operator delete(__p[0]);
LABEL_24:
  sub_100006264(__p, "FILENAME");
  v29 = __p;
  v15 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29) + 14);
  if (v24 < 0)
  {
    operator delete(__p[0]);
    if (v15)
      goto LABEL_26;
  }
  else if (v15)
  {
LABEL_26:
    sub_100006264(__p, "FILENAME");
    v29 = __p;
    v16 = sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29);
    sub_10000516C((int *)v16 + 14, 3u);
    v17 = v16 + 4;
    if (*((char *)v16 + 87) < 0)
      v17 = (_QWORD *)*v17;
    if (v24 < 0)
      operator delete(__p[0]);
    v18 = 0;
    goto LABEL_35;
  }
  sub_100006264(__p, "--reset");
  v29 = __p;
  v18 = *((_DWORD *)sub_10000633C(a1, (const void **)__p, (uint64_t)&unk_10000A114, (_OWORD **)&v29) + 14) != 0;
  if (v24 < 0)
    operator delete(__p[0]);
  v17 = 0;
LABEL_35:
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000088E8;
  v21[3] = &unk_10000C6F0;
  v22 = v18;
  v21[4] = &v25;
  v21[5] = v17;
  sub_100007744(v5, v21);
  v19 = *((unsigned int *)v26 + 6);
  _Block_object_dispose(&v25, 8);

  return v19;
}

void sub_10000881C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000088E8(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  if (*(_BYTE *)(a1 + 48))
    result = sub_10000893C(a2);
  else
    result = sub_100008B94(a2, *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

BOOL sub_10000893C(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_semaphore_t v4;
  dispatch_queue_t v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v10;
  int v11;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _UNKNOWN **v20;

  v19 = AFKEndpointInterfaceDataQueueSizeKey;
  v20 = &off_10000CEC0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AFKEndpointInterface withService:properties:](AFKEndpointInterface, "withService:properties:", a1, v2));

  v4 = dispatch_semaphore_create(0);
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = dispatch_queue_create("afktool", 0);
  objc_msgSend(v3, "setDispatchQueue:", v5);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008F10;
  v12[3] = &unk_10000C568;
  v14 = &v15;
  v6 = v4;
  v13 = v6;
  objc_msgSend(v3, "setResponseHandler:", v12);
  objc_msgSend(v3, "activate:", 1);
  v11 = 0;
  LODWORD(v10) = 0;
  v7 = (uint64_t)objc_msgSend(v3, "enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:", 213, mach_continuous_time(), 0, 0, 16, &v11, v10);
  *((_DWORD *)v16 + 6) = v7;
  if ((_DWORD)v7)
    goto LABEL_5;
  if (dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL))
  {
    v7 = 3758097110;
    *((_DWORD *)v16 + 6) = -536870186;
LABEL_5:
    NSLog(CFSTR("ERROR!enqueueCommand:%x"), v7);
    goto LABEL_6;
  }
  v7 = *((unsigned int *)v16 + 6);
  if ((_DWORD)v7)
    goto LABEL_5;
LABEL_6:
  objc_msgSend(v3, "cancel");
  v8 = *((_DWORD *)v16 + 6) != 0;

  _Block_object_dispose(&v15, 8);
  return v8;
}

void sub_100008B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, ...)
{
  void *v10;
  void *v11;
  void *v12;
  va_list va;

  va_start(va, a10);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100008B94(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  dispatch_queue_t v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  id v14;
  _BOOL8 v15;
  uint64_t v17;
  id v18;
  int v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  _UNKNOWN **v30;

  v29 = AFKEndpointInterfaceDataQueueSizeKey;
  v30 = &off_10000CEC0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AFKEndpointInterface withService:properties:](AFKEndpointInterface, "withService:properties:", a1, v4));

  v6 = dispatch_semaphore_create(0);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v7 = dispatch_queue_create("afktool", 0);
  v8 = objc_alloc_init((Class)NSMutableData);
  objc_msgSend(v5, "setDispatchQueue:", v7);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100008F24;
  v22[3] = &unk_10000C568;
  v24 = &v25;
  v9 = v6;
  v23 = v9;
  objc_msgSend(v5, "setResponseHandler:", v22);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100008F38;
  v20[3] = &unk_10000C718;
  v10 = v8;
  v21 = v10;
  objc_msgSend(v5, "setReportHandler:", v20);
  objc_msgSend(v5, "activate:", 1);
  v19 = 0;
  LODWORD(v17) = 0;
  v11 = objc_msgSend(v5, "enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:", 211, mach_continuous_time(), 0, 0, 16, &v19, v17);
  *((_DWORD *)v26 + 6) = (_DWORD)v11;
  if ((_DWORD)v11)
  {
    NSLog(CFSTR("ERROR!enqueueCommand:%x"), v11);
  }
  else if (dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL))
  {
    NSLog(CFSTR("ERROR!enqueueCommand: timeout"));
    *((_DWORD *)v26 + 6) = -536870186;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
    v18 = 0;
    v13 = objc_msgSend(v10, "writeToFile:options:error:", v12, 1, &v18);
    v14 = v18;

    if ((v13 & 1) == 0)
    {
      NSLog(CFSTR("ERROR! Saving codecoverage data to file:%@"), v14);
      *((_DWORD *)v26 + 6) = -536870212;
    }

  }
  objc_msgSend(v5, "cancel");
  v15 = *((_DWORD *)v26 + 6) != 0;

  _Block_object_dispose(&v25, 8);
  return v15;
}

void sub_100008E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, ...)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  va_list va;

  va_start(va, a16);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100008F10(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100008F24(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id *sub_100008F38(id *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a3 == 212)
    return (id *)objc_msgSend(result[4], "appendBytes:length:", a5, a6);
  return result;
}

uint64_t start(int a1, uint64_t a2)
{
  int *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t *v8[3];
  void *__p[2];
  char v10;
  void *v11[2];
  uint64_t v12;
  void *v13[2];
  char v14;
  uint64_t *v15[3];

  sub_100006264(v13, "Usage: afktool (--help | -v...)\n  afktool registry (--role=<role> [--name=<name>] | --matching=<matching>) [-x]  [--archive [--format=<fmt>] [--path=<dir>]] [--buffer=<size>]\n\nOptions:\n  -r --role=<role>           IOP  role\n  -a --archive               Archive output\n  -x --hex                   Output numbers as hexidecimal. This option does not apply when creating an archive from ioreg.\n  --buffer=<value>           The size of the command buffer to use. By default this is 64KB.\n  -f --format=<fmt>          Archive or response output format (xml,bin)\n  -p --path=<dir>            Save output to files at this path instead of stdout (1 file per role)\n  -m --matching=<matching>   Service matching dictionary in json or xml format");
  v11[0] = 0;
  v11[1] = 0;
  v12 = 0;
  sub_100009198(v11, (char **)(a2 + 8), (char **)(a2 + 8 * a1), (8 * a1 - 8) >> 3);
  sub_100006264(__p, "AppleFirmwareKit ToolvRC_ProjectBuildVersion Aug  3 2024 07:33:16");
  docopt::docopt(v15, v13, v11, 1, __p, 0);
  if (v10 < 0)
    operator delete(__p[0]);
  __p[0] = v11;
  sub_10000679C((void ***)__p);
  if (v14 < 0)
    operator delete(v13[0]);
  sub_100006264(v13, "registry");
  v11[0] = v13;
  if (*((_DWORD *)sub_10000633C(v15, (const void **)v13, (uint64_t)&unk_10000A114, (_OWORD **)v11) + 14))
  {
    sub_100006264(v11, "registry");
    __p[0] = v11;
    v4 = (int *)sub_10000633C(v15, (const void **)v11, (uint64_t)&unk_10000A114, (_OWORD **)__p);
    sub_10000516C(v4 + 14, 1u);
    v5 = *((_BYTE *)v4 + 64) != 0;
    if (SHIBYTE(v12) < 0)
      operator delete(v11[0]);
  }
  else
  {
    v5 = 0;
  }
  if (v14 < 0)
  {
    operator delete(v13[0]);
    if (v5)
      goto LABEL_11;
LABEL_13:
    v6 = 1;
    goto LABEL_14;
  }
  if (!v5)
    goto LABEL_13;
LABEL_11:
  sub_100006828((uint64_t *)v8, (const void ***)v15);
  v6 = sub_100003184(v8);
  sub_100006F80((uint64_t)v8, v8[1]);
LABEL_14:
  sub_100006F80((uint64_t)v15, v15[1]);
  return v6;
}

void sub_100009104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  sub_100006F80((uint64_t)&a9, a10);
  sub_100006F80(v26 - 48, *(_QWORD **)(v26 - 40));
  _Unwind_Resume(a1);
}

_QWORD *sub_100009198(_QWORD *result, char **a2, char **a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    sub_100006DA4(result, a4);
    result = sub_10000921C((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1000091FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  sub_10000679C(&a9);
  _Unwind_Resume(a1);
}

_QWORD *sub_10000921C(uint64_t a1, char **a2, char **a3, _QWORD *a4)
{
  _QWORD *v4;
  char **v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      sub_100006264(v4, *v6++);
      v4 = v11 + 3;
      v11 += 3;
    }
    while (v6 != a3);
  }
  v9 = 1;
  sub_100006F08((uint64_t)v8);
  return v4;
}

void sub_1000092A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100006F08((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1000092BC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "0x%llx: AFKIOCFUnserializeWithSize failed", (uint8_t *)&v2, 0xCu);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_activate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_enqueueCommand_timestamp_inputBuffer_inputBufferSize_outputPayloadSize_context_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_initToFileAtPath_append_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initToFileAtPath:append:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_range(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "range");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_scanHexLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanHexLongLong:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setReportHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReportHandler:");
}

id objc_msgSend_setResponseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponseHandler:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_withService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withService:");
}

id objc_msgSend_withService_properties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withService:properties:");
}

id objc_msgSend_writePropertyList_toStream_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePropertyList:toStream:format:options:error:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}

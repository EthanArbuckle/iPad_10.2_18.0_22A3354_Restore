@implementation DarwinDeviceInfo

- (id)osVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)MGCopyAnswer(CFSTR("BuildVersion"), 0);
  v3 = v2;
  if (!v2)
    v2 = CFSTR("UnknownVersion");
  v4 = v2;

  return v4;
}

- (id)machine
{
  int *v2;
  char *v3;
  size_t v4;
  size_t v5;
  void **p_dst;
  size_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  int *v12;
  char *v13;
  size_t v14;
  size_t v15;
  void **v16;
  size_t v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSString *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void *v27[2];
  char v28;
  void **__dst;
  size_t v30;
  unint64_t v31;
  void *__p;
  char *v33;
  char *v34;
  size_t v35;

  v28 = 10;
  strcpy((char *)v27, "hw.machine");
  v35 = 0;
  if (sysctlbyname((const char *)v27, 0, &v35, 0, 0))
  {
    v2 = __error();
    v3 = strerror(*v2);
    v4 = strlen(v3);
    if (v4 > 0x7FFFFFFFFFFFFFF7)
      sub_1000CDE30();
    v5 = v4;
    if (v4 >= 0x17)
    {
      v9 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v4 | 7) != 0x17)
        v9 = v4 | 7;
      v10 = v9 + 1;
      p_dst = (void **)operator new(v9 + 1);
      v30 = v5;
      v31 = v10 | 0x8000000000000000;
      __dst = p_dst;
    }
    else
    {
      HIBYTE(v31) = v4;
      p_dst = (void **)&__dst;
      if (!v4)
        goto LABEL_13;
    }
    memmove(p_dst, v3, v5);
LABEL_13:
    *((_BYTE *)p_dst + v5) = 0;
    goto LABEL_33;
  }
  __p = 0;
  v33 = 0;
  v34 = 0;
  v7 = v35;
  if (v35)
  {
    if ((v35 & 0x8000000000000000) != 0)
      sub_1000D02C0();
    v8 = (char *)operator new(v35);
    bzero(v8, v7);
    __p = v8;
    v33 = &v8[v7];
    v34 = &v8[v7];
  }
  else
  {
    v8 = 0;
  }
  if (v28 >= 0)
    v11 = (const char *)v27;
  else
    v11 = (const char *)v27[0];
  if (sysctlbyname(v11, v8, &v35, 0, 0))
  {
    v12 = __error();
    v13 = strerror(*v12);
    v14 = strlen(v13);
    if (v14 <= 0x7FFFFFFFFFFFFFF7)
    {
      v15 = v14;
      if (v14 >= 0x17)
      {
        v19 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v14 | 7) != 0x17)
          v19 = v14 | 7;
        v20 = v19 + 1;
        v16 = (void **)operator new(v19 + 1);
        v30 = v15;
        v31 = v20 | 0x8000000000000000;
        __dst = v16;
      }
      else
      {
        HIBYTE(v31) = v14;
        v16 = (void **)&__dst;
        if (!v14)
        {
LABEL_31:
          *((_BYTE *)v16 + v15) = 0;
          v21 = __p;
          if (!__p)
            goto LABEL_33;
          goto LABEL_32;
        }
      }
      memmove(v16, v13, v15);
      goto LABEL_31;
    }
LABEL_45:
    sub_1000CDE30();
  }
  v17 = v35 - 1;
  if (v35 - 1 > 0x7FFFFFFFFFFFFFF7)
    goto LABEL_45;
  if (v17 >= 0x17)
  {
    v25 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v25 = v17 | 7;
    v26 = v25 + 1;
    v18 = (void **)operator new(v25 + 1);
    v30 = v17;
    v31 = v26 | 0x8000000000000000;
    __dst = v18;
    goto LABEL_41;
  }
  HIBYTE(v31) = v35 - 1;
  v18 = (void **)&__dst;
  if (v35 != 1)
LABEL_41:
    memcpy(v18, v8, v17);
  *((_BYTE *)v18 + v17) = 0;
  v21 = __p;
  if (__p)
LABEL_32:
    operator delete(v21);
LABEL_33:
  v22 = sub_1000CC1E4((uint64_t *)&__dst);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  if (SHIBYTE(v31) < 0)
  {
    operator delete(__dst);
    if ((v28 & 0x80000000) == 0)
      return v23;
  }
  else if ((v28 & 0x80000000) == 0)
  {
    return v23;
  }
  operator delete(v27[0]);
  return v23;
}

- (id)hwModel
{
  void *v2;

  v2 = (void *)MGCopyAnswer(CFSTR("HWModelStr"), 0);
  CFRelease(v2);
  return v2;
}

+ (id)currentDevice
{
  return objc_alloc_init(DarwinDeviceInfo);
}

- (id)manufacturer
{
  return CFSTR("Apple");
}

- (id)family
{
  void *v2;
  void *v3;
  unsigned int v4;
  BOOL v5;
  id v6;
  id v7;

  v2 = (void *)MGCopyAnswer(CFSTR("DeviceClassNumber"), 0);
  v3 = v2;
  if (!v2
    || ((v4 = objc_msgSend(v2, "intValue"), v4 <= 6) ? (v5 = ((1 << v4) & 0x4E) == 0) : (v5 = 1), v5))
  {
    v7 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 0xFFFFFFFFLL);

    return v7;
  }
  else
  {
    v6 = v3;

    return v6;
  }
}

- (vector<int,)splitSystemVersion
{
  id v4;
  const char *v5;
  size_t v6;
  size_t v7;
  vector<int, std::allocator<int>> **p_dst;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  vector<int, std::allocator<int>> *v12;
  vector<int, std::allocator<int>> *result;
  vector<int, std::allocator<int>> *v14;
  vector<int, std::allocator<int>> *v15;
  unint64_t v16;
  _OWORD *p_p;
  _BYTE *v18;
  vector<int, std::allocator<int>> *v19;
  __compressed_pair<int *, std::allocator<int>> *p_var2;
  _OWORD *v21;
  unint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  char var0;
  size_t v27;
  vector<int, std::allocator<int>> **v28;
  int64_t v29;
  char *v30;
  int v31;
  char *v32;
  char *v33;
  char v34;
  int v35;
  char v36;
  char v37;
  int *v38;
  int *var1;
  int *v40;
  int *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _BYTE *v47;
  int *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int *v52;
  _OWORD *v53;
  int *v54;
  uint64_t v55;
  __int128 v56;
  int v57;
  void *__p;
  int64_t v59;
  int64_t v60;
  vector<int, std::allocator<int>> *__dst;
  size_t v62;
  int64_t v63;
  std::bad_cast v64;
  int *v65;
  void *v66;
  unsigned __int8 *v67;
  int v68;

  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DarwinDeviceInfo systemVersion](self, "systemVersion")));
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = strlen(v5);
  if (v6 > 0x7FFFFFFFFFFFFFF7)
    sub_1000CDE30();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    p_dst = (vector<int, std::allocator<int>> **)operator new(v9 + 1);
    v62 = v7;
    v63 = v10 | 0x8000000000000000;
    __dst = (vector<int, std::allocator<int>> *)p_dst;
    goto LABEL_8;
  }
  HIBYTE(v63) = v6;
  p_dst = &__dst;
  if (v6)
LABEL_8:
    memmove(p_dst, v5, v7);
  *((_BYTE *)p_dst + v7) = 0;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v11 = HIBYTE(v63);
  if (v63 >= 0)
    v12 = (vector<int, std::allocator<int>> *)&__dst;
  else
    v12 = __dst;
  while ((v11 & 0x80) == 0)
  {
    result = (vector<int, std::allocator<int>> *)&__dst;
    if (v12 == (vector<int, std::allocator<int>> *)((char *)&__dst + v11))
      return result;
LABEL_17:
    v14 = (vector<int, std::allocator<int>> *)((char *)result + v11);
    v15 = v12;
    if (v12 != v14)
    {
      v15 = v12;
      while ((SLOBYTE(v15->var0) & 0x80000000) == 0 && (_DefaultRuneLocale.__runetype[LOBYTE(v15->var0)] & 0x400) != 0)
      {
        v15 = (vector<int, std::allocator<int>> *)((char *)v15 + 1);
        if (v15 == v14)
        {
          v15 = v14;
          break;
        }
      }
    }
    v16 = (char *)v15 - (char *)v12;
    if ((unint64_t)((char *)v15 - (char *)v12) > 0x7FFFFFFFFFFFFFF7)
      sub_1000CDE30();
    if (v16 > 0x16)
    {
      v24 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v16 | 7) != 0x17)
        v24 = v16 | 7;
      v25 = v24 + 1;
      p_p = operator new(v24 + 1);
      v59 = (char *)v15 - (char *)v12;
      v60 = v25 | 0x8000000000000000;
      __p = p_p;
      if (v12 == v15)
      {
LABEL_35:
        v18 = p_p;
        goto LABEL_38;
      }
    }
    else
    {
      HIBYTE(v60) = (_BYTE)v15 - (_BYTE)v12;
      p_p = &__p;
      if (v12 == v15)
        goto LABEL_35;
    }
    if (v16 < 0x20 || (unint64_t)((char *)p_p - (char *)v12) < 0x20)
    {
      v18 = p_p;
      v19 = v12;
      do
      {
LABEL_37:
        var0 = (char)v19->var0;
        v19 = (vector<int, std::allocator<int>> *)((char *)v19 + 1);
        *v18++ = var0;
      }
      while (v19 != v15);
      goto LABEL_38;
    }
    v18 = (char *)p_p + (v16 & 0xFFFFFFFFFFFFFFE0);
    v19 = (vector<int, std::allocator<int>> *)((char *)v12 + (v16 & 0xFFFFFFFFFFFFFFE0));
    p_var2 = &v12->var2;
    v21 = p_p + 1;
    v22 = v16 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v23 = *(_OWORD *)&p_var2->var0;
      *(v21 - 1) = *(_OWORD *)&p_var2[-2].var0;
      *v21 = v23;
      p_var2 += 4;
      v21 += 2;
      v22 -= 32;
    }
    while (v22);
    if (v16 != (v16 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_37;
LABEL_38:
    *v18 = 0;
    v27 = HIBYTE(v63);
    v28 = &__dst;
    if (v63 < 0)
    {
      v28 = (vector<int, std::allocator<int>> **)__dst;
      v27 = v62;
    }
    v12 = (vector<int, std::allocator<int>> *)((char *)v28 + v27);
    if (v15 != (vector<int, std::allocator<int>> *)((char *)v28 + v27))
    {
      while (SLOBYTE(v15->var0) < 0 || (_DefaultRuneLocale.__runetype[LOBYTE(v15->var0)] & 0x400) == 0)
      {
        v15 = (vector<int, std::allocator<int>> *)((char *)v15 + 1);
        if (v15 == v12)
          goto LABEL_46;
      }
    }
    v12 = v15;
LABEL_46:
    v29 = v59;
    v30 = (char *)&__p;
    if (v60 >= 0)
      v29 = HIBYTE(v60);
    else
      v30 = (char *)__p;
    if (!v29)
    {
LABEL_89:
      std::bad_cast::bad_cast(&v64);
      v64.__vftable = (std::bad_cast_vtbl *)&off_1003EFFF0;
      sub_1000F9804((uint64_t)&v64);
    }
    v68 = 0;
    v31 = *v30;
    if (v31 == 45 || (v32 = v30, v31 == 43))
    {
      v33 = (char *)&__p;
      if (v60 < 0)
        v33 = (char *)__p;
      v32 = v33 + 1;
    }
    LOBYTE(v64.__vftable) = 0;
    HIDWORD(v64.__vftable) = 1;
    v65 = &v68;
    v66 = v32;
    v67 = (unsigned __int8 *)&v30[v29];
    v34 = sub_10016A844((uint64_t)&v64);
    v35 = v68;
    if (v31 == 45)
    {
      if (v68 < 0x80000001)
        v36 = v34;
      else
        v36 = 0;
      if ((v36 & 1) == 0)
        goto LABEL_89;
      v35 = -v68;
    }
    else
    {
      if (v68 >= 0)
        v37 = v34;
      else
        v37 = 0;
      if ((v37 & 1) == 0)
        goto LABEL_89;
    }
    var1 = retstr->var1;
    v38 = retstr->var2.var0;
    if (var1 < v38)
    {
      *var1 = v35;
      v40 = var1 + 1;
      goto LABEL_86;
    }
    v41 = retstr->var0;
    v42 = (char *)var1 - (char *)retstr->var0;
    v43 = v42 >> 2;
    v44 = (v42 >> 2) + 1;
    if (v44 >> 62)
      sub_1000D02C0();
    v45 = (char *)v38 - (char *)v41;
    if (v45 >> 1 > v44)
      v44 = v45 >> 1;
    if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFFCLL)
      v46 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v46 = v44;
    if (v46)
    {
      if (v46 >> 62)
        sub_1000CDEB8();
      v47 = operator new(4 * v46);
      v48 = (int *)&v47[4 * v43];
      *v48 = v35;
      v40 = v48 + 1;
      if (var1 == v41)
        goto LABEL_84;
LABEL_78:
      v49 = (char *)(var1 - 1) - (char *)v41;
      if (v49 < 0x2C)
        goto LABEL_96;
      if ((unint64_t)((char *)var1 - &v47[v42]) < 0x20)
        goto LABEL_96;
      v50 = (v49 >> 2) + 1;
      v51 = 4 * (v50 & 0x7FFFFFFFFFFFFFF8);
      v52 = &var1[v51 / 0xFFFFFFFFFFFFFFFCLL];
      v48 = (int *)((char *)v48 - v51);
      v53 = &v47[4 * v43 - 16];
      v54 = var1 - 4;
      v55 = v50 & 0x7FFFFFFFFFFFFFF8;
      do
      {
        v56 = *(_OWORD *)v54;
        *(v53 - 1) = *((_OWORD *)v54 - 1);
        *v53 = v56;
        v53 -= 2;
        v54 -= 8;
        v55 -= 8;
      }
      while (v55);
      var1 = v52;
      if (v50 != (v50 & 0x7FFFFFFFFFFFFFF8))
      {
LABEL_96:
        do
        {
          v57 = *--var1;
          *--v48 = v57;
        }
        while (var1 != v41);
      }
      goto LABEL_84;
    }
    v47 = 0;
    v48 = (int *)(4 * v43);
    *(_DWORD *)(4 * v43) = v35;
    v40 = (int *)(4 * v43 + 4);
    if (var1 != v41)
      goto LABEL_78;
LABEL_84:
    retstr->var0 = v48;
    retstr->var1 = v40;
    retstr->var2.var0 = (int *)&v47[4 * v46];
    if (v41)
      operator delete(v41);
LABEL_86:
    retstr->var1 = v40;
    if (SHIBYTE(v60) < 0)
      operator delete(__p);
    v11 = HIBYTE(v63);
  }
  result = __dst;
  v11 = v62;
  if (v12 != (vector<int, std::allocator<int>> *)((char *)__dst + v62))
    goto LABEL_17;
  operator delete(__dst);
  return result;
}

- (Info)ws_info
{
  void *v1;
  void *v2;
  const char *v4;
  size_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  size_t v13;
  char *v14;
  int64_t p_var0;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  char *v20;
  size_t v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  Info *result;
  id v26;

  v2 = v1;
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "manufacturer")));
  v4 = (const char *)objc_msgSend(v26, "UTF8String");
  v5 = strlen(v4);
  if (v5 > 0x7FFFFFFFFFFFFFF7)
    sub_1000CDE30();
  v6 = v5;
  if (v5 >= 0x17)
  {
    v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v8 = v5 | 7;
    v9 = v8 + 1;
    v7 = (char *)operator new(v8 + 1);
    retstr->var0.__r_.__value_.var0.var1.__size_ = v6;
    *((_QWORD *)&retstr->var0.__r_.__value_.var0.var1 + 2) = v9 | 0x8000000000000000;
    retstr->var0.__r_.__value_.var0.var1.__data_ = v7;
    goto LABEL_8;
  }
  *((_BYTE *)&retstr->var0.__r_.__value_.var0.var1 + 23) = v5;
  v7 = (char *)retstr;
  if (v5)
LABEL_8:
    memmove(v7, v4, v6);
  v7[v6] = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "family"));
  retstr->var0.__r_.var0 = objc_msgSend(v10, "integerValue");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "hwModel")));
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  v13 = strlen(v12);
  if (v13 > 0x7FFFFFFFFFFFFFF7)
    sub_1000CDE30();
  v14 = (char *)v13;
  if (v13 >= 0x17)
  {
    v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v16 = v13 | 7;
    v17 = v16 + 1;
    p_var0 = (int64_t)operator new(v16 + 1);
    retstr[1].var0.__r_.__value_.var0.var1.__data_ = v14;
    retstr[1].var0.__r_.__value_.var0.var1.__size_ = v17 | 0x8000000000000000;
    retstr->var0.var0 = p_var0;
    goto LABEL_16;
  }
  retstr[1].var0.__r_.__value_.var0.var0.__data_[15] = v13;
  p_var0 = (int64_t)&retstr->var0.var0;
  if (v13)
LABEL_16:
    memmove((void *)p_var0, v12, (size_t)v14);
  v14[p_var0] = 0;
  v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "osVersion")));
  v19 = (const char *)objc_msgSend(v18, "UTF8String");
  v20 = &retstr[1].var0.__r_.__value_.var0.var0.__data_[16];
  v21 = strlen(v19);
  if (v21 > 0x7FFFFFFFFFFFFFF7)
    sub_1000CDE30();
  v22 = v21;
  if (v21 >= 0x17)
  {
    v23 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17)
      v23 = v21 | 7;
    v24 = v23 + 1;
    v20 = (char *)operator new(v23 + 1);
    *(_QWORD *)&retstr[1].var0.__r_.var0 = v22;
    retstr[1].var0.var0 = v24 | 0x8000000000000000;
    *((_QWORD *)&retstr[1].var0.__r_.__value_.var0.var1 + 2) = v20;
  }
  else
  {
    HIBYTE(retstr[1].var0.var0) = v21;
    if (!v21)
      goto LABEL_25;
  }
  memmove(v20, v19, v22);
LABEL_25:
  v20[v22] = 0;

  return result;
}

- (id)name
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

- (id)systemName
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  v2 = (void *)_CFCopySystemVersionDictionary(self, a2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", _kCFSystemVersionProductNameKey));
  v4 = v3;
  if (!v3)
    v3 = CFSTR("Unknown");
  v5 = v3;

  return v5;
}

- (id)systemVersion
{
  return (id)MGCopyAnswer(CFSTR("ProductVersion"), 0);
}

@end

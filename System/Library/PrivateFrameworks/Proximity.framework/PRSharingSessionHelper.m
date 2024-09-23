@implementation PRSharingSessionHelper

+ (id)NSDataMacToUUID:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PRSharingSessionHelper.mm"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mac"));

  }
  v9[0] = 0;
  v9[1] = 0;
  objc_msgSend(v5, "getBytes:length:", v9, objc_msgSend(v5, "length"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v9);

  return v6;
}

+ (id)UUIDToNSDataMac:(id)a3 len:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PRSharingSessionHelper.mm"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid"));

  }
  if (a4 <= 8)
  {
    v11[0] = 0;
    v11[1] = 0;
    objc_msgSend(v7, "getUUIDBytes:", v11);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v11, a4);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)UUIDStringToNSDataMac:(const void *)a3 len:(unint64_t)a4
{
  const void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if ((*((char *)a3 + 23) & 0x80000000) == 0)
  {
    v6 = 0;
    if (!a4 || !*((_BYTE *)a3 + 23))
      return v6;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v5, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
    +[PRSharingSessionHelper UUIDToNSDataMac:len:](PRSharingSessionHelper, "UUIDToNSDataMac:len:", v8, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  v6 = 0;
  if (a4 && *((_QWORD *)a3 + 1))
  {
    v5 = *(const void **)a3;
    goto LABEL_8;
  }
  return v6;
}

+ (id)HexStringToNSDataMac:(const void *)a3
{
  BOOL v4;
  char *v5;
  BOOL v6;
  unint64_t v8;
  id v9;
  unint64_t v10;
  std::string __p;
  unint64_t v12;

  if (*((char *)a3 + 23) < 0)
  {
    if (*((_QWORD *)a3 + 1))
      v6 = (*((_QWORD *)a3 + 1) & 1) == 0;
    else
      v6 = 0;
    if (!v6)
      return 0;
    v5 = *(char **)a3;
  }
  else
  {
    if (*((_BYTE *)a3 + 23))
      v4 = (*((_BYTE *)a3 + 23) & 1) == 0;
    else
      v4 = 0;
    if (!v4)
      return 0;
    v5 = (char *)a3;
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, v5);
  v8 = std::stoull(&__p, 0, 16);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v12 = v8;
  v9 = objc_alloc(MEMORY[0x1E0C99D50]);
  v10 = *((unsigned __int8 *)a3 + 23);
  if ((v10 & 0x80u) != 0)
    v10 = *((_QWORD *)a3 + 1);
  return (id)objc_msgSend(v9, "initWithBytes:length:", &v12, v10 >> 1);
}

+ (basic_string<char,)UIntToHexString:(std::allocator<char>> *__return_ptr)retstr len:
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t var1;
  uint64_t v8;
  std::string v10;
  _QWORD v11[2];
  _QWORD v12[11];
  char v13;
  uint64_t v14;
  char v15;

  v2 = v1;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v11);
  *(_DWORD *)((char *)&v12[1] + *(_QWORD *)(v12[0] - 24)) |= 0x4000u;
  v10.__r_.__value_.__s.__data_[0] = 48;
  v4 = std::operator<<[abi:ne180100]<std::char_traits<char>>(v12, (char *)&v10);
  v5 = *v4;
  *(uint64_t *)((char *)v4 + *(_QWORD *)(*v4 - 24) + 24) = 2 * (int)v2;
  *(_DWORD *)((char *)v4 + *(_QWORD *)(v5 - 24) + 8) = *(_DWORD *)((_BYTE *)v4 + *(_QWORD *)(v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  std::ostream::operator<<();
  std::stringbuf::str();
  v6 = 2 * v2;
  if (*((char *)&retstr->var0.var0.var0.var1 + 23) < 0)
  {
    var1 = retstr->var0.var0.var0.var1.var1;
    if (var1 <= v6)
      goto LABEL_8;
  }
  else
  {
    var1 = *((unsigned __int8 *)&retstr->var0.var0.var0.var1 + 23);
    if (v6 >= var1)
      goto LABEL_8;
  }
  std::string::basic_string(&v10, (const std::string *)retstr, var1 - v6, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v15);
  if (*((char *)&retstr->var0.var0.var0.var1 + 23) < 0)
    operator delete(retstr->var0.var0.var0.var1.var0);
  retstr->var0.var0 = (__rep)v10;
LABEL_8:
  v11[0] = *MEMORY[0x1E0DE4F50];
  v8 = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 72);
  *(_QWORD *)((char *)v11 + *(_QWORD *)(v11[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F50] + 64);
  v12[0] = v8;
  v12[1] = MEMORY[0x1E0DE4FB8] + 16;
  if (v13 < 0)
    operator delete((void *)v12[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return (basic_string<char, std::char_traits<char>, std::allocator<char>> *)MEMORY[0x1A1ACFFCC](&v14);
}

+ (unint64_t)NSDataToUInt64:(id)a3
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v10;
  unint64_t v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PRSharingSessionHelper.mm"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inData"));

  }
  v11 = 0;
  v6 = objc_msgSend(v5, "length");
  if (v6 >= 8)
    v7 = 8;
  else
    v7 = v6;
  objc_msgSend(v5, "getBytes:length:", &v11, v7);
  v8 = v11;

  return v8;
}

+ (id)convertMacStringToNSData:(const void *)a3
{
  uint64_t v3;

  v3 = *((unsigned __int8 *)a3 + 23);
  if ((v3 & 0x80u) != 0)
    v3 = *((_QWORD *)a3 + 1);
  if (v3 == 36)
    +[PRSharingSessionHelper UUIDStringToNSDataMac:len:](PRSharingSessionHelper, "UUIDStringToNSDataMac:len:");
  else
    +[PRSharingSessionHelper HexStringToNSDataMac:](PRSharingSessionHelper, "HexStringToNSDataMac:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)reverseNSData:(id)a3
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  BOOL v10;
  unint64_t v11;
  char v12;
  void *v14;
  void *v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PRSharingSessionHelper.mm"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inData"));

  }
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithData:", v5));
  v7 = objc_msgSend(v6, "mutableBytes");
  v8 = objc_msgSend(v6, "length");
  v9 = (_BYTE *)(v7 + v8 - 1);
  if (v8)
    v10 = (unint64_t)v9 > v7;
  else
    v10 = 0;
  if (v10)
  {
    v11 = v7 + 1;
    do
    {
      v12 = *(_BYTE *)(v11 - 1);
      *(_BYTE *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", v6);

  return v14;
}

+ (int)ProxToCoarseRange:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return dword_19BF79DE8[a3];
}

+ (id)ProxToString:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("immediate");
  else
    return off_1E3D04638[a3];
}

+ (int64_t)CoarseRangeToProx:(int)a3
{
  if (a3 > 3)
    return 4;
  else
    return qword_19BF79E00[a3];
}

@end

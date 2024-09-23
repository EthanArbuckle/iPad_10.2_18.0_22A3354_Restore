@implementation NSData(HexString)

+ (id)NF_dataWithHexString:()HexString
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  _BYTE *v8;
  _BYTE *v9;
  unsigned int v10;
  unsigned __int8 *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unsigned int v15;
  char *v16;
  void *specific;
  void (*v18)(uint64_t, const char *, ...);
  void *v19;
  char *v20;
  void *v21;
  void (*v22)(uint64_t, const char *, ...);
  void *v23;
  NSObject *v24;
  char __str[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = v4;
  if (!v4 || (v4 & 1) != 0)
  {
    v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v18 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v18)
      {
        v18(4, "%s:%i String is of invalid length=%ld", "+[NSData(HexString) NF_dataWithHexString:]", 18, v5);
        v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v19 = dispatch_get_specific(v16);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v7 = (id)_NFSharedLogClient[(_QWORD)v19];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__str = 136446722;
        v27 = "+[NSData(HexString) NF_dataWithHexString:]";
        v28 = 1024;
        v29 = 18;
        v30 = 2048;
        v31 = v5;
        _os_log_impl(&dword_1C34DB000, v7, OS_LOG_TYPE_ERROR, "%{public}s:%i String is of invalid length=%ld", (uint8_t *)__str, 0x1Cu);
      }
      goto LABEL_27;
    }
LABEL_29:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v4 >> 1);
  if (!v6)
  {
    v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v21 < 4)
    {
      v22 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v21);
      if (v22)
      {
        v22(3, "%s:%i Memory allocation request failed.", "+[NSData(HexString) NF_dataWithHexString:]", 25);
        v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v23 = dispatch_get_specific(v20);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v24 = (id)_NFSharedLogClient[(_QWORD)v23];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__str = 136446466;
        v27 = "+[NSData(HexString) NF_dataWithHexString:]";
        v28 = 1024;
        v29 = 25;
        _os_log_impl(&dword_1C34DB000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%i Memory allocation request failed.", (uint8_t *)__str, 0x12u);
      }

      v7 = 0;
LABEL_27:
      v13 = 0;
      goto LABEL_28;
    }
    goto LABEL_29;
  }
  v7 = objc_retainAutorelease(v6);
  v8 = (_BYTE *)-[NSObject mutableBytes](v7, "mutableBytes");
  v9 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  __str[2] = 0;
  v10 = *v9;
  if (*v9)
  {
    v11 = v9 + 2;
    v12 = MEMORY[0x1E0C80978];
    v13 = 0;
    do
    {
      __str[0] = v10;
      v14 = *(v11 - 1);
      __str[1] = *(v11 - 1);
      if ((v10 & 0x80) != 0)
        goto LABEL_27;
      if ((*(_DWORD *)(v12 + 4 * v10 + 60) & 0x10000) == 0 || (char)v14 < 0)
        goto LABEL_28;
      if ((*(_DWORD *)(v12 + 4 * v14 + 60) & 0x10000) == 0)
        goto LABEL_27;
      *v8++ = strtoul(__str, 0, 16);
      v15 = *v11;
      v11 += 2;
      v10 = v15;
    }
    while (v15);
  }
  v13 = -[NSObject copy](v7, "copy");
LABEL_28:

  return v13;
}

- (__CFString)NF_asHexString
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  unsigned __int8 *v6;
  char *v7;
  int v8;
  __CFString *v9;
  char *v10;
  void *specific;
  void (*v12)(uint64_t, const char *, ...);
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  if (!v2)
  {
LABEL_14:
    v9 = &stru_1E7D801F8;
    return v9;
  }
  v3 = v2;
  v4 = (char *)malloc_type_calloc(1uLL, (2 * v2) | 1, 0x100004077774924uLL);
  if (!v4)
  {
    v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v12 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v12)
    {
      v12(3, "%s:%i Memory allocation request failed.", "-[NSData(HexString) NF_asHexString]", 61);
      v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v13 = dispatch_get_specific(v10);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v14 = (id)_NFSharedLogClient[(_QWORD)v13];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "-[NSData(HexString) NF_asHexString]";
      v18 = 1024;
      v19 = 61;
      _os_log_impl(&dword_1C34DB000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Memory allocation request failed.", buf, 0x12u);
    }

    goto LABEL_14;
  }
  v5 = v4;
  v6 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  v7 = v5;
  do
  {
    v8 = *v6++;
    sprintf(v7, "%02X", v8);
    v7 += 2;
    --v3;
  }
  while (v3);
  v9 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v5);
  free(v5);
  return v9;
}

@end

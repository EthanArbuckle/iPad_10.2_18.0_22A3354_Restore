@implementation TRIMisc

+ (unint64_t)unsafeFirstAuthenticationState
{
  int v2;

  v2 = MKBDeviceUnlockedSinceBoot();
  if (v2 == 1)
    return 1;
  else
    return 2 * (v2 != 0);
}

+ (BOOL)convertFromString:(id)a3 usingBase:(int)a4 toU64:(unint64_t *)a5
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  const char *v14;
  size_t v15;
  unint64_t v16;
  BOOL v17;
  _BOOL4 v18;
  void *v20;
  char *__endptr;

  v9 = a3;
  v10 = (void *)MEMORY[0x1A1AC6B8C]();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIMisc.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  objc_msgSend(v9, "triTrim");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  if (v13)
  {
    v14 = v13;
    v15 = strlen(v13);
    *__error() = 0;
    __endptr = 0;
    v16 = strtoull(v14, &__endptr, a4);
    if (*__error())
      v17 = 0;
    else
      v17 = __endptr == &v14[v15];
    v18 = v17;
    if (a5 && v18)
      *a5 = v16;
  }
  else
  {
    LOBYTE(v18) = 0;
  }
  objc_autoreleasePoolPop(v10);

  return v18;
}

+ (BOOL)convertFromString:(id)a3 usingBase:(int)a4 toI64:(int64_t *)a5
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  const char *v14;
  size_t v15;
  int64_t v16;
  BOOL v17;
  _BOOL4 v18;
  void *v20;
  char *__endptr;

  v9 = a3;
  v10 = (void *)MEMORY[0x1A1AC6B8C]();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIMisc.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  objc_msgSend(v9, "triTrim");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  if (v13)
  {
    v14 = v13;
    v15 = strlen(v13);
    *__error() = 0;
    __endptr = 0;
    v16 = strtoll(v14, &__endptr, a4);
    if (*__error())
      v17 = 0;
    else
      v17 = __endptr == &v14[v15];
    v18 = v17;
    if (a5 && v18)
      *a5 = v16;
  }
  else
  {
    LOBYTE(v18) = 0;
  }
  objc_autoreleasePoolPop(v10);

  return v18;
}

+ (unint64_t)roundToOneSignificantDigitWithU64:(unint64_t)a3
{
  unint64_t result;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = a3;
  if (a3 >= 0xA)
  {
    if (a3 < 0x64)
    {
      v6 = 10;
    }
    else
    {
      v4 = 1;
      do
      {
        v5 = v4;
        v4 *= 10;
      }
      while (a3 / v4 > 0x63);
      v6 = 100 * v5;
      LOBYTE(result) = a3 / v4;
    }
    if (result % 0xAu <= 4)
      v7 = result / 0xAu;
    else
      v7 = result / 0xAu + 1;
    return v7 * v6;
  }
  return result;
}

+ (id)bestEffortSymbolicateAddress:(void *)a3
{
  void *v3;
  char **v4;
  char **v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v12;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p"), a3, a3);
  v4 = backtrace_symbols(&v12, 1);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", *v4);
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v3;
    v9 = v8;

    free(v5);
    v3 = v9;
  }
  v10 = v3;

  return v10;
}

@end

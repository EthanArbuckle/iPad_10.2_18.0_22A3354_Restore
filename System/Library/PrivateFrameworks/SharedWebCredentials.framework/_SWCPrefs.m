@implementation _SWCPrefs

+ (_SWCPrefs)sharedPrefs
{
  if (qword_1ED1B61E8 != -1)
    dispatch_once(&qword_1ED1B61E8, &__block_literal_global_2);
  return (_SWCPrefs *)(id)qword_1ED1B61E0;
}

- (id)containerURLReturningError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  if (qword_1ED1B6318 && -[_SWCPrefs isAppleInternal](self, "isAppleInternal"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "temporaryDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ED1B6318, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v6, 1);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  }
  else
  {
    if (qword_1ED1B6200 != -1)
      dispatch_once(&qword_1ED1B6200, &__block_literal_global_2);
    v9 = (void *)qword_1ED1B61F0;
    if (a3 && !qword_1ED1B61F0)
    {
      *a3 = objc_retainAutorelease((id)qword_1ED1B61F8);
      v9 = (void *)qword_1ED1B61F0;
    }
    v7 = v9;
  }
  return v7;
}

- (unint64_t)maximumRetryCount
{
  return -[_SWCPrefs _unsignedIntegerForKey:defaultValue:](self, "_unsignedIntegerForKey:defaultValue:", CFSTR("retryMaxCount"), 8);
}

- (double)retryIntervalAfterReachLimitWithFailure:(unint64_t)a3
{
  double v4;
  double v5;

  v4 = fmax(exp2((double)(a3 - -[_SWCPrefs maximumRetryCount](self, "maximumRetryCount") + 1)), 1.0);
  -[_SWCPrefs retryIntervalAfterFailure](self, "retryIntervalAfterFailure");
  return v5 * v4;
}

- (double)retryIntervalAfterFailure
{
  if (qword_1ED1B6210 != -1)
    dispatch_once(&qword_1ED1B6210, &__block_literal_global_17);
  return (double)-[_SWCPrefs _unsignedIntegerForKey:defaultValue:minimumValue:maximumValue:](self, "_unsignedIntegerForKey:defaultValue:minimumValue:maximumValue:", CFSTR("recheckFailureDelaySecs"), qword_1ED1B6208, 10800, 14400);
}

- (double)retryIntervalAfterSuccess
{
  if (qword_1ED1B6220 != -1)
    dispatch_once(&qword_1ED1B6220, &__block_literal_global_20);
  return (double)-[_SWCPrefs _unsignedIntegerForKey:defaultValue:minimumValue:maximumValue:](self, "_unsignedIntegerForKey:defaultValue:minimumValue:maximumValue:", CFSTR("recheckSuccessDelaySecs"), qword_1ED1B6218, 428400, 432000);
}

- (double)retryIntervalAfterSuccess:(BOOL)a3
{
  double result;

  if (a3)
    -[_SWCPrefs retryIntervalAfterSuccess](self, "retryIntervalAfterSuccess");
  else
    -[_SWCPrefs retryIntervalAfterFailure](self, "retryIntervalAfterFailure");
  return result;
}

- (BOOL)verifyExtendedValidation
{
  return -[_SWCPrefs _BOOLForKey:defaultValue:](self, "_BOOLForKey:defaultValue:", CFSTR("extendedValidation"), 0);
}

- (BOOL)isAppleInternal
{
  if (qword_1ED1B6228 != -1)
    dispatch_once(&qword_1ED1B6228, &__block_literal_global_25);
  return _MergedGlobals_2;
}

- (id)descriptionOfAllPrefs
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  const __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *context;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1A85D4B3C](self, a2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(&unk_1E5480F90, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(&unk_1E5480F90);
        v7 = *(const __CFString **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v8 = (const __CFString *)CFPreferencesCopyAppValue(v7, CFSTR("com.apple.SharedWebCredentials"));
        v9 = (__CFString *)v8;
        if (v8)
          v10 = v8;
        else
          v10 = CFSTR("<not set>");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v7);

      }
      v4 = objc_msgSend(&unk_1E5480F90, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SWCPrefs isAppleInternal](self, "isAppleInternal"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("appleInternal"));

  v12 = (void *)objc_msgSend(v3, "copy");
  objc_autoreleasePoolPop(context);
  return v12;
}

- (BOOL)isFastCheckEnabled
{
  return !-[_SWCPrefs _BOOLForKey:defaultValue:](self, "_BOOLForKey:defaultValue:", CFSTR("disableFastCheck"), 0);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SWCPrefs;
  return -[_SWCPrefs init](&v3, sel_init);
}

- (unint64_t)_recheckFuzzForSuccess:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (qword_1ED1B6230 != -1)
    dispatch_once(&qword_1ED1B6230, &__block_literal_global_65);
  return *(_QWORD *)&_MergedGlobals_2[8 * v3 + 112];
}

- (BOOL)_BOOLForKey:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;

  v5 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.SharedWebCredentials"));
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (unint64_t)_unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4
{
  return -[_SWCPrefs _unsignedIntegerForKey:defaultValue:minimumValue:maximumValue:](self, "_unsignedIntegerForKey:defaultValue:minimumValue:maximumValue:", a3, a4, 0, -1);
}

- (unint64_t)_unsignedIntegerForKey:(id)a3 defaultValue:(unint64_t)a4 minimumValue:(unint64_t)a5 maximumValue:(unint64_t)a6
{
  CFPropertyListRef v9;
  void *v10;
  unint64_t v11;
  uint64_t v13;
  void *v14;
  int v15;
  unint64_t v16;

  v9 = CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.SharedWebCredentials"));
  if (v9)
  {
    v10 = (void *)v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      a4 = objc_msgSend(v10, "unsignedIntegerValue");
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13 = objc_msgSend(v10, "integerValue");
      a4 = v13 & ~(v13 >> 63);
    }
    v14 = (void *)CFPreferencesCopyAppValue(CFSTR("skipClampingRetryDelaySecs"), CFSTR("com.apple.SharedWebCredentials"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = objc_msgSend(v14, "BOOLValue");
    else
      v15 = 0;

    if (a4 >= a6)
      v16 = a6;
    else
      v16 = a4;
    if (v16 <= a5)
      v16 = a5;
    if (v15)
      return a4;
    else
      return v16;
  }
  else
  {
    if (a4 >= a6)
      v11 = a6;
    else
      v11 = a4;
    if (v11 <= a5)
      return a5;
    else
      return v11;
  }
}

- (id)_stringForKey:(id)a3 defaultValue:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, CFSTR("com.apple.SharedWebCredentials"));
  v7 = v5;
  if (v6)
  {
    if (_NSIsNSString())
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v6, "description");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v8;

  }
  return v7;
}

- (void)_setString:(id)a3 forKey:(id)a4
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, CFSTR("com.apple.SharedWebCredentials"));
}

@end

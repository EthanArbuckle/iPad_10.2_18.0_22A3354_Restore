@implementation _TSF_TSDgPTPClock

+ (id)availablegPTPClockIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D39F08];
  objc_msgSend(MEMORY[0x1E0D39F08], "serviceMatching:", CFSTR("IOTimeSyncDomain"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchingServices:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50___TSF_TSDgPTPClock_availablegPTPClockIdentifiers__block_invoke;
  v8[3] = &unk_1E694B188;
  v6 = v2;
  v9 = v6;
  objc_msgSend(v5, "enumerateWithBlock:", v8);

  return v6;
}

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("IOProviderClass");
  v9[1] = CFSTR("IOPropertyMatch");
  v10[0] = CFSTR("IOTimeSyncDomain");
  v7 = CFSTR("ClockIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_TSF_TSDgPTPClock)initWithClockIdentifier:(unint64_t)a3 pid:(int)a4
{
  uint64_t v4;
  NSPointerArray *v7;
  NSPointerArray *implClocks;
  _TSF_TSDgPTPClock *v9;
  _TSF_TSDgPTPClock *v10;
  uint64_t v11;
  NSArray *gptpPath;
  objc_super v14;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v7 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
  implClocks = self->_implClocks;
  self->_implClocks = v7;

  self->_implClocksLock._os_unfair_lock_opaque = 0;
  v14.receiver = self;
  v14.super_class = (Class)_TSF_TSDgPTPClock;
  v9 = -[_TSF_TSDKernelClock initWithClockIdentifier:pid:](&v14, sel_initWithClockIdentifier_pid_, a3, v4);
  v10 = v9;
  if (v9)
  {
    -[_TSF_TSDgPTPClock _gptpPath](v9, "_gptpPath");
    v11 = objc_claimAutoreleasedReturnValue();
    gptpPath = v10->_gptpPath;
    v10->_gptpPath = (NSArray *)v11;

    v10->_grandmasterIdentity = -[_TSF_TSDgPTPClock _grandmasterIdentity](v10, "_grandmasterIdentity");
  }
  return v10;
}

- (unint64_t)convertFrom32BitASToMachAbsoluteTime:(unsigned int)a3
{
  void *v3;
  int v4;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  unint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = 1;
  v19 = -1;
  v20[0] = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 32, v20, 1, &v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v17 = 1024;
    v18 = 136;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19;
  else
    return -1;
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toMachAbsoluteTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  void *v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  char v23;
  unsigned int v25;
  char v26;
  int v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  _QWORD v40[12];
  uint64_t v41;

  v5 = *(_QWORD *)&a5;
  v41 = *MEMORY[0x1E0C80C00];
  if (a5 < 0xC)
  {
    v19 = 0;
    v20 = 1;
    if (!a5)
      return v20;
    goto LABEL_13;
  }
  v9 = 0;
  v25 = 12 * ((a5 - 12) / 0xC);
  v26 = 1;
  v10 = a3;
  do
  {
    v11 = 0;
    v27 = 12;
    v12 = v10;
    do
    {
      v13 = *(_OWORD *)v12;
      v12 += 4;
      *(_QWORD *)&v14 = v13;
      *((_QWORD *)&v14 + 1) = DWORD1(v13);
      v15 = v14;
      *(_QWORD *)&v14 = DWORD2(v13);
      *((_QWORD *)&v14 + 1) = HIDWORD(v13);
      v16 = &v40[v11];
      *v16 = v15;
      v16[1] = v14;
      v11 += 4;
    }
    while (v11 != 12);
    -[_TSF_TSDKernelClock connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 33, v40, 12, &a4[v9], &v27, 0);

    if ((v18 & 1) == 0)
    {
      v26 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        v30 = 2048;
        v31 = 0;
        v32 = 2048;
        v33 = 0;
        v34 = 2080;
        v35 = "";
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
        v38 = 1024;
        v39 = 164;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        v26 = 0;
      }
    }
    v5 = (v5 - 12);
    v9 += 12;
    v10 += 12;
  }
  while (v5 > 0xB);
  v20 = v26;
  v19 = v25 + 12;
  if ((_DWORD)v5)
  {
LABEL_13:
    v21 = 0;
    v27 = v5;
    do
    {
      v40[v21] = a3[v19 + v21];
      ++v21;
    }
    while (v5 != v21);
    -[_TSF_TSDKernelClock connection](self, "connection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 33, v40, v5, &a4[v19], &v27, 0);

    if ((v23 & 1) == 0)
    {
      v20 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        v30 = 2048;
        v31 = 0;
        v32 = 2048;
        v33 = 0;
        v34 = 2080;
        v35 = "";
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
        v38 = 1024;
        v39 = 184;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v20;
}

- (id)gPTPTimeFromMachAbsoluteTime:(unint64_t)a3
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  TSgPTPTime *v8;
  uint64_t v10;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v24 = -1;
  v25 = -1;
  v27 = 0;
  v28 = 0;
  v26 = -1;
  v11 = 5;
  v29[0] = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 37, v29, 1, &v24, &v11, 0);

  if ((v4 & 1) != 0)
  {
    v5 = v28 & 1;
    v6 = (v28 >> 1) & 1;
    v7 = (v28 >> 2) & 1;
    v8 = [TSgPTPTime alloc];
    LOBYTE(v10) = v7;
    return -[TSgPTPTime initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:](v8, "initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:", v24, v25, v26, (unsigned __int16)v27, v5, v6, v10);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v13 = "callResult == YES";
      v14 = 2048;
      v15 = 0;
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      v22 = 1024;
      v23 = 205;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    return 0;
  }
}

- (unint64_t)machAbsoluteFromgPTPTime:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  int v7;
  int v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  unint64_t v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22 = -1;
  v9 = 1;
  v4 = a3;
  v23[0] = objc_msgSend(v4, "seconds");
  v5 = objc_msgSend(v4, "nanoseconds");

  v23[1] = v5;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 36, v23, 2, &v22, &v9, 0);

  if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v11 = "callResult == YES";
    v12 = 2048;
    v13 = 0;
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v20 = 1024;
    v21 = 234;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v7)
    return v22;
  else
    return -1;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromMachAbsoluteTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v7;
  void *v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = -1;
  v25 = -1;
  v26 = -1;
  v27 = -1;
  v28 = 0xFFFFLL;
  v12 = 4;
  v29[0] = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 35, v29, 1, &v25, &v12, 0);

  if ((v9 & 1) != 0)
  {
    v10 = v25;
    v7 = v26;
    if (a4)
      *a4 = v27;
    if (a5)
      *a5 = v28;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v14 = "callResult == YES";
      v15 = 2048;
      v16 = 0;
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      v23 = 1024;
      v24 = 254;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v10 = -1;
  }
  v11 = v7;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToMachAbsoluteTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  char v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0xFFFFLL;
  v11 = 3;
  v27 = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 34, &v27, 2, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 285;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromMachAbsoluteToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  char v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0;
  v11 = 3;
  v27[0] = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 38, v27, 1, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 314;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromDomainToMachAbsoluteTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  char v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0xFFFFLL;
  v11 = 3;
  v27[0] = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 39, v27, 1, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 343;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (BOOL)getMachAbsoluteRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 machAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  void *v15;
  char v16;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  int64x2_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = vdupq_n_s64(1uLL);
  v32 = -1;
  v33 = -1;
  v34 = -1;
  v35 = 0xFFFFLL;
  v18 = 6;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 40, 0, 0, &v31, &v18, 0);

  if ((v16 & 1) != 0)
  {
    if (a3)
      *a3 = v31.i64[0];
    if (a4)
      *a4 = v31.u64[1];
    if (a5)
      *a5 = v32;
    if (a6)
      *a6 = v33;
    if (a7)
      *a7 = v34;
    if (a8)
      *a8 = v35;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v20 = "result == YES";
    v21 = 2048;
    v22 = 0;
    v23 = 2048;
    v24 = 0;
    v25 = 2080;
    v26 = "";
    v27 = 2080;
    v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v29 = 1024;
    v30 = 369;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v16;
}

- (unint64_t)convertFrom32BitASToTimeSyncTime:(unsigned int)a3
{
  void *v3;
  int v4;
  int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  unint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = 1;
  v19 = -1;
  v20[0] = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 43, v20, 1, &v19, &v6, 0);

  if ((v4 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v8 = "callResult == YES";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v17 = 1024;
    v18 = 420;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v4)
    return v19;
  else
    return -1;
}

- (BOOL)convertFrom32BitASTime:(unsigned int *)a3 toTimeSyncTime:(unint64_t *)a4 withCount:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  void *v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  char v23;
  unsigned int v25;
  char v26;
  int v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  _QWORD v40[12];
  uint64_t v41;

  v5 = *(_QWORD *)&a5;
  v41 = *MEMORY[0x1E0C80C00];
  if (a5 < 0xC)
  {
    v19 = 0;
    v20 = 1;
    if (!a5)
      return v20;
    goto LABEL_13;
  }
  v9 = 0;
  v25 = 12 * ((a5 - 12) / 0xC);
  v26 = 1;
  v10 = a3;
  do
  {
    v11 = 0;
    v27 = 12;
    v12 = v10;
    do
    {
      v13 = *(_OWORD *)v12;
      v12 += 4;
      *(_QWORD *)&v14 = v13;
      *((_QWORD *)&v14 + 1) = DWORD1(v13);
      v15 = v14;
      *(_QWORD *)&v14 = DWORD2(v13);
      *((_QWORD *)&v14 + 1) = HIDWORD(v13);
      v16 = &v40[v11];
      *v16 = v15;
      v16[1] = v14;
      v11 += 4;
    }
    while (v11 != 12);
    -[_TSF_TSDKernelClock connection](self, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 44, v40, 12, &a4[v9], &v27, 0);

    if ((v18 & 1) == 0)
    {
      v26 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        v30 = 2048;
        v31 = 0;
        v32 = 2048;
        v33 = 0;
        v34 = 2080;
        v35 = "";
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
        v38 = 1024;
        v39 = 448;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        v26 = 0;
      }
    }
    v5 = (v5 - 12);
    v9 += 12;
    v10 += 12;
  }
  while (v5 > 0xB);
  v20 = v26;
  v19 = v25 + 12;
  if ((_DWORD)v5)
  {
LABEL_13:
    v21 = 0;
    v27 = v5;
    do
    {
      v40[v21] = a3[v19 + v21];
      ++v21;
    }
    while (v5 != v21);
    -[_TSF_TSDKernelClock connection](self, "connection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 44, v40, v5, &a4[v19], &v27, 0);

    if ((v23 & 1) == 0)
    {
      v20 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = "callResult == YES";
        v30 = 2048;
        v31 = 0;
        v32 = 2048;
        v33 = 0;
        v34 = 2080;
        v35 = "";
        v36 = 2080;
        v37 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
        v38 = 1024;
        v39 = 468;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
        return 0;
      }
    }
  }
  return v20;
}

- (id)gPTPTimeFromTimeSyncTime:(unint64_t)a3
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  TSgPTPTime *v8;
  uint64_t v10;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v24 = -1;
  v25 = -1;
  v27 = 0;
  v28 = 0;
  v26 = -1;
  v11 = 5;
  v29[0] = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 48, v29, 1, &v24, &v11, 0);

  if ((v4 & 1) != 0)
  {
    v5 = v28 & 1;
    v6 = (v28 >> 1) & 1;
    v7 = (v28 >> 2) & 1;
    v8 = [TSgPTPTime alloc];
    LOBYTE(v10) = v7;
    return -[TSgPTPTime initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:](v8, "initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:", v24, v25, v26, (unsigned __int16)v27, v5, v6, v10);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v13 = "callResult == YES";
      v14 = 2048;
      v15 = 0;
      v16 = 2048;
      v17 = 0;
      v18 = 2080;
      v19 = "";
      v20 = 2080;
      v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      v22 = 1024;
      v23 = 489;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    return 0;
  }
}

- (unint64_t)timeSyncTimeFromgPTPTime:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  int v7;
  int v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  unint64_t v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22 = -1;
  v9 = 1;
  v4 = a3;
  v23[0] = objc_msgSend(v4, "seconds");
  v5 = objc_msgSend(v4, "nanoseconds");

  v23[1] = v5;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 47, v23, 2, &v22, &v9, 0);

  if ((v7 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v11 = "callResult == YES";
    v12 = 2048;
    v13 = 0;
    v14 = 2048;
    v15 = 0;
    v16 = 2080;
    v17 = "";
    v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v20 = 1024;
    v21 = 518;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (v7)
    return v22;
  else
    return -1;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)convertFromTimeSyncTimeTo128BitgPTPTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  uint64_t v7;
  void *v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 result;

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = -1;
  v25 = -1;
  v26 = -1;
  v27 = -1;
  v28 = 0xFFFFLL;
  v12 = 4;
  v29[0] = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 46, v29, 1, &v25, &v12, 0);

  if ((v9 & 1) != 0)
  {
    v10 = v25;
    v7 = v26;
    if (a4)
      *a4 = v27;
    if (a5)
      *a5 = v28;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v14 = "callResult == YES";
      v15 = 2048;
      v16 = 0;
      v17 = 2048;
      v18 = 0;
      v19 = 2080;
      v20 = "";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      v23 = 1024;
      v24 = 538;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v10 = -1;
  }
  v11 = v7;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (unint64_t)convertFrom128BitgPTPTimeToTimeSyncTime:(id)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  char v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0xFFFFLL;
  v11 = 3;
  v27 = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 45, &v27, 2, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 569;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromTimeSyncTimeToDomainTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  char v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0;
  v11 = 3;
  v27[0] = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 49, v27, 1, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 598;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (unint64_t)convertFromDomainTimeToTimeSyncTime:(unint64_t)a3 grandmasterUsed:(unint64_t *)a4 portNumber:(unsigned __int16 *)a5
{
  unint64_t v7;
  void *v8;
  char v9;
  int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = -1;
  v24 = -1;
  v25 = -1;
  v26 = 0xFFFFLL;
  v11 = 3;
  v27[0] = a3;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 50, v27, 1, &v24, &v11, 0);

  if ((v9 & 1) != 0)
  {
    v7 = v24;
    if (a4)
      *a4 = v25;
    if (a5)
      *a5 = v26;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v13 = "callResult == YES";
    v14 = 2048;
    v15 = 0;
    v16 = 2048;
    v17 = 0;
    v18 = 2080;
    v19 = "";
    v20 = 2080;
    v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v22 = 1024;
    v23 = 627;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v7;
}

- (BOOL)getTimeSyncTimeRateRatioNumerator:(unint64_t *)a3 denominator:(unint64_t *)a4 timeSyncAnchor:(unint64_t *)a5 andDomainAnchor:(unint64_t *)a6 forGrandmasterIdentity:(unint64_t *)a7 portNumber:(unsigned __int16 *)a8 withError:(id *)a9
{
  void *v15;
  char v16;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  int64x2_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = vdupq_n_s64(1uLL);
  v32 = -1;
  v33 = -1;
  v34 = -1;
  v35 = 0xFFFFLL;
  v18 = 6;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 51, 0, 0, &v31, &v18, 0);

  if ((v16 & 1) != 0)
  {
    if (a3)
      *a3 = v31.i64[0];
    if (a4)
      *a4 = v31.u64[1];
    if (a5)
      *a5 = v32;
    if (a6)
      *a6 = v33;
    if (a7)
      *a7 = v34;
    if (a8)
      *a8 = v35;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v20 = "result == YES";
    v21 = 2048;
    v22 = 0;
    v23 = 2048;
    v24 = 0;
    v25 = 2080;
    v26 = "";
    v27 = 2080;
    v28 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v29 = 1024;
    v30 = 653;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v16;
}

- (void)_handleInterestNotification:(unsigned int)a3 withArgument:(void *)a4
{
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  os_unfair_lock_s *p_implClocksLock;
  NSPointerArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  _TSF_TSDgPTPClock *v23;
  _QWORD block[6];
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)_TSF_TSDgPTPClock;
  -[_TSF_TSDKernelClock _handleInterestNotification:withArgument:](&v25, sel__handleInterestNotification_withArgument_, *(_QWORD *)&a3, a4);
  if (a3 == -536870608)
  {
    -[_TSF_TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[_TSF_TSDKernelClock notificationQueue](self, "notificationQueue");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = -[_TSF_TSDgPTPClock _grandmasterIdentity](self, "_grandmasterIdentity");
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62___TSF_TSDgPTPClock__handleInterestNotification_withArgument___block_invoke;
    block[3] = &unk_1E694B1D8;
    block[4] = self;
    block[5] = v7;
    dispatch_async(v6, block);
    -[_TSF_TSDgPTPClock _gptpPath](self, "_gptpPath");
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __62___TSF_TSDgPTPClock__handleInterestNotification_withArgument___block_invoke_2;
    v21[3] = &unk_1E694B118;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v9;
    v23 = self;
    dispatch_async(v6, v21);
    p_implClocksLock = &self->_implClocksLock;
    os_unfair_lock_lock(&self->_implClocksLock);
    -[NSPointerArray compact](self->_implClocks, "compact");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_implClocks;
    v12 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v16, "conformsToProtocol:", &unk_1EF136220, (_QWORD)v17))
            objc_msgSend(v16, "updateGrandmasterIdentity:andgPTPPath:", v7, v9);
        }
        v13 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
      }
      while (v13);
    }

    os_unfair_lock_unlock(p_implClocksLock);
  }
}

- (void)_refreshGrandmasterIdentityOnNotificationQueue
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  os_unfair_lock_s *p_implClocksLock;
  NSPointerArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  id v24;
  unint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = -[_TSF_TSDgPTPClock _grandmasterIdentity](self, "_grandmasterIdentity");
  -[_TSF_TSDgPTPClock _gptpPath](self, "_gptpPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_4;
  v6 = (void *)v5;
  -[_TSF_TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDKernelClock notificationQueue](self, "notificationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
LABEL_4:
    if (v3 != -[_TSF_TSDgPTPClock grandmasterIdentity](self, "grandmasterIdentity"))
      -[_TSF_TSDgPTPClock setGrandmasterIdentity:](self, "setGrandmasterIdentity:", v3);
    -[_TSF_TSDgPTPClock gptpPath](self, "gptpPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "isEqual:", v10);

    if ((v11 & 1) == 0)
      -[_TSF_TSDgPTPClock setGptpPath:](self, "setGptpPath:", v4);
  }
  else
  {
    -[_TSF_TSDKernelClock propertyUpdateQueue](self, "propertyUpdateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67___TSF_TSDgPTPClock__refreshGrandmasterIdentityOnNotificationQueue__block_invoke;
    block[3] = &unk_1E694B2C0;
    v25 = v3;
    block[4] = self;
    v24 = v4;
    dispatch_sync(v9, block);

  }
  p_implClocksLock = &self->_implClocksLock;
  os_unfair_lock_lock(&self->_implClocksLock);
  -[NSPointerArray compact](self->_implClocks, "compact");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_implClocks;
  v14 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v18, "conformsToProtocol:", &unk_1EF136220, (_QWORD)v19))
          objc_msgSend(v18, "updateGrandmasterIdentity:andgPTPPath:", v3, v4);
      }
      v15 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    }
    while (v15);
  }

  os_unfair_lock_unlock(p_implClocksLock);
}

- (void)_handleRefreshConnection
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TSF_TSDgPTPClock;
  -[_TSF_TSDKernelClock _handleRefreshConnection](&v3, sel__handleRefreshConnection);
  -[_TSF_TSDgPTPClock _refreshGrandmasterIdentityOnNotificationQueue](self, "_refreshGrandmasterIdentityOnNotificationQueue");
}

- (void)_handleNotification:(unsigned int)a3 withArg1:(unint64_t)a4 andArg2:(unint64_t)a5
{
  uint64_t v7;
  objc_super v9;

  v7 = *(_QWORD *)&a3;
  if (a3 == 2004)
    -[_TSF_TSDgPTPClock _refreshGrandmasterIdentityOnNotificationQueue](self, "_refreshGrandmasterIdentityOnNotificationQueue");
  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPClock;
  -[_TSF_TSDKernelClock _handleNotification:withArg1:andArg2:](&v9, sel__handleNotification_withArg1_andArg2_, v7, a4, a5);
}

- (unint64_t)_grandmasterIdentity
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_TSF_TSDKernelClock service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("GrandmasterID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (id)_gptpPath
{
  void *v2;
  void *v3;
  void *v4;

  -[_TSF_TSDKernelClock service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ASPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)clockIdentity
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_TSF_TSDKernelClock service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unsigned)clockPriority1
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_TSF_TSDKernelClock service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockPriority1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)clockPriority2
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_TSF_TSDKernelClock service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockPriority2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)clockClass
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_TSF_TSDKernelClock service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockClass"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)clockAccuracy
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_TSF_TSDKernelClock service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ClockAccuracy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)addLinkLayerPortOnInterfaceNamed:(id)a3 allocatedPortNumber:(unsigned __int16 *)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  char v11;
  unsigned __int16 v12;
  int v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v27[0] = 0;
  v14 = 1;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDKernelClock connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v9, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 18, 0, 0, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), v27, &v14, a5);

  if ((v11 & 1) != 0)
  {
    if (a4)
    {
      v12 = v27[0];
LABEL_4:
      *a4 = v12;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v16 = "result == YES";
      v17 = 2048;
      v18 = 0;
      v19 = 2048;
      v20 = 0;
      v21 = 2080;
      v22 = "";
      v23 = 2080;
      v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      v25 = 1024;
      v26 = 982;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a4)
    {
      v12 = -1;
      goto LABEL_4;
    }
  }

  return v11;
}

- (BOOL)removeLinkLayerPortFromInterfaceNamed:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  char v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDKernelClock connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v7, "callMethodWithSelector:structInput:structInputSize:error:", 19, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), a4);

  if ((v9 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136316418;
    v12 = "result == YES";
    v13 = 2048;
    v14 = 0;
    v15 = 2048;
    v16 = 0;
    v17 = 2080;
    v18 = "";
    v19 = 2080;
    v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v21 = 1024;
    v22 = 1009;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v11, 0x3Au);
  }

  return v9;
}

- (BOOL)addUnicastUDPv4PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  unsigned __int16 v16;
  int v18;
  unsigned int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v32[0] = 0;
  v18 = 1;
  v19 = a4;
  v9 = (void *)MEMORY[0x1E0C99DF0];
  v10 = a3;
  objc_msgSend(v9, "dataWithBytes:length:", &v19, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "appendData:", v12);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_retainAutorelease(v11);
  v15 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 20, 0, 0, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), v32, &v18, a6);

  if ((v15 & 1) != 0)
  {
    if (a5)
    {
      v16 = v32[0];
LABEL_4:
      *a5 = v16;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "result == YES";
      v22 = 2048;
      v23 = 0;
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = "";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      v30 = 1024;
      v31 = 1025;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastUDPv4PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  unsigned int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v7 = (void *)MEMORY[0x1E0C99DF0];
  v8 = a3;
  objc_msgSend(v7, "dataWithBytes:length:", &v15, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "appendData:", v10);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v11, "callMethodWithSelector:structInput:structInputSize:error:", 21, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), a5);

  if ((v13 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v17 = "result == YES";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v26 = 1024;
    v27 = 1053;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v13;
}

- (BOOL)addUnicastUDPv6PtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  unsigned __int16 v17;
  int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v32[0] = 0;
  v19 = 1;
  v10 = (void *)MEMORY[0x1E0C99DF0];
  v11 = a3;
  objc_msgSend(v10, "dataWithBytes:length:", a4, 16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "appendData:", v13);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_retainAutorelease(v12);
  v16 = objc_msgSend(v14, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 22, 0, 0, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), v32, &v19, a6);

  if ((v16 & 1) != 0)
  {
    if (a5)
    {
      v17 = v32[0];
LABEL_4:
      *a5 = v17;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "result == YES";
      v22 = 2048;
      v23 = 0;
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = "";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      v30 = 1024;
      v31 = 1070;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v17 = -1;
      goto LABEL_4;
    }
  }

  return v16;
}

- (BOOL)removeUnicastUDPv6PtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99DF0];
  v9 = a3;
  objc_msgSend(v8, "dataWithBytes:length:", a4, 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "appendData:", v11);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v12, "callMethodWithSelector:structInput:structInputSize:error:", 23, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), a5);

  if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136316418;
    v17 = "result == YES";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v26 = 1024;
    v27 = 1098;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
  }

  return v14;
}

- (BOOL)addUnicastLinkLayerPtPPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  unsigned __int16 v17;
  int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v32[0] = 0;
  v19 = 1;
  v10 = (void *)MEMORY[0x1E0C99DF0];
  v11 = a3;
  objc_msgSend(v10, "dataWithBytes:length:", a4, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "appendData:", v13);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_retainAutorelease(v12);
  v16 = objc_msgSend(v14, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 24, 0, 0, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), v32, &v19, a6);

  if ((v16 & 1) != 0)
  {
    if (a5)
    {
      v17 = v32[0];
LABEL_4:
      *a5 = v17;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "result == YES";
      v22 = 2048;
      v23 = 0;
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = "";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      v30 = 1024;
      v31 = 1114;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v17 = -1;
      goto LABEL_4;
    }
  }

  return v16;
}

- (BOOL)removeUnicastLinkLayerPtPPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99DF0];
  v9 = a3;
  objc_msgSend(v8, "dataWithBytes:length:", a4, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "appendData:", v11);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v12, "callMethodWithSelector:structInput:structInputSize:error:", 25, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), a5);

  if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136316418;
    v17 = "result == YES";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v26 = 1024;
    v27 = 1142;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
  }

  return v14;
}

- (BOOL)addUnicastUDPv4EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  unsigned __int16 v16;
  int v18;
  unsigned int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v32[0] = 0;
  v18 = 1;
  v19 = a4;
  v9 = (void *)MEMORY[0x1E0C99DF0];
  v10 = a3;
  objc_msgSend(v9, "dataWithBytes:length:", &v19, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "appendData:", v12);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_retainAutorelease(v11);
  v15 = objc_msgSend(v13, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 26, 0, 0, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), v32, &v18, a6);

  if ((v15 & 1) != 0)
  {
    if (a5)
    {
      v16 = v32[0];
LABEL_4:
      *a5 = v16;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "result == YES";
      v22 = 2048;
      v23 = 0;
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = "";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      v30 = 1024;
      v31 = 1158;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v16 = -1;
      goto LABEL_4;
    }
  }

  return v15;
}

- (BOOL)removeUnicastUDPv4EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(unsigned int)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  unsigned int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v7 = (void *)MEMORY[0x1E0C99DF0];
  v8 = a3;
  objc_msgSend(v7, "dataWithBytes:length:", &v15, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "appendData:", v10);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v11, "callMethodWithSelector:structInput:structInputSize:error:", 27, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), a5);

  if ((v13 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v17 = "result == YES";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v26 = 1024;
    v27 = 1186;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v13;
}

- (BOOL)addUnicastUDPv6EtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  unsigned __int16 v17;
  int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v32[0] = 0;
  v19 = 1;
  v10 = (void *)MEMORY[0x1E0C99DF0];
  v11 = a3;
  objc_msgSend(v10, "dataWithBytes:length:", a4, 16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "appendData:", v13);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_retainAutorelease(v12);
  v16 = objc_msgSend(v14, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 28, 0, 0, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), v32, &v19, a6);

  if ((v16 & 1) != 0)
  {
    if (a5)
    {
      v17 = v32[0];
LABEL_4:
      *a5 = v17;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "result == YES";
      v22 = 2048;
      v23 = 0;
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = "";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      v30 = 1024;
      v31 = 1202;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v17 = -1;
      goto LABEL_4;
    }
  }

  return v16;
}

- (BOOL)removeUnicastUDPv6EtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99DF0];
  v9 = a3;
  objc_msgSend(v8, "dataWithBytes:length:", a4, 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "appendData:", v11);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v12, "callMethodWithSelector:structInput:structInputSize:error:", 29, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), a5);

  if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136316418;
    v17 = "result == YES";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v26 = 1024;
    v27 = 1230;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
  }

  return v14;
}

- (BOOL)addUnicastLinkLayerEtEPortOnInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 allocatedPortNumber:(unsigned __int16 *)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  unsigned __int16 v17;
  int v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v32[0] = 0;
  v19 = 1;
  v10 = (void *)MEMORY[0x1E0C99DF0];
  v11 = a3;
  objc_msgSend(v10, "dataWithBytes:length:", a4, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "appendData:", v13);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_retainAutorelease(v12);
  v16 = objc_msgSend(v14, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 30, 0, 0, objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), v32, &v19, a6);

  if ((v16 & 1) != 0)
  {
    if (a5)
    {
      v17 = v32[0];
LABEL_4:
      *a5 = v17;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v21 = "result == YES";
      v22 = 2048;
      v23 = 0;
      v24 = 2048;
      v25 = 0;
      v26 = 2080;
      v27 = "";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
      v30 = 1024;
      v31 = 1246;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    if (a5)
    {
      v17 = -1;
      goto LABEL_4;
    }
  }

  return v16;
}

- (BOOL)removeUnicastLinkLayerEtEPortFromInterfaceNamed:(id)a3 withDestinationAddress:(const char *)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99DF0];
  v9 = a3;
  objc_msgSend(v8, "dataWithBytes:length:", a4, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "appendData:", v11);
  -[_TSF_TSDKernelClock connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v12, "callMethodWithSelector:structInput:structInputSize:error:", 31, objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), a5);

  if ((v14 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136316418;
    v17 = "result == YES";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v26 = 1024;
    v27 = 1274;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
  }

  return v14;
}

- (BOOL)addReverseSyncOnInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 syncInterval:(unsigned int)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  id v10;
  char v11;
  int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v26[0] = a4;
  v26[1] = a5;
  v13 = 0;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDKernelClock connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v8);
  v11 = objc_msgSend(v9, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 41, v26, 2, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0, &v13, a6);

  if ((v11 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v15 = "result == YES";
    v16 = 2048;
    v17 = 0;
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v24 = 1024;
    v25 = 1293;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v11;
}

- (BOOL)removeReverseSyncFromInterfaceNamed:(id)a3 withDomainNumner:(unsigned __int8)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  id v9;
  char v10;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v25[0] = a4;
  v12 = 0;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDKernelClock connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v8, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:", 42, v25, 1, objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), 0, &v12, a5);

  if ((v10 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v14 = "result == YES";
    v15 = 2048;
    v16 = 0;
    v17 = 2048;
    v18 = 0;
    v19 = 2080;
    v20 = "";
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v23 = 1024;
    v24 = 1311;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  return v10;
}

- (BOOL)getSyncInfoWithSyncInfoValid:(BOOL *)a3 syncFlags:(char *)a4 timeSyncTime:(unint64_t *)a5 domainTimeHi:(unint64_t *)a6 domainTimeLo:(unint64_t *)a7 cumulativeScaledRate:(unint64_t *)a8 inverseCumulativeScaledRate:(unint64_t *)a9 grandmasterID:(unint64_t *)a10 localPortNumber:(unsigned __int16 *)a11 error:(id *)a12
{
  void *v18;
  char v19;
  int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  int64x2_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34 = -1;
  v35 = -1;
  v36 = -1;
  v37 = vdupq_n_s64(1uLL);
  v39 = 0;
  v40 = 0;
  v38 = -1;
  v41 = 0xFFFFLL;
  v21 = 9;
  -[_TSF_TSDKernelClock connection](self, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 52, 0, 0, &v34, &v21, a12);

  if ((v19 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v23 = "result == YES";
    v24 = 2048;
    v25 = 0;
    v26 = 2048;
    v27 = 0;
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPClock.m";
    v32 = 1024;
    v33 = 1324;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (a5)
    *a5 = v34;
  if (a6)
    *a6 = v35;
  if (a7)
    *a7 = v36;
  if (a8)
    *a8 = v37.i64[0];
  if (a9)
    *a9 = v37.u64[1];
  if (a10)
    *a10 = v38;
  if (a3)
    *a3 = v39 != 0;
  if (a4)
    *a4 = v40;
  if (a11)
    *a11 = v41;
  return v19;
}

- (id)clockName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gPTP Domain with Clock Identifier 0x%016llx"), -[_TSF_TSDKernelClock clockIdentifier](self, "clockIdentifier"));
}

- (NSArray)ports
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDKernelClock service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childIteratorInServicePlaneWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __26___TSF_TSDgPTPClock_ports__block_invoke;
  v8[3] = &unk_1E694B188;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "enumerateWithBlock:", v8);

  return (NSArray *)v6;
}

- (id)portWithPortNumber:(unsigned __int16)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  unsigned __int16 v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  v14 = __Block_byref_object_dispose__1;
  v15 = 0;
  -[_TSF_TSDKernelClock service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childIteratorInServicePlaneWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40___TSF_TSDgPTPClock_portWithPortNumber___block_invoke;
  v8[3] = &unk_1E694BA98;
  v9 = a3;
  v8[4] = &v10;
  objc_msgSend(v5, "enumerateWithBlock:", v8);
  v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

- (id)getMetrics
{
  return -[_TSF_TSDClockMetrics initWithClock:]([_TSF_TSDClockMetrics alloc], "initWithClock:", self);
}

- (id)getMetricsWithDelta:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_TSF_TSDgPTPClock getMetrics](self, "getMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getDelta:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_TSF_TSDgPTPClock;
  -[_TSF_TSDgPTPClock dealloc](&v2, sel_dealloc);
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____TSF_TSDgPTPClock;
  v3 = a3;
  objc_msgSendSuper2(&v11, sel_diagnosticInfoForService_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "childIteratorInServicePlaneWithError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46___TSF_TSDgPTPClock_diagnosticInfoForService___block_invoke;
  v9[3] = &unk_1E694B188;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateWithBlock:", v9);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("Ports"));

  return v4;
}

+ (id)clockNameForClockIdentifier:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gPTP Domain with Clock Identifier 0x%016llx"), a3);
}

- (void)addImplClock:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_implClocksLock);
  -[NSPointerArray compact](self->_implClocks, "compact");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_implClocks;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9) == v4)
        {

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_implClocks, "addPointer:", v4, (_QWORD)v10);
LABEL_11:
  os_unfair_lock_unlock(&self->_implClocksLock);

}

- (void)removeImplClock:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_implClocksLock);
  -[NSPointerArray compact](self->_implClocks, "compact");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_implClocks;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_implClocks, "removePointerAtIndex:", v8 + v10, (_QWORD)v12);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_implClocksLock);

}

- (NSArray)gptpPath
{
  return self->_gptpPath;
}

- (void)setGptpPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)grandmasterIdentity
{
  return self->_grandmasterIdentity;
}

- (void)setGrandmasterIdentity:(unint64_t)a3
{
  self->_grandmasterIdentity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gptpPath, 0);
  objc_storeStrong((id *)&self->_implClocks, 0);
}

@end

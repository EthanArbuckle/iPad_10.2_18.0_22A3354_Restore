@implementation SSStackShot

+ (id)generateSymbolicatedStackShot
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "generateSymbolicatedStackShotPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resultWithTimeout:error:", 0, 10.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)generateSymbolicatedStackShotPromise
{
  SSPromise *v2;
  void *v3;
  NSObject *v4;
  SSPromise *v5;
  id v6;
  void *v7;
  SSPromise *v8;
  _QWORD v10[4];
  SSPromise *v11;
  void *v12;

  if (!+[SSDevice deviceIsInternalBuild](SSDevice, "deviceIsInternalBuild"))
    return 0;
  v2 = objc_alloc_init(SSPromise);
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackReturnAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__SSStackShot_generateSymbolicatedStackShotPromise__block_invoke;
  v10[3] = &unk_1E47B8768;
  v5 = v2;
  v11 = v5;
  v12 = v3;
  v6 = v3;
  dispatch_async(v4, v10);

  v7 = v12;
  v8 = v5;

  return v8;
}

void __51__SSStackShot_generateSymbolicatedStackShotPromise__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t Range;
  const char *Name;
  uint64_t Filename;
  const char *v10;
  int LineNumber;
  uint64_t v12;
  const char *v13;
  char *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  char *v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  CSSymbolicatorCreateWithTaskFlagsAndNotification();
  if (CSIsNull())
  {
    v2 = *(void **)(a1 + 32);
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, (uint64_t)CFSTR("Stack Shot Failed"), (uint64_t)CFSTR("Failed to create symbolicator"));
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:");

  }
  else
  {
    mach_absolute_time();
    CSSymbolicatorGetArchitecture();
    v3 = CSArchitectureIs64Bit();
    v21 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = a1;
    obj = *(id *)(a1 + 40);
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v22)
    {
      v24 = 0;
      if (v3)
        v4 = 16;
      else
        v4 = 8;
      v19 = *(_QWORD *)v28;
      v20 = v4;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(obj);
          v6 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "unsignedIntegerValue");
          CSSymbolicatorGetSymbolOwnerWithAddressAtTime();
          CSSymbolicatorGetSymbolWithAddressAtTime();
          v26 = 0;
          Range = CSSymbolGetRange();
          Name = (const char *)CSSymbolGetName();
          if (Name)
            asprintf(&v26, " %s + %llu", Name, v6 - Range);
          CSSymbolOwnerGetSourceInfoWithAddress();
          Filename = CSSourceInfoGetFilename();
          v25 = 0;
          if (Filename)
          {
            v10 = (const char *)Filename;
            LineNumber = CSSourceInfoGetLineNumber();
            asprintf(&v25, " (%s:%u)", v10, LineNumber);
          }
          v12 = CSSymbolOwnerGetName();
          if (v12)
            v13 = (const char *)v12;
          else
            v13 = "";
          v15 = v25;
          v14 = v26;
          if (!v26)
            v14 = "";
          if (!v25)
            v15 = "";
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%-3d %-30s\t0x%0*llx%s%s\n"), v24 + i, v13, v20, v6, v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            free(v26);
          if (v25)
            free(v25);
          objc_msgSend(v21, "appendString:", v16);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v24 = (v24 + i);
      }
      while (v22);
    }

    objc_msgSend(*(id *)(v17 + 32), "finishWithResult:", v21);
  }
}

@end

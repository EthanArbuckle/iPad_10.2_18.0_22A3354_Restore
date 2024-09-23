@implementation NSError(PXErrorRecovery)

- (id)px_errorWithRecoveryOptions:()PXErrorRecovery
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  PXErrorRecoveryAttempter *v16;
  void *v17;
  void *v18;
  id v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v13, "title");
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (!v13)
          {

            v15 = &stru_1E5149688;
          }
          objc_msgSend(v7, "addObject:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D78]);
    v16 = objc_alloc_init(PXErrorRecoveryAttempter);
    -[PXErrorRecoveryAttempter setRecoveryOptions:](v16, "setRecoveryOptions:", v8);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB3148]);
    v17 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(a1, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, objc_msgSend(a1, "code"), v6);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v21;
  }
  else
  {
    v19 = a1;
  }

  return v19;
}

@end

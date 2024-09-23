@implementation TRISysdiagnoseOutputFormatter

+ (id)formatRecords:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  uint64_t i;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  unsigned int v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id obj;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[5];
  __CFString *v34;
  __CFString *v35;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(v28, "sortedArrayUsingComparator:", &__block_literal_global_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("UTC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);
  v31 = v4;
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));

  v6 = (void *)objc_msgSend(&unk_1E3C19490, "mutableCopy");
  if (!objc_msgSend(v3, "count"))
    objc_msgSend(v6, "addObject:", CFSTR("no experiments history"));
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v3;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  v7 = &stru_1E3C00710;
  if (v32)
  {
    v8 = -1;
    v30 = *(_QWORD *)v38;
    v9 = &stru_1E3C00710;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __47__TRISysdiagnoseOutputFormatter_formatRecords___block_invoke_2;
        v33[3] = &unk_1E3BFEAA8;
        v33[4] = v11;
        v12 = v9;
        v34 = v12;
        v36 = v8;
        v13 = v7;
        v35 = v13;
        if (__47__TRISysdiagnoseOutputFormatter_formatRecords___block_invoke_2((uint64_t)v33))
        {
          v14 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v11, "experimentId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("    - experiment: %@.%d"), v15, objc_msgSend(v11, "deploymentId"));

          v17 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v11, "treatmentId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("      treatment : %@"), v18);

          objc_msgSend(v6, "addObject:", v16);
          objc_msgSend(v6, "addObject:", v19);
          objc_msgSend(v6, "addObject:", CFSTR("      states    :"));

        }
        v20 = (void *)MEMORY[0x1A1AC6B8C]();
        v21 = objc_alloc(MEMORY[0x1E0CB3940]);
        v22 = objc_msgSend(v11, "eventType") - 1;
        v23 = CFSTR("unknown");
        if (v22 <= 8)
          v23 = off_1E3BFEAC8[(char)v22];
        objc_msgSend(v11, "eventDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringFromDate:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("        - %@ -> %@"), v23, v25);

        objc_msgSend(v6, "addObject:", v26);
        objc_autoreleasePoolPop(v20);
        objc_msgSend(v11, "experimentId");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v8 = objc_msgSend(v11, "deploymentId");
        objc_msgSend(v11, "treatmentId");
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v32);
  }
  else
  {
    v9 = &stru_1E3C00710;
  }

  return v6;
}

uint64_t __47__TRISysdiagnoseOutputFormatter_formatRecords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "experimentId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experimentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "deploymentId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "deploymentId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

    if (!v8)
    {
      objc_msgSend(v4, "treatmentId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "treatmentId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v11, "compare:", v12);

      if (!v8)
      {
        objc_msgSend(v4, "eventDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "eventDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v13, "compare:", v14);

      }
    }
  }

  return v8;
}

uint64_t __47__TRISysdiagnoseOutputFormatter_formatRecords___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "experimentId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40))
    && objc_msgSend(*(id *)(a1 + 32), "deploymentId") == *(_DWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "treatmentId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 48));

    v5 = v4 ^ 1u;
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

@end

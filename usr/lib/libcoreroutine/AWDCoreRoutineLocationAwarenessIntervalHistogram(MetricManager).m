@implementation AWDCoreRoutineLocationAwarenessIntervalHistogram(MetricManager)

- (char)_init
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = a1;
  v18.super_class = (Class)&off_1EFCDCC88;
  v1 = (char *)objc_msgSendSuper2(&v18, sel_init);
  if (v1)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultIntervalHistogram");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (int)*MEMORY[0x1E0DDD350];
    v4 = *(void **)&v1[v3];
    *(_QWORD *)&v1[v3] = v2;

    objc_msgSend((id)objc_opt_class(), "_defaultIntervalHistogram");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (int)*MEMORY[0x1E0DDD358];
    v7 = *(void **)&v1[v6];
    *(_QWORD *)&v1[v6] = v5;

    objc_msgSend((id)objc_opt_class(), "_defaultIntervalHistogram");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (int)*MEMORY[0x1E0DDD368];
    v10 = *(void **)&v1[v9];
    *(_QWORD *)&v1[v9] = v8;

    objc_msgSend((id)objc_opt_class(), "_defaultIntervalHistogram");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (int)*MEMORY[0x1E0DDD370];
    v13 = *(void **)&v1[v12];
    *(_QWORD *)&v1[v12] = v11;

    objc_msgSend((id)objc_opt_class(), "_defaultIntervalHistogram");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (int)*MEMORY[0x1E0DDD360];
    v16 = *(void **)&v1[v15];
    *(_QWORD *)&v1[v15] = v14;

  }
  return v1;
}

- (uint64_t)metricId
{
  return 2883620;
}

- (BOOL)valid:()MetricManager
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "conformsToProtocol:", &unk_1EFCD9890) & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((objc_msgSend((id)objc_opt_class(), "checkIntervalHistogramDimensions:", *(_QWORD *)&a1[*MEMORY[0x1E0DDD350]]) & 1) != 0)
      {
        if ((objc_msgSend((id)objc_opt_class(), "checkIntervalHistogramDimensions:", *(_QWORD *)&a1[*MEMORY[0x1E0DDD358]]) & 1) != 0)
        {
          if ((objc_msgSend((id)objc_opt_class(), "checkIntervalHistogramDimensions:", *(_QWORD *)&a1[*MEMORY[0x1E0DDD368]]) & 1) != 0)
          {
            if ((objc_msgSend((id)objc_opt_class(), "checkIntervalHistogramDimensions:", *(_QWORD *)&a1[*MEMORY[0x1E0DDD370]]) & 1) != 0)
            {
              if ((objc_msgSend((id)objc_opt_class(), "checkIntervalHistogramDimensions:", *(_QWORD *)&a1[*MEMORY[0x1E0DDD360]]) & 1) != 0)
              {
                v5 = 0;
                goto LABEL_21;
              }
              v8 = (void *)MEMORY[0x1E0CB3940];
              v9 = CFSTR("Invalid metric. Bad dimensions for lessThan200mIntervalHistograms.");
            }
            else
            {
              v8 = (void *)MEMORY[0x1E0CB3940];
              v9 = CFSTR("Invalid metric. Bad dimensions for lessThan55mIntervalHistograms.");
            }
          }
          else
          {
            v8 = (void *)MEMORY[0x1E0CB3940];
            v9 = CFSTR("Invalid metric. Bad dimensions for lessThan25mIntervalHistograms.");
          }
        }
        else
        {
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = CFSTR("Invalid metric. Bad dimensions for lessThan10mIntervalHistograms.");
        }
      }
      else
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = CFSTR("Invalid metric. Bad dimensions for anyPositiveIntervalHistograms.");
      }
      objc_msgSend(v8, "stringWithFormat:", v9);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!a3)
        goto LABEL_21;
    }
    else
    {
      v5 = CFSTR("Invalid metric. the metric does not have an ID.");
      if (!a3)
        goto LABEL_21;
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromProtocol((Protocol *)&unk_1EFCD9890);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Invalid metric. metric does not conform to the %@ protocol."), v7);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_21;
  }
  if (v5)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2D50];
    v14[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 1, v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_21:

  return v5 == 0;
}

+ (id)_defaultIntervalHistogram
{
  void *v0;
  int i;
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 8; ++i)
  {
    v2 = (void *)objc_opt_new();
    v3 = 24;
    do
    {
      objc_msgSend(v2, "addCount:", 0);
      --v3;
    }
    while (v3);
    objc_msgSend(v0, "addObject:", v2);

  }
  return v0;
}

+ (uint64_t)checkIntervalHistogramDimensions:()MetricManager
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "count") == 8;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v4 = v4 & (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "countsCount", (_QWORD)v11) == 24);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

@end

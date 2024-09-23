@implementation AWDCoreRoutineLocationAwarenessLocationTimeHistograms(MetricManager)

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
  int v17;
  objc_super v19;

  v19.receiver = a1;
  v19.super_class = (Class)&off_1EFCDC920;
  v1 = (char *)objc_msgSendSuper2(&v19, sel_init);
  if (v1)
  {
    v2 = objc_opt_new();
    v3 = (int)*MEMORY[0x1E0DDD378];
    v4 = *(void **)&v1[v3];
    *(_QWORD *)&v1[v3] = v2;

    v5 = objc_opt_new();
    v6 = (int)*MEMORY[0x1E0DDD380];
    v7 = *(void **)&v1[v6];
    *(_QWORD *)&v1[v6] = v5;

    v8 = objc_opt_new();
    v9 = (int)*MEMORY[0x1E0DDD390];
    v10 = *(void **)&v1[v9];
    *(_QWORD *)&v1[v9] = v8;

    v11 = objc_opt_new();
    v12 = (int)*MEMORY[0x1E0DDD398];
    v13 = *(void **)&v1[v12];
    *(_QWORD *)&v1[v12] = v11;

    v14 = objc_opt_new();
    v15 = (int)*MEMORY[0x1E0DDD388];
    v16 = *(void **)&v1[v15];
    *(_QWORD *)&v1[v15] = v14;

    v17 = 24;
    do
    {
      objc_msgSend(*(id *)&v1[v3], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v6], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v9], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v12], "addCount:", 0);
      objc_msgSend(*(id *)&v1[v15], "addCount:", 0);
      --v17;
    }
    while (v17);
  }
  return v1;
}

- (uint64_t)metricId
{
  return 2883619;
}

- (BOOL)valid:()MetricManager
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "conformsToProtocol:", &unk_1EFCD9890) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromProtocol((Protocol *)&unk_1EFCD9890);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("Invalid metric. metric does not conform to the %@ protocol."), v12);
LABEL_18:
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_21;
    goto LABEL_19;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (int)*MEMORY[0x1E0DDD378];
    if (objc_msgSend(*(id *)&a1[v5], "countsCount") == 24)
    {
      v6 = (int)*MEMORY[0x1E0DDD380];
      if (objc_msgSend(*(id *)&a1[v6], "countsCount") == 24)
      {
        v7 = (int)*MEMORY[0x1E0DDD390];
        if (objc_msgSend(*(id *)&a1[v7], "countsCount") == 24)
        {
          v8 = (int)*MEMORY[0x1E0DDD398];
          if (objc_msgSend(*(id *)&a1[v8], "countsCount") == 24)
          {
            v9 = (int)*MEMORY[0x1E0DDD388];
            if (objc_msgSend(*(id *)&a1[v9], "countsCount") == 24)
            {
              v10 = 0;
              goto LABEL_21;
            }
            v13 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)&a1[v9], "countsCount"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v12;
            v14 = CFSTR("Invalid metric. lessThan200mHistogram bin count, %@");
          }
          else
          {
            v13 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)&a1[v8], "countsCount"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v12;
            v14 = CFSTR("Invalid metric. lessThan55mHistogram bin count, %@");
          }
        }
        else
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)&a1[v7], "countsCount"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v12;
          v14 = CFSTR("Invalid metric. lessThan20mHistogram bin count, %@");
        }
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)&a1[v6], "countsCount"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v12;
        v14 = CFSTR("Invalid metric. lessThan10mHistogram bin count, %@");
      }
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)&a1[v5], "countsCount"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v12;
      v14 = CFSTR("Invalid metric. anyPositiveHistogram bin count, %@");
    }
    objc_msgSend(v13, "stringWithFormat:", v14, v18);
    goto LABEL_18;
  }
  v10 = CFSTR("Invalid metric. the metric does not have an ID.");
  if (!a3)
    goto LABEL_21;
LABEL_19:
  if (v10)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 1, v16);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_21:

  return v10 == 0;
}

@end

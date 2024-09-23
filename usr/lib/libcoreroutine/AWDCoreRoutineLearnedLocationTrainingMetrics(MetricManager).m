@implementation AWDCoreRoutineLearnedLocationTrainingMetrics(MetricManager)

- (uint64_t)metricId
{
  return 2883637;
}

- (char)_init
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&off_1EFCDD3A8;
  v1 = (char *)objc_msgSendSuper2(&v10, sel_init);
  v2 = v1;
  if (v1)
  {
    *(_QWORD *)&v1[*MEMORY[0x1E0DDD2F0]] = -1;
    *(_QWORD *)&v1[*MEMORY[0x1E0DDD2F8]] = -1;
    *(_QWORD *)&v1[*MEMORY[0x1E0DDD308]] = -1;
    *(_QWORD *)&v1[*MEMORY[0x1E0DDD328]] = -1;
    *(_DWORD *)&v1[*MEMORY[0x1E0DDD300]] = -1;
    *(_DWORD *)&v1[*MEMORY[0x1E0DDD310]] = -1;
    *(_DWORD *)&v1[*MEMORY[0x1E0DDD318]] = -1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (int)*MEMORY[0x1E0DDD320];
    v5 = *(void **)&v2[v4];
    *(_QWORD *)&v2[v4] = v3;

    *(_DWORD *)&v2[*MEMORY[0x1E0DDD338]] = -1;
    *(_DWORD *)&v2[*MEMORY[0x1E0DDD340]] = -1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (int)*MEMORY[0x1E0DDD348];
    v8 = *(void **)&v2[v7];
    *(_QWORD *)&v2[v7] = v6;

    v2[*MEMORY[0x1E0DDD330]] = 0;
  }
  return v2;
}

- (BOOL)valid:()MetricManager
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "conformsToProtocol:", &unk_1EFCD9890) & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = 0;
      goto LABEL_9;
    }
    v4 = CFSTR("Failed metric submission because the metric does not have an ID.");
    if (!a3)
      goto LABEL_9;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromProtocol((Protocol *)&unk_1EFCD9890);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Failed metric submission because the metric does not conform to the %@ protocol."), v6);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_9;
  }
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 1, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v4 == 0;
}

- (id)description
{
  objc_class *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "trainedVisits");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  v14 = v4;
  v13 = objc_msgSend(a1, "latency");
  v12 = objc_msgSend(a1, "intervalSinceLastAttempt");
  v5 = objc_msgSend(a1, "locationsProcessed");
  v6 = objc_msgSend(a1, "maxIntervalBetweenLocations");
  objc_msgSend(a1, "visits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(a1, "places");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@, trainedVisits, %@, latency, %llu, intervalSinceLastAttempt, %llu, locationsProcessed, %u, maxIntervalBetweenLocations, %llu, new visits, %lu, new places, %lu, visitCountDevice, %u, visitCountTotal, %u, placeCountDevice, %u, placeCountTotal, %u"), v15, v14, v13, v12, v5, v6, v8, objc_msgSend(v9, "count"), objc_msgSend(a1, "visitCountDevice"), objc_msgSend(a1, "visitCountTotal"), objc_msgSend(a1, "placeCountDevice"), objc_msgSend(a1, "placeCountTotal"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end

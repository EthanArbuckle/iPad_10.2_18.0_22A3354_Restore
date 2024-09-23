@implementation AWDCoreRoutineLMPDailyAssessment(MetricManager)

- (uint64_t)metricId
{
  return 2883613;
}

- (char)_init
{
  char *result;
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&off_1EFCDB540;
  result = (char *)objc_msgSendSuper2(&v2, sel_init);
  if (result)
  {
    *(_DWORD *)&result[*MEMORY[0x1E0DDD260]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E0DDD268]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E0DDD270]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E0DDD278]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E0DDD280]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E0DDD288]] = 0;
    *(_DWORD *)&result[*MEMORY[0x1E0DDD290]] = 0;
  }
  return result;
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
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, dailyEvents %d, eventsWithLocation %d, eventsWithLMPLocation %d, eventsWithMaybeLocation %d, visitLocation %d, visitLMPLocation %d, visitMaybeLocation %d"), v4, objc_msgSend(a1, "dailyEvents"), objc_msgSend(a1, "eventsWithLocation"), objc_msgSend(a1, "eventsWithLMPLocation"), objc_msgSend(a1, "eventsWithMaybeLocation"), objc_msgSend(a1, "visitLocation"), objc_msgSend(a1, "visitLMPLocation"), objc_msgSend(a1, "visitMaybeLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

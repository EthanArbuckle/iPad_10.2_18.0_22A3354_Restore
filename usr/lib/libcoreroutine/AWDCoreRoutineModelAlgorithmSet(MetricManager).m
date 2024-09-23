@implementation AWDCoreRoutineModelAlgorithmSet(MetricManager)

- (uint64_t)metricId
{
  return 2883587;
}

- (id)_init
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&off_1EFCDA068;
  return objc_msgSendSuper2(&v2, sel_init);
}

- (BOOL)valid:()MetricManager
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "conformsToProtocol:", &unk_1EFCD9890) & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(a1, "instancesCount"))
      {
        v5 = 0;
        goto LABEL_12;
      }
      v5 = CFSTR("Failed metric submission because the metric set contained no metrics.");
      if (!a3)
        goto LABEL_12;
    }
    else
    {
      v5 = CFSTR("Failed metric submission because the metric does not have an ID.");
      if (!a3)
        goto LABEL_12;
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromProtocol((Protocol *)&unk_1EFCD9890);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Failed metric submission because the metric does not conform to the %@ protocol."), v7);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_12;
  }
  if (v5)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 1, v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_12:

  return v5 == 0;
}

@end

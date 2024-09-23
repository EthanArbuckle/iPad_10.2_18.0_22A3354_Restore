@implementation NSError(Metrics)

- (id)metricsAdditionalData
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  v13[1] = CFSTR("domain");
  objc_msgSend(a1, "domain");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E5500770;
  if (v3)
    v5 = (const __CFString *)v3;
  v14[1] = v5;
  v13[2] = CFSTR("user_info");
  objc_msgSend(a1, "userInfo");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = MEMORY[0x1E0C9AA70];
  if (v6)
    v8 = v6;
  v14[2] = v8;
  v13[3] = CFSTR("call_stack");
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (uint64_t)recordMetrics
{
  return +[IMMetrics recordUserAction:dataSource:](IMMetrics, "recordUserAction:dataSource:", CFSTR("error"), a1);
}

- (id)metricsContentIdentifier
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_msgSend(a1, "code");
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("NSError: %ld-%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

@implementation HDSPCDInBedDetector

+ (id)inBedDetector
{
  return objc_alloc_init((Class)a1);
}

+ (double)hoursOfSleepForResult:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "duration");
        v7 = v7 + v9 / 3600.0;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (id)detectInBedTimesDuringInterval:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE1AFB0];
  v4 = a3;
  objc_msgSend(v3, "inBedDetector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(v5, "detectInBedBetweenBedtimeDate:wakupDate:error:", v6, v7, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;

  objc_msgSend(v8, "hk_map:", &__block_literal_global_8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class();
      v14 = v13;
      objc_msgSend((id)objc_opt_class(), "hoursOfSleepForResult:", v10);
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 2048;
      v22 = v15;
      _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] calculated time in bed hours: %f", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v11;

  return v16;
}

id __54__HDSPCDInBedDetector_detectInBedTimesDuringInterval___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x24BDD1508];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "initWithStartDate:endDate:", v5, v6);
  return v7;
}

@end

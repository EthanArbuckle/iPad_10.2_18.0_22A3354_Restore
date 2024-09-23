@implementation HKCategorySample(HDSPSleep)

+ (id)hdsp_categorySampleForSleepSessionInterval:()HDSPSleep metadata:
{
  id v5;
  id v6;
  NSObject *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "sleepInterval is nil", (uint8_t *)&v26, 2u);
    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
  v7 = objc_claimAutoreleasedReturnValue();
  -[NSObject maximumAllowedDuration](v7, "maximumAllowedDuration");
  v9 = v8;
  objc_msgSend(v5, "interval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "duration");
  v12 = v11;

  if (v12 > v9)
  {
    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "interval");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "duration");
      v26 = 134218240;
      v27 = v15;
      v28 = 2048;
      v29 = v9;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "Sleep interval: %f greater than allowed: %f. Will not be used", (uint8_t *)&v26, 0x16u);

    }
LABEL_8:
    v16 = 0;
    goto LABEL_13;
  }
  v17 = objc_msgSend(v5, "type");
  if ((unint64_t)(v17 - 1) > 4)
    v18 = 2;
  else
    v18 = qword_216185ED0[v17 - 1];
  v19 = (void *)MEMORY[0x24BDD3988];
  objc_msgSend(v5, "interval");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interval");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3AF8], "localDevice");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "categorySampleWithType:value:startDate:endDate:device:metadata:", v7, v18, v21, v23, v24, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v16;
}

@end

@implementation HVUserDefaults

+ (double)harvestBudgetReserve
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HVHarvestBudgetReserve"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0.95;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "doubleValue");
      v4 = v5;
    }
  }

  return v4;
}

+ (int64_t)harvestBudgetNumberOfOperations
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HVHarvestBudgetNumberOfOperations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v3 = &unk_24DD8BCC8;
  }
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

+ (id)defaults
{
  void *v2;
  void *v3;

  +[HVUserDefaults sharedInstance](HVUserDefaults, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__HVUserDefaults_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken3_814 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3_814, block);
  return (id)sharedInstance__pasExprOnceResult_815;
}

- (id)defaults
{
  return self->_defaults;
}

+ (BOOL)harvestBudgetThrottleBudgetDisabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("HVHarvestBudgetThrottleBudgetDisabled"));

  return v3;
}

+ (BOOL)harvestBudgetDisabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("HVHarvestBudgetDisabled"));

  return v3;
}

+ (double)harvestBudgetCPUTimeSeconds
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HVHarvestBudgetCPUTimeSeconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v3 = &unk_24DD8BCF0;
  }
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

+ (BOOL)harvestBudgetRefillDisabled
{
  void *v2;
  char v3;

  objc_msgSend(a1, "defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("HVHarvestBudgetRefillDisabled"));

  return v3;
}

- (HVUserDefaults)init
{
  HVUserDefaults *v2;
  uint64_t v3;
  NSUserDefaults *defaults;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)HVUserDefaults;
  v2 = -[HVUserDefaults init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.ProactiveHarvesting"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v3;

    if (!v2->_defaults)
    {
      hv_default_log_handle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = CFSTR("com.apple.ProactiveHarvesting");
        _os_log_error_impl(&dword_21AA1D000, v5, OS_LOG_TYPE_ERROR, "HVContentAdmission failed to get NSUserDefaults for suite %@.", buf, 0xCu);
      }

    }
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
}

+ (void)setHarvestBudgetNumberOfOperations:(int64_t)a3
{
  id v4;

  objc_msgSend(a1, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("HVHarvestBudgetNumberOfOperations"));

}

+ (void)resetHarvestBudgetNumberOfOperations
{
  id v2;

  objc_msgSend(a1, "defaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("HVHarvestBudgetNumberOfOperations"));

}

+ (void)setHarvestBudgetCPUTimeSeconds:(double)a3
{
  id v4;

  objc_msgSend(a1, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("HVHarvestBudgetCPUTimeSeconds"), a3);

}

+ (void)resetHarvestBudgetCPUTimeSeconds
{
  id v2;

  objc_msgSend(a1, "defaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("HVHarvestBudgetCPUTimeSeconds"));

}

+ (void)setHarvestBudgetReserve:(double)a3
{
  id v4;

  objc_msgSend(a1, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", CFSTR("HVHarvestBudgetReserve"), a3);

}

+ (void)resetHarvestBudgetReserve
{
  id v2;

  objc_msgSend(a1, "defaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("HVHarvestBudgetReserve"));

}

+ (void)setHarvestBudgetDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("HVHarvestBudgetDisabled"));

}

+ (void)resetHarvestBudgetDisabled
{
  id v2;

  objc_msgSend(a1, "defaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("HVHarvestBudgetDisabled"));

}

+ (void)setHarvestBudgetThrottleBudgetDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("HVHarvestBudgetThrottleBudgetDisabled"));

}

+ (void)resetHarvestBudgetThrottleBudgetDisabled
{
  id v2;

  objc_msgSend(a1, "defaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("HVHarvestBudgetThrottleBudgetDisabled"));

}

+ (void)setHarvestBudgetRefillDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(a1, "defaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("HVHarvestBudgetRefillDisabled"));

}

+ (void)resetHarvestBudgetRefillDisabled
{
  id v2;

  objc_msgSend(a1, "defaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("HVHarvestBudgetRefillDisabled"));

}

void __32__HVUserDefaults_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x22074FDF0]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_815;
  sharedInstance__pasExprOnceResult_815 = v1;

  objc_autoreleasePoolPop(v0);
}

@end

@implementation RBAttributeFactory

+ (id)attributeForClass:(id)a3 andProperties:(id)a4 errors:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[RBAttributeFactory _attributeClassesByName]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "objectForKeyedSubscript:", v8);

  if (!v12)
  {
    rbs_assertion_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory attributeForClass:andProperties:errors:].cold.1();

    goto LABEL_41;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _acquisitionCompletionAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_56:
    v15 = (void *)v16;
    goto LABEL_57;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80B58];
LABEL_44:
    objc_msgSend(v17, "grant");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _cpuAccessGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _suspendableCPUGrantWithProperties:errors:]((uint64_t)a1, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    objc_opt_self();
    goto LABEL_41;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80B80];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _domainAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _durationAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _GPUAccessGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _jetsamPriorityGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _RBSBaseMemoryGrant:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80B78];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80BF0];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80C28];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80C30];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _resistTerminationGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _runningReasonAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _tagAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80AD8];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80AE0];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80AE8];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80AF0];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80AF8];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    v17 = (void *)MEMORY[0x24BE80B00];
    goto LABEL_44;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _appNapTimerThrottleAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    v13 = (void *)MEMORY[0x24BE80C18];
    goto LABEL_74;
  }
  if (v12 == objc_opt_class())
  {
    v13 = (void *)MEMORY[0x24BE80BA0];
    goto LABEL_74;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _endowmentGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _savedEndowmentGrantWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    v13 = (void *)MEMORY[0x24BE80D20];
    goto LABEL_74;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _conditionAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    +[RBAttributeFactory _invalidateUnderConditionAttributeWithProperties:errors:]((uint64_t)RBAttributeFactory, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  if (v12 == objc_opt_class())
  {
    v13 = (void *)MEMORY[0x24BE80C20];
LABEL_74:
    objc_msgSend(v13, "attribute");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
LABEL_41:
  v15 = 0;
LABEL_57:

  return v15;
}

+ (id)_attributeClassesByName
{
  objc_opt_self();
  if (_attributeClassesByName_onceToken != -1)
    dispatch_once(&_attributeClassesByName_onceToken, &__block_literal_global_238);
  return (id)_attributeClassesByName_availableClasses;
}

+ (id)_acquisitionCompletionAttributeWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  safeGetProperty(v5, CFSTR("CompletionPolicy"), v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    rbs_assertion_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _acquisitionCompletionAttributeWithProperties:errors:].cold.1();
    goto LABEL_9;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    rbs_assertion_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _acquisitionCompletionAttributeWithProperties:errors:].cold.2();

LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v14 = -[NSObject unsignedIntegerValue](v12, "unsignedIntegerValue");
  objc_msgSend(MEMORY[0x24BE80AD0], "attributeWithCompletionPolicy:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v15;
}

+ (id)_cpuAccessGrantWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Role"), v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "unsignedIntegerValue");
      objc_msgSend(MEMORY[0x24BE80B40], "grantWithRole:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)_suspendableCPUGrantWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Role"), v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v12, "unsignedIntegerValue");
      objc_msgSend(MEMORY[0x24BE80D28], "grantWithRole:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)_cpuMaximumUsageLimitationWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  double v22;
  double v23;
  unsigned __int8 v24;
  void *v25;
  NSObject *v26;
  uint64_t v28;
  uint64_t v29;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  safeGetProperty(v4, CFSTR("ViolationPolicy"), v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      rbs_assertion_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.2();
      v25 = 0;
      goto LABEL_35;
    }
    v13 = objc_opt_class();
    safeGetProperty(v4, CFSTR("Role"), v13, v5);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      rbs_assertion_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.3();
      v25 = 0;
      goto LABEL_34;
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      rbs_assertion_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.4();
      v25 = 0;
      goto LABEL_33;
    }
    v16 = objc_opt_class();
    safeGetProperty(v4, CFSTR("Percentage"), v16, v5);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v29 = -[NSObject unsignedIntegerValue](v17, "unsignedIntegerValue");
      if ((unint64_t)(v29 - 1) > 0x63)
      {
        rbs_assertion_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.8();
      }
      else
      {
        v19 = objc_opt_class();
        safeGetProperty(v4, CFSTR("Duration"), v19, v5);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          -[NSObject doubleValue](v20, "doubleValue");
          if (v22 > 0.0)
          {
            v23 = v22;
            v28 = -[NSObject unsignedIntegerValue](v12, "unsignedIntegerValue");
            v24 = -[NSObject unsignedIntegerValue](v15, "unsignedIntegerValue");
            objc_msgSend(MEMORY[0x24BE80B48], "limitationForRole:withPercentage:duration:violationPolicy:", v24, v29, v28, v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

LABEL_33:
LABEL_34:

LABEL_35:
            goto LABEL_36;
          }
          rbs_assertion_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.7();
        }
        else
        {
          rbs_assertion_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.6();
        }

      }
    }
    else
    {
      rbs_assertion_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.5();
    }
    v25 = 0;
    goto LABEL_32;
  }
  rbs_assertion_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[RBAttributeFactory _cpuMaximumUsageLimitationWithProperties:errors:].cold.1();
  v25 = 0;
LABEL_36:

  return v25;
}

+ (id)_cpuMinimumUsageGrantWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  double v20;
  double v21;
  unsigned __int8 v22;
  void *v23;
  NSObject *v24;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  safeGetProperty(v4, CFSTR("Role"), v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      rbs_assertion_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.2();
      v23 = 0;
      goto LABEL_25;
    }
    v13 = objc_opt_class();
    safeGetProperty(v4, CFSTR("Percentage"), v13, v5);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = -[NSObject unsignedIntegerValue](v14, "unsignedIntegerValue");
      if ((unint64_t)(v16 - 1) > 0x63)
      {
        rbs_assertion_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.6();
      }
      else
      {
        v17 = objc_opt_class();
        safeGetProperty(v4, CFSTR("Duration"), v17, v5);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          -[NSObject doubleValue](v18, "doubleValue");
          if (v20 > 0.0)
          {
            v21 = v20;
            v22 = -[NSObject unsignedIntegerValue](v12, "unsignedIntegerValue");
            objc_msgSend(MEMORY[0x24BE80B50], "grantForRole:withPercentage:duration:", v22, v16, v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

LABEL_25:
            goto LABEL_26;
          }
          rbs_assertion_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.5();
        }
        else
        {
          rbs_assertion_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.4();
        }

      }
    }
    else
    {
      rbs_assertion_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.3();
    }
    v23 = 0;
    goto LABEL_24;
  }
  rbs_assertion_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[RBAttributeFactory _cpuMinimumUsageGrantWithProperties:errors:].cold.1();
  v23 = 0;
LABEL_26:

  return v23;
}

+ (id)_domainAttributeWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v12;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Domain"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Name"), v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    rbs_assertion_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _domainAttributeWithProperties:errors:].cold.1();

    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", v7, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (id)_durationAttributeWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  safeGetProperty(v5, CFSTR("InvalidationDuration"), v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  safeGetProperty(v5, CFSTR("WarningDuration"), v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  safeGetProperty(v5, CFSTR("StartPolicy"), v14, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  safeGetProperty(v5, CFSTR("EndPolicy"), v16, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && v15 && v17)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v15);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v17);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v18 && v19)
    {
      v21 = -[NSObject unsignedIntegerValue](v18, "unsignedIntegerValue");
      v22 = objc_msgSend(v20, "unsignedIntegerValue");
      objc_msgSend(v11, "doubleValue");
      v24 = v23;
      objc_msgSend(v13, "doubleValue");
      objc_msgSend(MEMORY[0x24BE80B90], "attributeWithDuration:warningDuration:startPolicy:endPolicy:", v21, v22, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

      goto LABEL_21;
    }
    if (v18)
    {
      if (v19)
      {
LABEL_19:
        v26 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      rbs_assertion_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        +[RBAttributeFactory _durationAttributeWithProperties:errors:].cold.2();

      if (v20)
        goto LABEL_19;
    }
    rbs_assertion_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _durationAttributeWithProperties:errors:].cold.1();

    goto LABEL_19;
  }
  rbs_assertion_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v30 = 138544130;
    v31 = v11;
    v32 = 2114;
    v33 = v13;
    v34 = 2114;
    v35 = v15;
    v36 = 2114;
    v37 = v17;
    _os_log_error_impl(&dword_21A8B4000, v18, OS_LOG_TYPE_ERROR, "Detected misconfigured duration attribute: invalidationDuration %{public}@; warningDuration %{public}@; startPolic"
      "y %{public}@; endPolicy %{public}@",
      (uint8_t *)&v30,
      0x2Au);
  }
  v26 = 0;
LABEL_21:

  return v26;
}

+ (id)_GPUAccessGrantWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Role"), v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BE80BA8], "grant");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue");

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BE80BA8], "grantWithRole:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v15 = (void *)v14;
    goto LABEL_9;
  }
  rbs_assertion_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    +[RBAttributeFactory _GPUAccessGrantWithProperties:errors:].cold.1();

  v15 = 0;
LABEL_9:

  return v15;
}

+ (id)_jetsamPriorityGrantWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Band"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE80BE0], "grantWithBand:", objc_msgSend(v7, "unsignedIntValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    rbs_assertion_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _jetsamPriorityGrantWithProperties:errors:].cold.1();

    v8 = 0;
  }

  return v8;
}

+ (id)_RBSBaseMemoryGrant:(void *)a3 errors:
{
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  safeGetProperty(v4, CFSTR("Category"), v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_opt_class();
    safeGetProperty(v4, CFSTR("Strength"), v12, v5);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(MEMORY[0x24BE80B38], "grantWithCategory:strength:", v11, -[NSObject charValue](v14, "charValue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

        goto LABEL_15;
      }
      rbs_assertion_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[RBAttributeFactory _RBSBaseMemoryGrant:errors:].cold.3();

    }
    else
    {
      rbs_assertion_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[RBAttributeFactory _RBSBaseMemoryGrant:errors:].cold.2();
    }
    v16 = 0;
    goto LABEL_14;
  }
  rbs_assertion_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    +[RBAttributeFactory _RBSBaseMemoryGrant:errors:].cold.1();
  v16 = 0;
LABEL_15:

  return v16;
}

+ (id)_resistTerminationGrantWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Resistance"), v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BE80D00], "grantWithResistance:", objc_msgSend(v12, "integerValue"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_runningReasonAttributeWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_opt_class();
  safeGetProperty(v5, CFSTR("RunningReason"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    rbs_assertion_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _runningReasonAttributeWithProperties:errors:].cold.1();
    goto LABEL_8;
  }
  v8 = objc_msgSend(v7, "longValue");
  if (v8 < 1)
  {
    rbs_assertion_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _runningReasonAttributeWithProperties:errors:].cold.2();
LABEL_8:

    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BE80D08], "withReason:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v9;
}

+ (id)_tagAttributeWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Tag"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE80D30], "attributeWithTag:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    rbs_assertion_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _tagAttributeWithProperties:errors:].cold.1();

    v8 = 0;
  }

  return v8;
}

+ (id)_appNapTimerThrottleAttributeWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Tier"), v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11
    || (objc_msgSend(v9, "objectForKeyedSubscript:", v11), (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (v13 = v12,
        objc_msgSend(MEMORY[0x24BE80B08], "grantWithTier:", objc_msgSend(v12, "unsignedCharValue")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    rbs_assertion_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _appNapTimerThrottleAttributeWithProperties:errors:].cold.1();

    v14 = 0;
  }

  return v14;
}

+ (id)_endowmentGrantWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  +[RBAttributeFactory _legalPropertyNamesAndValuesByClassName]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Namespace"), v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11
    || (objc_msgSend(v9, "objectForKeyedSubscript:", v11), (v12 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v13 = (void *)v12,
        objc_msgSend(MEMORY[0x24BE80B98], "grantWithNamespace:endowment:", v12, 0),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
    rbs_assertion_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _endowmentGrantWithProperties:errors:].cold.1();

    v14 = 0;
  }

  return v14;
}

+ (id)_savedEndowmentGrantWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Namespace"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Key"), v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10
    || (objc_msgSend(MEMORY[0x24BE80D18], "grantWithNamespace:key:", v7, v9),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    rbs_assertion_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _savedEndowmentGrantWithProperties:errors:].cold.1();

    v11 = 0;
  }

  return v11;
}

+ (id)_conditionAttributeWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Condition"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  safeGetProperty(v5, CFSTR("Value"), v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10
    || (objc_msgSend(MEMORY[0x24BE80B68], "attributeWithCondition:value:", v7, objc_msgSend(v9, "integerValue")),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    rbs_assertion_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[RBAttributeFactory _conditionAttributeWithProperties:errors:].cold.1();

    v11 = 0;
  }

  return v11;
}

+ (id)_invalidateUnderConditionAttributeWithProperties:(void *)a3 errors:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (_os_feature_enabled_impl())
  {
    v6 = objc_opt_class();
    safeGetProperty(v4, CFSTR("Condition"), v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "isEqualToString:", CFSTR("therm")) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v10 = objc_opt_class();
      safeGetProperty(v4, CFSTR("MinValue"), v10, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v8
        || !v11
        || (objc_msgSend(MEMORY[0x24BE80BD8], "attributeWithCondition:minValue:", v8, objc_msgSend(v11, "integerValue")),
            (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        rbs_assertion_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          +[RBAttributeFactory _invalidateUnderConditionAttributeWithProperties:errors:].cold.1();

        v13 = 0;
      }
      v9 = v13;

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_legalPropertyNamesAndValuesByClassName
{
  objc_opt_self();
  if (_legalPropertyNamesAndValuesByClassName_onceToken != -1)
    dispatch_once(&_legalPropertyNamesAndValuesByClassName_onceToken, &__block_literal_global_16);
  return (id)_legalPropertyNamesAndValuesByClassName_legalValues;
}

void __61__RBAttributeFactory__legalPropertyNamesAndValuesByClassName__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[2];
  _QWORD v6[12];
  _QWORD v7[13];

  v7[12] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("RBSAcquisitionCompletionAttribute");
  v6[1] = CFSTR("RBSCPUAccessGrant");
  v7[0] = &unk_24DD5F9B8;
  v7[1] = &unk_24DD5F9E0;
  v6[2] = CFSTR("RBSSuspendableCPUGrant");
  v6[3] = CFSTR("RBSCoalitionLevelGrant");
  v7[2] = &unk_24DD5FA08;
  v7[3] = &unk_24DD5FA30;
  v6[4] = CFSTR("RBSCPUMaximumUsageLimitation");
  v6[5] = CFSTR("RBSBaseMemoryGrant");
  v7[4] = &unk_24DD5FA58;
  v7[5] = &unk_24DD5FA80;
  v6[6] = CFSTR("RBSCPUMinimumUsageGrant");
  v6[7] = CFSTR("RBSResistTerminationGrant");
  v7[6] = &unk_24DD5FAA8;
  v7[7] = &unk_24DD5FAD0;
  v6[8] = CFSTR("RBSDurationAttribute");
  v6[9] = CFSTR("RBSAppNapPreventTimerThrottleGrant");
  v7[8] = &unk_24DD5FAF8;
  v7[9] = &unk_24DD5FB20;
  v6[10] = CFSTR("RBSEndowmentGrant");
  v4[0] = CFSTR("RBSVisibilityNamespace");
  v4[1] = CFSTR("RBSUserfacingNamespace");
  v0 = *MEMORY[0x24BE80E98];
  v5[0] = *MEMORY[0x24BE80EA0];
  v5[1] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[11] = CFSTR("RBSGPUAccessGrant");
  v7[10] = v1;
  v7[11] = &unk_24DD5FB48;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 12);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_legalPropertyNamesAndValuesByClassName_legalValues;
  _legalPropertyNamesAndValuesByClassName_legalValues = v2;

}

void __45__RBAttributeFactory__attributeClassesByName__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  objc_class *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  objc_class *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  objc_class *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  objc_class *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  objc_class *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  objc_class *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  objc_class *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  objc_class *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  objc_class *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  objc_class *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  objc_class *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  objc_class *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  objc_class *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  objc_class *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  objc_class *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  objc_class *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  objc_class *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  objc_class *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  objc_class *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  objc_class *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  objc_class *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  objc_class *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  objc_class *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  objc_class *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  objc_class *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  objc_class *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  objc_class *v140;
  id v141;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_attributeClassesByName_availableClasses;
  _attributeClassesByName_availableClasses = v0;

  v2 = objc_opt_class();
  v3 = (void *)_attributeClassesByName_availableClasses;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v5);

  v6 = objc_opt_class();
  v7 = (void *)_attributeClassesByName_availableClasses;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v9);

  v10 = objc_opt_class();
  v11 = (void *)_attributeClassesByName_availableClasses;
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v13);

  v14 = objc_opt_class();
  v15 = (void *)_attributeClassesByName_availableClasses;
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v17);

  v18 = objc_opt_class();
  v19 = (void *)_attributeClassesByName_availableClasses;
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v21);

  v22 = objc_opt_class();
  v23 = (void *)_attributeClassesByName_availableClasses;
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v25);

  v26 = objc_opt_class();
  v27 = (void *)_attributeClassesByName_availableClasses;
  v28 = (objc_class *)objc_opt_class();
  NSStringFromClass(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v29);

  v30 = objc_opt_class();
  v31 = (void *)_attributeClassesByName_availableClasses;
  v32 = (objc_class *)objc_opt_class();
  NSStringFromClass(v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v33);

  v34 = objc_opt_class();
  v35 = (void *)_attributeClassesByName_availableClasses;
  v36 = (objc_class *)objc_opt_class();
  NSStringFromClass(v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v37);

  v38 = objc_opt_class();
  v39 = (void *)_attributeClassesByName_availableClasses;
  v40 = (objc_class *)objc_opt_class();
  NSStringFromClass(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, v41);

  v42 = objc_opt_class();
  v43 = (void *)_attributeClassesByName_availableClasses;
  v44 = (objc_class *)objc_opt_class();
  NSStringFromClass(v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", v42, v45);

  v46 = objc_opt_class();
  v47 = (void *)_attributeClassesByName_availableClasses;
  v48 = (objc_class *)objc_opt_class();
  NSStringFromClass(v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", v46, v49);

  v50 = objc_opt_class();
  v51 = (void *)_attributeClassesByName_availableClasses;
  v52 = (objc_class *)objc_opt_class();
  NSStringFromClass(v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setObject:forKeyedSubscript:", v50, v53);

  v54 = objc_opt_class();
  v55 = (void *)_attributeClassesByName_availableClasses;
  v56 = (objc_class *)objc_opt_class();
  NSStringFromClass(v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setObject:forKeyedSubscript:", v54, v57);

  v58 = objc_opt_class();
  v59 = (void *)_attributeClassesByName_availableClasses;
  v60 = (objc_class *)objc_opt_class();
  NSStringFromClass(v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setObject:forKeyedSubscript:", v58, v61);

  v62 = objc_opt_class();
  v63 = (void *)_attributeClassesByName_availableClasses;
  v64 = (objc_class *)objc_opt_class();
  NSStringFromClass(v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKeyedSubscript:", v62, v65);

  v66 = objc_opt_class();
  v67 = (void *)_attributeClassesByName_availableClasses;
  v68 = (objc_class *)objc_opt_class();
  NSStringFromClass(v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setObject:forKeyedSubscript:", v66, v69);

  v70 = objc_opt_class();
  v71 = (void *)_attributeClassesByName_availableClasses;
  v72 = (objc_class *)objc_opt_class();
  NSStringFromClass(v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setObject:forKeyedSubscript:", v70, v73);

  v74 = objc_opt_class();
  v75 = (void *)_attributeClassesByName_availableClasses;
  v76 = (objc_class *)objc_opt_class();
  NSStringFromClass(v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setObject:forKeyedSubscript:", v74, v77);

  v78 = objc_opt_class();
  v79 = (void *)_attributeClassesByName_availableClasses;
  v80 = (objc_class *)objc_opt_class();
  NSStringFromClass(v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setObject:forKeyedSubscript:", v78, v81);

  v82 = objc_opt_class();
  v83 = (void *)_attributeClassesByName_availableClasses;
  v84 = (objc_class *)objc_opt_class();
  NSStringFromClass(v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v82, v85);

  v86 = objc_opt_class();
  v87 = (void *)_attributeClassesByName_availableClasses;
  v88 = (objc_class *)objc_opt_class();
  NSStringFromClass(v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setObject:forKeyedSubscript:", v86, v89);

  v90 = objc_opt_class();
  v91 = (void *)_attributeClassesByName_availableClasses;
  v92 = (objc_class *)objc_opt_class();
  NSStringFromClass(v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setObject:forKeyedSubscript:", v90, v93);

  v94 = objc_opt_class();
  v95 = (void *)_attributeClassesByName_availableClasses;
  v96 = (objc_class *)objc_opt_class();
  NSStringFromClass(v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setObject:forKeyedSubscript:", v94, v97);

  v98 = objc_opt_class();
  v99 = (void *)_attributeClassesByName_availableClasses;
  v100 = (objc_class *)objc_opt_class();
  NSStringFromClass(v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setObject:forKeyedSubscript:", v98, v101);

  v102 = objc_opt_class();
  v103 = (void *)_attributeClassesByName_availableClasses;
  v104 = (objc_class *)objc_opt_class();
  NSStringFromClass(v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setObject:forKeyedSubscript:", v102, v105);

  v106 = objc_opt_class();
  v107 = (void *)_attributeClassesByName_availableClasses;
  v108 = (objc_class *)objc_opt_class();
  NSStringFromClass(v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "setObject:forKeyedSubscript:", v106, v109);

  v110 = objc_opt_class();
  v111 = (void *)_attributeClassesByName_availableClasses;
  v112 = (objc_class *)objc_opt_class();
  NSStringFromClass(v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "setObject:forKeyedSubscript:", v110, v113);

  v114 = objc_opt_class();
  v115 = (void *)_attributeClassesByName_availableClasses;
  v116 = (objc_class *)objc_opt_class();
  NSStringFromClass(v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "setObject:forKeyedSubscript:", v114, v117);

  v118 = objc_opt_class();
  v119 = (void *)_attributeClassesByName_availableClasses;
  v120 = (objc_class *)objc_opt_class();
  NSStringFromClass(v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setObject:forKeyedSubscript:", v118, v121);

  v122 = objc_opt_class();
  v123 = (void *)_attributeClassesByName_availableClasses;
  v124 = (objc_class *)objc_opt_class();
  NSStringFromClass(v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "setObject:forKeyedSubscript:", v122, v125);

  v126 = objc_opt_class();
  v127 = (void *)_attributeClassesByName_availableClasses;
  v128 = (objc_class *)objc_opt_class();
  NSStringFromClass(v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setObject:forKeyedSubscript:", v126, v129);

  v130 = objc_opt_class();
  v131 = (void *)_attributeClassesByName_availableClasses;
  v132 = (objc_class *)objc_opt_class();
  NSStringFromClass(v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setObject:forKeyedSubscript:", v130, v133);

  v134 = objc_opt_class();
  v135 = (void *)_attributeClassesByName_availableClasses;
  v136 = (objc_class *)objc_opt_class();
  NSStringFromClass(v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setObject:forKeyedSubscript:", v134, v137);

  v138 = objc_opt_class();
  v139 = (void *)_attributeClassesByName_availableClasses;
  v140 = (objc_class *)objc_opt_class();
  NSStringFromClass(v140);
  v141 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "setObject:forKeyedSubscript:", v138, v141);

}

+ (void)attributeForClass:andProperties:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Detected misconfigured attribute with unknown class name %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_acquisitionCompletionAttributeWithProperties:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured acquisition completion attribute with no completion policy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_acquisitionCompletionAttributeWithProperties:errors:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Detected misconfigured acquisition completion attribute with unknown completion policy: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage limitation with no violation policy", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage limitation with unknown violation policy: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage limitation with no role", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage limitation with unknown role: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage limitation with no percentage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage limitation with no duration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage limitation with illegal duration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_cpuMaximumUsageLimitationWithProperties:errors:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage limitation with illegal percentage: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage grant with no role", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage grant with unknown role: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage grant with no percentage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage grant with no duration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage grant with illegal duration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_cpuMinimumUsageGrantWithProperties:errors:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage grant with illegal percentage: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_domainAttributeWithProperties:errors:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Detected misconfigured domain attribute: domain %{public}@; name %{public}@");
  OUTLINED_FUNCTION_1_1();
}

+ (void)_durationAttributeWithProperties:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Detected misconfigured duration attribute with unknown end policy: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_durationAttributeWithProperties:errors:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Detected misconfigured duration attribute with unknown start policy: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_GPUAccessGrantWithProperties:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Detected misconfigured GPU Access grant with unknown role name: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_jetsamPriorityGrantWithProperties:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured jetsam priority grant with no (or 0) band", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_RBSBaseMemoryGrant:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage limitation with no category", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_RBSBaseMemoryGrant:errors:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage limitation with no strength", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_RBSBaseMemoryGrant:errors:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_21A8B4000, v0, v1, "Detected misconfigured CPU usage limitation with unknown strength: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

+ (void)_runningReasonAttributeWithProperties:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured run reason with no reason", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_runningReasonAttributeWithProperties:errors:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured run reason with negative reason", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_tagAttributeWithProperties:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured tag attribute with missing tag", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_appNapTimerThrottleAttributeWithProperties:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured RBSAppNapPreventTimerThrottleGrant attribute with missing tier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_endowmentGrantWithProperties:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_21A8B4000, v0, v1, "Detected misconfigured RBSEndowmentGrant attribute with missing namespace", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_savedEndowmentGrantWithProperties:errors:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Detected misconfigured RBSSavedEndowmentGrant attribute with namespace %{public}@ and key %{public}@");
  OUTLINED_FUNCTION_1_1();
}

+ (void)_conditionAttributeWithProperties:errors:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Detected misconfigured RBSConditionAttribute attribute with condition %{public}@ and value %{public}@");
  OUTLINED_FUNCTION_1_1();
}

+ (void)_invalidateUnderConditionAttributeWithProperties:errors:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_19(&dword_21A8B4000, v0, v1, "Detected misconfigured RBSConditionAttribute attribute with condition %{public}@ and minVal %{public}@");
  OUTLINED_FUNCTION_1_1();
}

@end

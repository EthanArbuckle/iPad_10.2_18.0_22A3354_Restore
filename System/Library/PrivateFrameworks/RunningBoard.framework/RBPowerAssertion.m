@implementation RBPowerAssertion

uint64_t __56__RBPowerAssertion__nameForPreventIdleSleepIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (__CFString)_nameForPreventIdleSleepIdentifiers:(uint64_t)a1
{
  id v2;
  __CFString *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "count"))
  {
    if (objc_msgSend(v2, "count") == 1)
    {
      objc_msgSend(v2, "anyObject");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v5 = v2;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v17;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v17 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "description");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v10);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v7);
      }

      objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_1);
      v11 = objc_msgSend(v4, "count");
      if (v11 >= 0x14)
        v12 = 20;
      else
        v12 = v11;
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        for (i = 0; i != v12; ++i)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", i);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString appendFormat:](v3, "appendFormat:", CFSTR(";%@"), v14);

        }
      }

    }
  }
  else
  {
    v3 = &stru_24DD48378;
  }

  return v3;
}

- (void)invalidateWithHandler:(uint64_t)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1 && !*(_BYTE *)(a1 + 40))
  {
    *(_BYTE *)(a1 + 40) = 1;
    v4 = v3;
    -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:](a1, 0, v3);
    v3 = v4;
  }

}

- (void)updateWithAcquisitionHandler:(void *)a3 invalidationHander:
{
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  IOPMAssertionID v8;
  IOPMAssertionID *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  IOPMAssertionID v13;
  uint64_t v14;
  NSObject *v15;
  IOPMAssertionID v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint8_t buf[4];
  IOPMAssertionID v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend((id)a1, "_targetPid");
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 44));
    if ((int)v7 < 1 || *(_BYTE *)(a1 + 40))
    {
      v9 = (IOPMAssertionID *)(a1 + 8);
      v8 = *(_DWORD *)(a1 + 8);
      if (v8)
      {
        if (v6)
        {
          v6[2](v6);
          v8 = *v9;
        }
        if (IOPMAssertionRelease(v8))
        {
          rbs_power_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:].cold.3();
        }
        else
        {
          rbs_ttl_log();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v16 = *v9;
            *(_DWORD *)buf = 67240192;
            v28 = v16;
            _os_log_impl(&dword_21A8B4000, v10, OS_LOG_TYPE_DEFAULT, "Released power assertion with ID %{public}d", buf, 8u);
          }
        }

        *(_DWORD *)(a1 + 8) = 0;
        v17 = *(void **)(a1 + 24);
        *(_QWORD *)(a1 + 24) = 0;

        v18 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = 0;

      }
    }
    else
    {
      if (*(_DWORD *)(a1 + 8))
      {
        -[RBPowerAssertion _calculateNewName]((_QWORD *)a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(*(id *)(a1 + 24), "isEqualToString:", v11) & 1) == 0)
        {
          rbs_ttl_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(_DWORD *)(a1 + 8);
            v14 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 67240706;
            v28 = v13;
            v29 = 2114;
            v30 = v14;
            v31 = 2114;
            v32 = v11;
            _os_log_impl(&dword_21A8B4000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to rename power assertion %{public}d for target %{public}@ to %{public}@", buf, 0x1Cu);
          }

          if (IOPMAssertionSetProperty(*(_DWORD *)(a1 + 8), CFSTR("AssertName"), v11))
          {
            rbs_power_log();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:].cold.2();

          }
          objc_storeStrong((id *)(a1 + 24), v11);
        }
      }
      else
      {
        -[RBPowerAssertion _calculateNewName]((_QWORD *)a1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = CFSTR("AssertName");
        v33[1] = CFSTR("AssertionOnBehalfOfPID");
        v34[0] = v11;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34[1] = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addEntriesFromDictionary:", v21);

        v22 = IOPMAssertionDeclareSystemActivityWithProperties();
        if ((_DWORD)v22)
        {
          v23 = v22;
          rbs_power_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            -[RBPowerAssertion updateWithAcquisitionHandler:invalidationHander:].cold.1(v7, v23, v24);
        }
        else
        {
          rbs_power_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240448;
            v28 = 0;
            v29 = 1026;
            LODWORD(v30) = v7;
            _os_log_impl(&dword_21A8B4000, v25, OS_LOG_TYPE_DEFAULT, "Acquired process power assertion with ID %{public}d for pid %{public}d", buf, 0xEu);
          }

          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v26 = objc_claimAutoreleasedReturnValue();
          v24 = *(NSObject **)(a1 + 16);
          *(_QWORD *)(a1 + 16) = v26;
        }

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 44));
  }

}

- (id)_calculateNewName
{
  id v1;
  __CFString *v2;
  __CFString *v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    v2 = (__CFString *)a1[4];
    if (!v2)
      v2 = CFSTR("unknown");
    v3 = v2;
    objc_msgSend(v1, "_preventIdleSleepIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBPowerAssertion _nameForPreventIdleSleepIdentifiers:]((uint64_t)RBPowerAssertion, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v5);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (RBPowerAssertion)init
{
  RBPowerAssertion *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBPowerAssertion;
  result = -[RBPowerAssertion init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBPowerAssertionManager.m"), 207, CFSTR("invalidate not called"));

  }
  v5.receiver = self;
  v5.super_class = (Class)RBPowerAssertion;
  -[RBPowerAssertion dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_acquisitionDate, 0);
}

- (int)_targetPid
{
  return 0;
}

- (id)_preventIdleSleepIdentifiers
{
  return 0;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@| id:%u name:%@ acquisitionDate:%@>"), v5, self->_identifier, self->_name, self->_acquisitionDate);

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)updateWithAcquisitionHandler:(NSObject *)a3 invalidationHander:.cold.1(int a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;

  LODWORD(v3) = 67240448;
  HIDWORD(v3) = a1;
  LOWORD(v4) = 1026;
  *(_DWORD *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_0_3(&dword_21A8B4000, a2, a3, "Error acquiring process power assertion for pid %{public}d: 0x%{public}x", v3, v4);
  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithAcquisitionHandler:invalidationHander:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_21A8B4000, v0, v1, "Error renaming power assertion with ID %{public}d: 0x%{public}x");
  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithAcquisitionHandler:invalidationHander:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_21A8B4000, v0, v1, "Error releasing power assertion with ID %{public}d: 0x%{public}x");
  OUTLINED_FUNCTION_1_1();
}

@end

@implementation NSDictionary(TPSCoreAdditions)

- (uint64_t)TPSSafeIntegerForKey:()TPSCoreAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "TPSSafeObjectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (id)TPSSafeNumberForKey:()TPSCoreAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  if (v5)
  {
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[TPSLogger default](TPSLogger, "default");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138413058;
        v12 = v5;
        v13 = 2112;
        v14 = (id)objc_opt_class();
        v15 = 2112;
        v16 = v7;
        v17 = 2112;
        v18 = v4;
        v9 = v14;
        _os_log_impl(&dword_19A906000, v8, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@. Expected type: %@ for key %@", (uint8_t *)&v11, 0x2Au);

      }
      v5 = 0;
    }
  }

  return v5;
}

- (id)TPSSafeObjectForKey:()TPSCoreAdditions
{
  void *v1;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 == (void *)*MEMORY[0x1E0C9B0D0])
  {

    v1 = 0;
  }
  return v1;
}

- (id)TPSSafeArrayForKey:()TPSCoreAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  if (v5)
  {
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[TPSLogger default](TPSLogger, "default");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138413058;
        v12 = v5;
        v13 = 2112;
        v14 = (id)objc_opt_class();
        v15 = 2112;
        v16 = v7;
        v17 = 2112;
        v18 = v4;
        v9 = v14;
        _os_log_impl(&dword_19A906000, v8, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@. Expected type: %@ for key %@", (uint8_t *)&v11, 0x2Au);

      }
      v5 = 0;
    }
  }

  return v5;
}

- (id)TPSSafeDictionaryForKey:()TPSCoreAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  if (v5)
  {
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[TPSLogger default](TPSLogger, "default");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138413058;
        v12 = v5;
        v13 = 2112;
        v14 = (id)objc_opt_class();
        v15 = 2112;
        v16 = v7;
        v17 = 2112;
        v18 = v4;
        v9 = v14;
        _os_log_impl(&dword_19A906000, v8, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@. Expected type: %@ for key %@", (uint8_t *)&v11, 0x2Au);

      }
      v5 = 0;
    }
  }

  return v5;
}

- (id)TPSSafeStringForKey:()TPSCoreAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  if (v5)
  {
    v7 = v6;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      +[TPSLogger default](TPSLogger, "default");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138413058;
        v12 = v5;
        v13 = 2112;
        v14 = (id)objc_opt_class();
        v15 = 2112;
        v16 = v7;
        v17 = 2112;
        v18 = v4;
        v9 = v14;
        _os_log_impl(&dword_19A906000, v8, OS_LOG_TYPE_INFO, "Unexpected value: %@ with class %@. Expected type: %@ for key %@", (uint8_t *)&v11, 0x2Au);

      }
      v5 = 0;
    }
  }

  return v5;
}

- (uint64_t)TPSSafeIntForKey:()TPSCoreAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "TPSSafeObjectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "intValue");

  return v2;
}

- (uint64_t)TPSSafeUIntegerForKey:()TPSCoreAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "TPSSafeObjectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (uint64_t)TPSSafeBoolForKey:()TPSCoreAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "TPSSafeObjectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (double)TPSSafeDoubleForKey:()TPSCoreAdditions
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "TPSSafeObjectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");
  v3 = v2;

  return v3;
}

- (float)TPSSafeFloatForKey:()TPSCoreAdditions
{
  void *v1;
  float v2;
  float v3;

  objc_msgSend(a1, "TPSSafeObjectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  v3 = v2;

  return v3;
}

@end

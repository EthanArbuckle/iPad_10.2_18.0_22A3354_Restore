@implementation NSDictionary(SafeCastParseDictionary)

+ (float)floatValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  float v15;

  v7 = a4;
  v8 = a5;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v7, "numberForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v11, "isEqual:", v12),
            v12,
            (v13 & 1) == 0))
      {
        objc_msgSend(v11, "floatValue");
        a1 = v15;
      }
      else
      {
        WFLogForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          +[NSDictionary(SafeCastParseDictionary) floatValueFromDictionary:forKey:defaultValue:].cold.1();

      }
    }
  }

  return a1;
}

+ (double)doubleValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  double v15;

  v7 = a4;
  v8 = a5;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v7, "numberForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v11, "isEqual:", v12),
            v12,
            (v13 & 1) == 0))
      {
        objc_msgSend(v11, "doubleValue");
        a1 = v15;
      }
      else
      {
        WFLogForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          +[NSDictionary(SafeCastParseDictionary) doubleValueFromDictionary:forKey:defaultValue:].cold.1();

      }
    }
  }

  return a1;
}

+ (uint64_t)integerValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v7, "numberForKey:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v11, "isEqual:", v12),
            v12,
            (v13 & 1) == 0))
      {
        a5 = objc_msgSend(v11, "integerValue");
      }
      else
      {
        WFLogForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          +[NSDictionary(SafeCastParseDictionary) integerValueFromDictionary:forKey:defaultValue:].cold.1((uint64_t)v8, a5, v14);

      }
    }
  }

  return a5;
}

+ (id)stringValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7
    && (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v7, "isEqual:", v10),
        v10,
        !v11))
  {
    objc_msgSend(v7, "stringForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v13, "isEqual:", v14),
          v14,
          v16 = v13,
          v15))
    {
      WFLogForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        +[NSDictionary(SafeCastParseDictionary) stringValueFromDictionary:forKey:defaultValue:].cold.1((uint64_t)v8, (uint64_t)v9, v17);

      v16 = v9;
    }
    v12 = v16;

  }
  else
  {
    v12 = v9;
  }

  return v12;
}

+ (uint64_t)timeIntervalValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:
{
  return objc_msgSend(MEMORY[0x24BDBCE70], "doubleValueFromDictionary:forKey:defaultValue:");
}

- (id)dictionaryForKey:()SafeCastParseDictionary
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)arrayForKey:()SafeCastParseDictionary
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)numberForKey:()SafeCastParseDictionary
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)stringForKey:()SafeCastParseDictionary
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)BOOLForKey:()SafeCastParseDictionary defaultValue:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "numberForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

+ (void)floatValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_21189A000, v0, v1, "Missing integer value for key: %{public}@ defaultValue: %ld", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)doubleValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_5(&dword_21189A000, v0, v1, "Missing integer value for key: %{public}@ defaultValue: %ld", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)integerValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  OUTLINED_FUNCTION_0_5(&dword_21189A000, a3, (uint64_t)a3, "Missing integer value for key: %{public}@ defaultValue: %ld", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)stringValueFromDictionary:()SafeCastParseDictionary forKey:defaultValue:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_0_5(&dword_21189A000, a3, (uint64_t)a3, "Missing string value for key: %{public}@ defaultValue: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end

@implementation NSDateFormatter(RCAdditions)

+ (uint64_t)dateFormatterWithFormat:()RCAdditions forReuse:
{
  return objc_msgSend(a1, "dateFormatterWithFormat:localeIdentifier:forReuse:", a3, CFSTR("en_US_POSIX"), a4);
}

+ (uint64_t)dateFormatterWithFormat:()RCAdditions localeIdentifier:forReuse:
{
  return objc_msgSend(a1, "dateFormatterWithFormat:localeIdentifier:timezone:forReuse:", a3, a4, 0, a5);
}

+ (uint64_t)dateFormatterWithFormat:()RCAdditions timezone:forReuse:
{
  return objc_msgSend(a1, "dateFormatterWithFormat:localeIdentifier:timezone:forReuse:", a3, CFSTR("en_US_POSIX"), a4, a5);
}

+ (id)dateFormatterWithFormat:()RCAdditions localeIdentifier:timezone:forReuse:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      +[NSDateFormatter(RCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:].cold.2();
      if (!v10)
      {
LABEL_9:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          +[NSDateFormatter(RCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:].cold.1();
      }
    }
    else if (!v10)
    {
      goto LABEL_9;
    }
    v18 = 0;
    goto LABEL_12;
  }
  if (!v10)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "threadDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("NSDateFormatter_RCAdditions_CachedFormatters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "threadDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v14, CFSTR("NSDateFormatter_RCAdditions_CachedFormatters"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v9, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3578]), "initWithFormat:localeIdentifier:", v9, v10);
    v18 = v20;
    if (v11)
      objc_msgSend(v20, "setTimeZone:", v11);
    if (v18)
    {
      if (a6)
        objc_msgSend(v14, "setObject:forKey:", v18, v17);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        +[NSDateFormatter(RCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:].cold.3();
      v18 = 0;
    }
  }

LABEL_12:
  return v18;
}

- (void)initWithFormat:()RCAdditions localeIdentifier:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(a1, "init");
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setDateFormat:", v6);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocale:", v10);

  }
  return v9;
}

+ (void)dateFormatterWithFormat:()RCAdditions localeIdentifier:timezone:forReuse:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"localeIdentifier != nil", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

+ (void)dateFormatterWithFormat:()RCAdditions localeIdentifier:timezone:forReuse:.cold.2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"format != nil", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

+ (void)dateFormatterWithFormat:()RCAdditions localeIdentifier:timezone:forReuse:.cold.3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"formatter", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end

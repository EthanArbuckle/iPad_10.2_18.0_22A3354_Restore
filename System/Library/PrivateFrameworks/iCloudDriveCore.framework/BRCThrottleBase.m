@implementation BRCThrottleBase

- (BRCThrottleBase)initWithName:(id)a3 andParameters:(id)a4
{
  id v7;
  id v8;
  BRCThrottleBase *v9;
  BRCThrottleBase *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t minimumNsecsBetweenRetries;
  uint64_t maximumNsecsBetweenRetries;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  objc_super v30;

  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)BRCThrottleBase;
  v9 = -[BRCThrottleBase init](&v30, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("start-after"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_initialRetryCount = objc_msgSend(v11, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("give-up-after"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_finalRetryCount = objc_msgSend(v12, "intValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("wait-at-least"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v10->_minimumNsecsBetweenRetries = brc_interval_to_nsec();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("wait-at-most"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v10->_maximumNsecsBetweenRetries = brc_interval_to_nsec();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("forget-after"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v10->_nsecsBeforeForgettingCounter = brc_interval_to_nsec();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("max-elemnt-count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_maximumElementCount = objc_msgSend(v16, "unsignedIntValue");

    if (!v10->_maximumElementCount)
      v10->_maximumElementCount = 0x7FFFFFFF;
    if (v10->_initialRetryCount > v10->_finalRetryCount)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[BRCThrottleBase initWithName:andParameters:].cold.5();

    }
    minimumNsecsBetweenRetries = v10->_minimumNsecsBetweenRetries;
    if (minimumNsecsBetweenRetries > v10->_maximumNsecsBetweenRetries)
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        -[BRCThrottleBase initWithName:andParameters:].cold.4();

      minimumNsecsBetweenRetries = v10->_minimumNsecsBetweenRetries;
    }
    if (minimumNsecsBetweenRetries <= 0)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
        -[BRCThrottleBase initWithName:andParameters:].cold.3();

    }
    maximumNsecsBetweenRetries = v10->_maximumNsecsBetweenRetries;
    if (maximumNsecsBetweenRetries <= 0)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        -[BRCThrottleBase initWithName:andParameters:].cold.2();

      maximumNsecsBetweenRetries = v10->_maximumNsecsBetweenRetries;
    }
    if (v10->_nsecsBeforeForgettingCounter < maximumNsecsBetweenRetries)
    {
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        -[BRCThrottleBase initWithName:andParameters:].cold.1();

    }
  }

  return v10;
}

- (int64_t)retryBackoff:(unsigned int)a3
{
  int64_t result;
  unint64_t minimumNsecsBetweenRetries;
  unsigned int v6;

  result = 0;
  minimumNsecsBetweenRetries = self->_minimumNsecsBetweenRetries;
  if (minimumNsecsBetweenRetries)
  {
    v6 = a3 - self->_initialRetryCount;
    if ((v6 & 0x80000000) == 0)
    {
      result = self->_maximumNsecsBetweenRetries;
      if (v6 < __clz(minimumNsecsBetweenRetries) && result >= (uint64_t)(minimumNsecsBetweenRetries << v6))
        return minimumNsecsBetweenRetries << v6;
    }
  }
  return result;
}

- (int64_t)nsecsToNextRetry:(int64_t)a3 retryCount:(unsigned int *)a4 now:(int64_t)a5
{
  int64_t maximumNsecsBetweenRetries;
  unsigned int v10;
  int64_t v11;
  int64_t v12;
  void *v13;
  NSObject *v14;
  int64_t result;
  BOOL v16;
  void *v18;
  NSObject *v19;
  int64_t v21;

  maximumNsecsBetweenRetries = self->_maximumNsecsBetweenRetries;
  v10 = *a4;
  v11 = -[BRCThrottleBase retryBackoff:](self, "retryBackoff:", *a4);
  v12 = a5 - a3;
  if (a5 >= a3)
  {
    if (v10)
      v16 = v12 < self->_nsecsBeforeForgettingCounter;
    else
      v16 = 1;
    if (v16)
    {
      if (v10 <= self->_initialRetryCount || v11 <= v12)
      {
        if (v10 >= self->_finalRetryCount)
          return 0x7FFFFFFFFFFFFFFFLL;
        v21 = 0;
        *a4 = v10 + 1;
      }
      else
      {
        v21 = v11 - v12;
      }
      if (v21 >= maximumNsecsBetweenRetries)
        v21 = maximumNsecsBetweenRetries;
      if (v21 >= 10000000)
        return v21;
      else
        return 0;
    }
    else
    {
      brc_bread_crumbs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCThrottleBase nsecsToNextRetry:retryCount:now:].cold.2();

      result = 0;
      *a4 = 1;
    }
  }
  else
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCThrottleBase nsecsToNextRetry:retryCount:now:].cold.1();

    return a3 - a5;
  }
  return result;
}

- (BOOL)isBlocking
{
  return self->_finalRetryCount == 0;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)nsecsBeforeForgettingCounter
{
  return self->_nsecsBeforeForgettingCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)initWithName:andParameters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _nsecsBeforeForgettingCounter >= _maximumNsecsBetweenRetries%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithName:andParameters:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _maximumNsecsBetweenRetries > 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithName:andParameters:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _minimumNsecsBetweenRetries > 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithName:andParameters:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _minimumNsecsBetweenRetries <= _maximumNsecsBetweenRetries%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)initWithName:andParameters:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_230455000, v0, v1, "[CRIT] Assertion failed: _initialRetryCount <= _finalRetryCount%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)nsecsToNextRetry:retryCount:now:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] We haven't finished the previous throttle%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)nsecsToNextRetry:retryCount:now:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Forgetting retry counter%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

@end

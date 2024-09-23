@implementation RCBackgroundFetchConfiguration

- (RCBackgroundFetchConfiguration)initWithTaskIdentifier:(id)a3 sessionIdentifier:(id)a4 sharedContainerIdentifier:(id)a5 earliestBeginDate:(id)a6 timeout:(double)a7
{
  id v11;
  id v13;
  id v14;
  id v15;
  id v16;
  RCBackgroundFetchConfiguration *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  id v27;
  id v28;
  objc_super v29;

  v11 = a3;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v29.receiver = self;
  v29.super_class = (Class)RCBackgroundFetchConfiguration;
  v17 = -[RCBackgroundFetchConfiguration init](&v29, sel_init);
  if (v17)
  {
    if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[RCBackgroundFetchConfiguration initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:].cold.4();
      if (v14)
        goto LABEL_7;
    }
    else if (v14)
    {
      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[RCBackgroundFetchConfiguration initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:].cold.3();
LABEL_7:
    if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[RCBackgroundFetchConfiguration initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:].cold.2();
      if (v16)
        goto LABEL_10;
    }
    else if (v16)
    {
LABEL_10:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v27 = v11;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingTimeInterval:", a7);
      v28 = a4;
      v19 = v15;
      v20 = a5;
      v21 = v14;
      v22 = a6;
      v23 = v13;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "rc_isLaterThan:", v16);

      v13 = v23;
      a6 = v22;
      v14 = v21;
      a5 = v20;
      v15 = v19;
      a4 = v28;

      v11 = v27;
      if ((v25 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[RCBackgroundFetchConfiguration initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:].cold.1();
    }
    objc_storeStrong((id *)&v17->_taskIdentifier, v11);
    objc_storeStrong((id *)&v17->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v17->_sharedContainerIdentifier, a5);
    objc_storeStrong((id *)&v17->_earliestBeginDate, a6);
    v17->_timeout = a7;
  }

  return v17;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_taskIdentifier, a3);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (NSString)sharedContainerIdentifier
{
  return self->_sharedContainerIdentifier;
}

- (void)setSharedContainerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sharedContainerIdentifier, a3);
}

- (NSDate)earliestBeginDate
{
  return self->_earliestBeginDate;
}

- (void)setEarliestBeginDate:(id)a3
{
  objc_storeStrong((id *)&self->_earliestBeginDate, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestBeginDate, 0);
  objc_storeStrong((id *)&self->_sharedContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

- (void)initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:.cold.1()
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Background request timeout must take delay for scheduled requests into account."));
  v1 = 136315906;
  v2 = "-[RCBackgroundFetchConfiguration initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:]";
  v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/BackgroundURLSessionSupport/RCBackg"
       "roundFetchConfiguration.m";
  v5 = 1024;
  v6 = 38;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

- (void)initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:.cold.2()
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
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sharedContainerIdentifier", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:.cold.3()
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
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sessionIdentifier", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

- (void)initWithTaskIdentifier:sessionIdentifier:sharedContainerIdentifier:earliestBeginDate:timeout:.cold.4()
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
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"taskIdentifier", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end

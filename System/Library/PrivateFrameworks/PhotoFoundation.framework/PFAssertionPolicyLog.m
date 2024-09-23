@implementation PFAssertionPolicyLog

- (void)notifyAssertion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = a3;
    objc_msgSend(v4, "prettyMethodName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "lineNumber");
    objc_msgSend(v4, "message");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backtrace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413314;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2048;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v10;
    _os_log_error_impl(&dword_1B70DA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure in %@, %@:%lu\nMessage: %@\nBacktrace:\n%@", (uint8_t *)&v11, 0x34u);

  }
}

@end

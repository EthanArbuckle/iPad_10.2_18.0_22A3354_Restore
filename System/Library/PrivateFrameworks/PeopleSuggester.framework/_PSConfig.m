@implementation _PSConfig

+ (id)messagesPinningConfig
{
  +[_PSConfig _configs]();
  return (id)qword_1ED00A3B0;
}

+ (uint64_t)_configs
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21___PSConfig__configs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (_configs_onceToken != -1)
    dispatch_once(&_configs_onceToken, block);
  return &_configs_configs;
}

+ (id)_loadPlistNamed:(int)a3 abortOnFailure:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  stat v29;

  v4 = a2;
  objc_opt_self();
  v5 = (void *)MEMORY[0x1A1AFCA24]();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForResource:withExtension:", v4, CFSTR("plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v29, 0, sizeof(v29));
  if (stat((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v29))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      +[_PSConfig _loadPlistNamed:abortOnFailure:].cold.3((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    if (!_PASEvaluateLogFaultAndProbCrashCriteria() && !a3)
    {
LABEL_6:
      v16 = 0;
      goto LABEL_7;
    }
    goto LABEL_22;
  }
  if (v29.st_size < 4096
    || (objc_msgSend(MEMORY[0x1E0D815D8], "dictionaryWithPath:error:", v8, 0),
        (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v8);
    if (v18)
    {
      v19 = (void *)v18;
      v28 = 0;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v18, &v28);
      v20 = v28;
      if (!v16)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          +[_PSConfig _loadPlistNamed:abortOnFailure:].cold.2((uint64_t)v4, (uint64_t)v20);
        if (_PASEvaluateLogFaultAndProbCrashCriteria() || a3)
          goto LABEL_22;
        v16 = 0;
      }

      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      +[_PSConfig _loadPlistNamed:abortOnFailure:].cold.1((uint64_t)v4, v21, v22, v23, v24, v25, v26, v27);
    if (!_PASEvaluateLogFaultAndProbCrashCriteria() && !a3)
      goto LABEL_6;
LABEL_22:
    abort();
  }
LABEL_7:

  objc_autoreleasePoolPop(v5);
  return v16;
}

+ (id)defaultConfig
{
  +[_PSConfig _configs]();
  return (id)_configs_configs;
}

+ (id)contactEmbeddingConfig
{
  +[_PSConfig _configs]();
  return (id)qword_1ED00A3B8;
}

+ (id)vocab
{
  +[_PSConfig _configs]();
  return (id)qword_1ED00A3C0;
}

+ (void)_loadPlistNamed:(uint64_t)a3 abortOnFailure:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Unable to generate URL path for plist %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)_loadPlistNamed:(uint64_t)a1 abortOnFailure:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  v4 = 2114;
  v5 = a2;
  _os_log_fault_impl(&dword_1A07F4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Failed to decode plist named %{public}@: %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)_loadPlistNamed:(uint64_t)a3 abortOnFailure:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_1A07F4000, MEMORY[0x1E0C81028], a3, "Failed to stat plist named %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

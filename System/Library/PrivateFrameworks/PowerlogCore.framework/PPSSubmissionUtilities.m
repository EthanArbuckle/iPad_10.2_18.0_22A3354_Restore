@implementation PPSSubmissionUtilities

+ (id)taskingTables
{
  id v2;

  if (!+[PLDefaults taskMode](PLDefaults, "taskMode"))
    goto LABEL_5;
  if (taskingTables_onceToken != -1)
    dispatch_once(&taskingTables_onceToken, &__block_literal_global_37);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v2 = 0;
  else
LABEL_5:
    v2 = (id)taskingTables_result;
  return v2;
}

void __39__PPSSubmissionUtilities_taskingTables__block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;

  +[PLDefaults objectForKey:ifNotSet:](PLDefaults, "objectForKey:ifNotSet:", CFSTR("PPSTaskingTables"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)taskingTables_result;
  taskingTables_result = v0;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    PLLogSubmission();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __39__PPSSubmissionUtilities_taskingTables__block_invoke_cold_1(v2);

  }
}

void __39__PPSSubmissionUtilities_taskingTables__block_invoke_cold_1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = taskingTables_result;
  _os_log_debug_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_DEBUG, "PPSTaskingTables=%@", (uint8_t *)&v1, 0xCu);
}

@end

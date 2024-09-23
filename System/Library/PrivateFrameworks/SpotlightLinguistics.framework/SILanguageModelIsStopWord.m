@implementation SILanguageModelIsStopWord

void __SILanguageModelIsStopWord_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2)
  {
    if (logger(void)::token != -1)
      dispatch_once(&logger(void)::token, &__block_literal_global_71);
    v3 = logger(void)::log;
    if (os_log_type_enabled((os_log_t)logger(void)::log, OS_LOG_TYPE_ERROR))
      __SILanguageModelIsStopWord_block_invoke_cold_1(a2, v3);
  }
}

void __SILanguageModelIsStopWord_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B8671000, a2, OS_LOG_TYPE_ERROR, "localization (IsStopWord): %@", (uint8_t *)&v2, 0xCu);
}

@end

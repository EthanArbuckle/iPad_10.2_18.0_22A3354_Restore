@implementation PHAPeopleSuggestionEnrichmentTask

- (double)period
{
  return 86400.0;
}

- (int)priority
{
  return -1;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAPeopleSuggestionEnrichmentTask timeoutFatal:]", "PHAPeopleSuggestionEnrichmentTask.m", 25, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAPeopleSuggestionEnrichmentTask is stuck", v3, 2u);
  }
}

- (id)enrichmentProcessor
{
  return objc_alloc_init(MEMORY[0x1E0D75FE0]);
}

@end

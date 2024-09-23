@implementation WAPresentFirstUsageDialogIfNeeded

intptr_t __WAPresentFirstUsageDialogIfNeeded_block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint8_t v5[16];

  if (a2)
  {
    WALogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_DEFAULT, "Presenting first usage dialog", v5, 2u);
    }

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end

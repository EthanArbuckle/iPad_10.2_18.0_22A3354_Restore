@implementation UISCreateLoggerIfNeeded

void ___UISCreateLoggerIfNeeded_block_invoke(uint64_t a1)
{
  os_log_t v2;
  uint64_t v3;
  void *v4;

  v2 = os_log_create("com.apple.uikitservices.servicefacilities", *(const char **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

@end

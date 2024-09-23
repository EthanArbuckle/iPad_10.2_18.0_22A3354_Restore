@implementation OS_tcc_object

- (void)dealloc
{
  int v3;
  void *v4;
  __int16 v5;
  const char *ClassName;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2080;
  ClassName = object_getClassName(a1);
  _os_log_debug_impl(&dword_1A364C000, a2, OS_LOG_TYPE_DEBUG, "disposing: %p(%s)", (uint8_t *)&v3, 0x16u);
}

@end

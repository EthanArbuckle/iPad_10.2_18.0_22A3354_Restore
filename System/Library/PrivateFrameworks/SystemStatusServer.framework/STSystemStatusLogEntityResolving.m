@implementation STSystemStatusLogEntityResolving

void __STSystemStatusLogEntityResolving_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0DB0EC0], "EntityResolving");
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

}

@end

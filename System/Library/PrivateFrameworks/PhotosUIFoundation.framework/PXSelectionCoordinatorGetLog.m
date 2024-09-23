@implementation PXSelectionCoordinatorGetLog

void __PXSelectionCoordinatorGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BE71BC8], "PXSelectionCoordinator");
  v1 = (void *)PXSelectionCoordinatorGetLog_log;
  PXSelectionCoordinatorGetLog_log = (uint64_t)v0;

}

@end

@implementation PLPersistentHistoryGetLog

void __PLPersistentHistoryGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x1E0D710F8], "PersistentHistory");
  v1 = (void *)PLPersistentHistoryGetLog_log;
  PLPersistentHistoryGetLog_log = (uint64_t)v0;

}

@end

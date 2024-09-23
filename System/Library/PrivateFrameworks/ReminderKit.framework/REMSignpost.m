@implementation REMSignpost

+ (OS_os_log)database
{
  if (database_onceToken != -1)
    dispatch_once(&database_onceToken, &__block_literal_global_116);
  return (OS_os_log *)(id)database___log;
}

void __23__REMSignpost_database__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.signpost", "database");
  v1 = (void *)database___log;
  database___log = (uint64_t)v0;

}

+ (OS_os_log)sync
{
  if (sync_onceToken != -1)
    dispatch_once(&sync_onceToken, &__block_literal_global_119);
  return (OS_os_log *)(id)sync___log;
}

void __19__REMSignpost_sync__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.signpost", "sync");
  v1 = (void *)sync___log;
  sync___log = (uint64_t)v0;

}

@end

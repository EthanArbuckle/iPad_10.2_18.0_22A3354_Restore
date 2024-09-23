@implementation REMLogStore

+ (OS_os_log)read
{
  if (read_onceToken != -1)
    dispatch_once(&read_onceToken, &__block_literal_global_133);
  return (OS_os_log *)(id)read___log;
}

+ (OS_os_log)write
{
  if (write_onceToken != -1)
    dispatch_once(&write_onceToken, &__block_literal_global_135);
  return (OS_os_log *)(id)write___log;
}

void __19__REMLogStore_read__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.store", "read");
  v1 = (void *)read___log;
  read___log = (uint64_t)v0;

}

void __18__REMLogStore_xpc__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.store", "xpc");
  v1 = (void *)xpc___log_130;
  xpc___log_130 = (uint64_t)v0;

}

+ (OS_os_log)xpc
{
  if (xpc_onceToken_131 != -1)
    dispatch_once(&xpc_onceToken_131, &__block_literal_global_132);
  return (OS_os_log *)(id)xpc___log_130;
}

+ (OS_os_log)container
{
  if (container_onceToken != -1)
    dispatch_once(&container_onceToken, &__block_literal_global_126);
  return (OS_os_log *)(id)container___log;
}

void __24__REMLogStore_container__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.store", "container");
  v1 = (void *)container___log;
  container___log = (uint64_t)v0;

}

+ (OS_os_log)stagedLightweightCoreDataMigration
{
  if (stagedLightweightCoreDataMigration_onceToken != -1)
    dispatch_once(&stagedLightweightCoreDataMigration_onceToken, &__block_literal_global_128);
  return (OS_os_log *)(id)stagedLightweightCoreDataMigration___log;
}

void __49__REMLogStore_stagedLightweightCoreDataMigration__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.store", "stagedLightweightCoreDataMigration");
  v1 = (void *)stagedLightweightCoreDataMigration___log;
  stagedLightweightCoreDataMigration___log = (uint64_t)v0;

}

void __20__REMLogStore_write__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.store", "write");
  v1 = (void *)write___log;
  write___log = (uint64_t)v0;

}

+ (OS_os_log)search
{
  if (search_onceToken_138 != -1)
    dispatch_once(&search_onceToken_138, &__block_literal_global_139);
  return (OS_os_log *)(id)search___log_137;
}

void __21__REMLogStore_search__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.store", "search");
  v1 = (void *)search___log_137;
  search___log_137 = (uint64_t)v0;

}

+ (OS_os_log)utility
{
  if (utility_onceToken_141 != -1)
    dispatch_once(&utility_onceToken_141, &__block_literal_global_142);
  return (OS_os_log *)(id)utility___log_140;
}

void __22__REMLogStore_utility__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.store", "utility");
  v1 = (void *)utility___log_140;
  utility___log_140 = (uint64_t)v0;

}

+ (OS_os_log)OVERSIZED
{
  if (OVERSIZED_onceToken != -1)
    dispatch_once(&OVERSIZED_onceToken, &__block_literal_global_143);
  return (OS_os_log *)(id)OVERSIZED___log;
}

void __24__REMLogStore_OVERSIZED__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.store", "OVERSIZED");
  v1 = (void *)OVERSIZED___log;
  OVERSIZED___log = (uint64_t)v0;

}

@end

@implementation Log

void __Log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "daemon");
  v1 = (void *)Log_log;
  Log_log = (uint64_t)v0;

}

void __Log_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "helperd-client");
  v1 = (void *)Log_log_0;
  Log_log_0 = (uint64_t)v0;

}

void __Log_block_invoke_1()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "device");
  v1 = (void *)Log_handle;
  Log_handle = (uint64_t)v0;

}

void __Log_block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "daemon-client");
  v1 = (void *)Log_log_1;
  Log_log_1 = (uint64_t)v0;

}

void __Log_block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.seeding", "fbahelperd");
  v1 = (void *)Log_handle_0;
  Log_handle_0 = (uint64_t)v0;

}

@end

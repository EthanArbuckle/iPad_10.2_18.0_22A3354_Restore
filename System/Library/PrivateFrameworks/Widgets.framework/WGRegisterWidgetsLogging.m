@implementation WGRegisterWidgetsLogging

void __WGRegisterWidgetsLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)WGLogSubsystem, "Widgets");
  v1 = (void *)WGLogWidgets;
  WGLogWidgets = (uint64_t)v0;

}

@end

@implementation PKLaunchProvider

- (id)copy_extension_properties_for_pid:(int)a3
{
  return (id)launch_copy_extension_properties_for_pid();
}

- (int)add_external_service:(int)a3 path:(const char *)a4 overlay:(id)a5
{
  return launch_add_external_service();
}

- (void)remove_external_service:(const char *)a3 version:(const char *)a4 targetq:(id)a5 callback:(id)a6
{
  launch_remove_external_service();
}

- (id)copy_extension_properties:(id)a3
{
  return (id)launch_copy_extension_properties();
}

- (id)copy_busy_extension_instances:(const char *)a3 cnt:(unint64_t)a4
{
  return (id)launch_copy_busy_extension_instances();
}

@end

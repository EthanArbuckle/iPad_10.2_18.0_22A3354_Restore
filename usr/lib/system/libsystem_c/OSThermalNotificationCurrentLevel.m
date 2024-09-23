@implementation OSThermalNotificationCurrentLevel

uint64_t __OSThermalNotificationCurrentLevel_block_invoke()
{
  return notify_register_check("com.apple.system.thermalmitigation.thermaltableready", &dword_1EDF543F8);
}

@end

@implementation PASDeviceState

BOOL __67___PASDeviceState_runBlockWhenDeviceIsClassCUnlockedWithQoS_block___block_invoke()
{
  return +[_PASDeviceState isClassCLocked](_PASDeviceState, "isClassCLocked");
}

@end

@implementation PKDeviceUILocked

void __PKDeviceUILocked_block_invoke()
{
  atomic_store(1u, PKDeviceUILocked_dirty);
}

@end

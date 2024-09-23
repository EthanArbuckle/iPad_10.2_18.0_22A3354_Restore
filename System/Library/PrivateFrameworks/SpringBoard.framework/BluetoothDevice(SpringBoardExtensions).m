@implementation BluetoothDevice(SpringBoardExtensions)

- (id)sb_siriBluetoothDeviceSource
{
  return objc_getAssociatedObject(a1, sel_sb_siriBluetoothDeviceSource);
}

- (void)sb_setSiriBluetoothDeviceSource:()SpringBoardExtensions
{
  objc_setAssociatedObject(a1, sel_sb_siriBluetoothDeviceSource, a3, (void *)1);
}

@end

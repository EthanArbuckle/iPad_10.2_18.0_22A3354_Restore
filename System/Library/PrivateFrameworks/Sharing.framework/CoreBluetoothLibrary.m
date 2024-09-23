@implementation CoreBluetoothLibrary

void *__CoreBluetoothLibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreBluetooth.framework/CoreBluetooth", 2);
  CoreBluetoothLibrary_sLib = (uint64_t)result;
  return result;
}

void *__CoreBluetoothLibrary_block_invoke_0()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreBluetooth.framework/CoreBluetooth", 2);
  CoreBluetoothLibrary_sLib_0 = (uint64_t)result;
  return result;
}

@end

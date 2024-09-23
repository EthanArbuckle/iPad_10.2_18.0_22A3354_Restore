@implementation PSGGreenTeaLoggerForBluetoothHardwareAddress

uint64_t __PSGGreenTeaLoggerForBluetoothHardwareAddress_block_invoke()
{
  uint64_t result;

  result = ct_green_tea_logger_create();
  PSGGreenTeaLoggerForBluetoothHardwareAddress_psgBluetoothLogger = result;
  return result;
}

@end

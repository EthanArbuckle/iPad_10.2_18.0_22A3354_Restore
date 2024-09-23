@implementation PSGGreenTeaLoggerForWLANHardwareAddress

uint64_t __PSGGreenTeaLoggerForWLANHardwareAddress_block_invoke()
{
  uint64_t result;

  result = ct_green_tea_logger_create();
  PSGGreenTeaLoggerForWLANHardwareAddress_psgWLANLogger = result;
  return result;
}

@end

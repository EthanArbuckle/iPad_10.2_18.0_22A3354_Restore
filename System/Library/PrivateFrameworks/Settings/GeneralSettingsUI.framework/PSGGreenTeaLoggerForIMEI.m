@implementation PSGGreenTeaLoggerForIMEI

uint64_t __PSGGreenTeaLoggerForIMEI_block_invoke()
{
  uint64_t result;

  result = ct_green_tea_logger_create();
  PSGGreenTeaLoggerForIMEI_psgIMEILogger = result;
  return result;
}

@end

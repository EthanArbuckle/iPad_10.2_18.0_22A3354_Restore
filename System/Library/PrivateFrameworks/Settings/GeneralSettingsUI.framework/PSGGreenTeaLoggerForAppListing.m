@implementation PSGGreenTeaLoggerForAppListing

uint64_t __PSGGreenTeaLoggerForAppListing_block_invoke()
{
  uint64_t result;

  result = ct_green_tea_logger_create();
  PSGGreenTeaLoggerForAppListing_appListLogger = result;
  return result;
}

@end

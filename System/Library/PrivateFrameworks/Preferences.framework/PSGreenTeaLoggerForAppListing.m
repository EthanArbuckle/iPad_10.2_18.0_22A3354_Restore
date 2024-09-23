@implementation PSGreenTeaLoggerForAppListing

uint64_t __PSGreenTeaLoggerForAppListing_block_invoke()
{
  uint64_t result;

  result = ct_green_tea_logger_create();
  PSGreenTeaLoggerForAppListing_appListLogger = result;
  return result;
}

@end

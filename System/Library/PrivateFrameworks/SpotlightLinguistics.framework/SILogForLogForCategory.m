@implementation SILogForLogForCategory

os_log_t ___SILogForLogForCategory_block_invoke()
{
  uint64_t i;
  os_log_t result;

  for (i = 0; i != 21; ++i)
  {
    result = os_log_create("com.apple.spotlightindex", SILogCategoryNames[i]);
    gSILogArray[i] = (uint64_t)result;
  }
  return result;
}

@end

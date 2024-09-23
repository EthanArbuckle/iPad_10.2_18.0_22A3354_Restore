@implementation BYLoggingEnabled

uint64_t ___BYLoggingEnabled_block_invoke()
{
  uint64_t result;
  int out_token;

  out_token = 0;
  notify_register_dispatch("BYLoggingLevelDidChangeNotification", &out_token, MEMORY[0x1E0C80D38], &__block_literal_global_9);
  result = _checkLoggingEnabled();
  _BYLoggingEnabled_shouldLog = result;
  return result;
}

uint64_t ___BYLoggingEnabled_block_invoke_2()
{
  uint64_t result;

  result = _checkLoggingEnabled();
  _BYLoggingEnabled_shouldLog = result;
  return result;
}

@end

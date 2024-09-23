@implementation TICanLogMessageAtLevel

void __TICanLogMessageAtLevel_block_invoke()
{
  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  if (TI_IS_INTERNAL_INSTALL::is_internal_install)
    TICanLogMessageAtLevel_logLevel = CFPreferencesGetAppIntegerValue(CFSTR("kbdLogLevel"), CFSTR("com.apple.keyboard"), 0);
}

@end

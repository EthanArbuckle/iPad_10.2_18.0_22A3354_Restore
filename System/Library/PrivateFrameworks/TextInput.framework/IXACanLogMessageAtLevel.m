@implementation IXACanLogMessageAtLevel

void __IXACanLogMessageAtLevel_block_invoke()
{
  if (IXA_IS_INTERNAL_INSTALL_once_token != -1)
    dispatch_once(&IXA_IS_INTERNAL_INSTALL_once_token, &__block_literal_global_250);
  if (IXA_IS_INTERNAL_INSTALL_is_internal_install)
    IXACanLogMessageAtLevel_logLevel = CFPreferencesGetAppIntegerValue(CFSTR("kbdLogLevel"), CFSTR("com.apple.keyboard"), 0);
}

@end

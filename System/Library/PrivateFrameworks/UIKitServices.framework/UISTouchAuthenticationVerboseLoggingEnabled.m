@implementation UISTouchAuthenticationVerboseLoggingEnabled

void ___UISTouchAuthenticationVerboseLoggingEnabled_block_invoke()
{
  id v0;

  if (os_variant_allows_internal_security_policies())
  {
    v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
    _MergedGlobals_12 = objc_msgSend(v0, "BOOLForKey:", CFSTR("VerboseTouchAuthenticationLogging"));

  }
}

@end

@implementation PKStoreDemoModeEnabled

void __PKStoreDemoModeEnabled_block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;
  Boolean keyExistsAndHasValidFormat;

  v0 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v0)
  {
    v1 = v0;
    keyExistsAndHasValidFormat = 0;
    _MergedGlobals_21 = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), v0, &keyExistsAndHasValidFormat) != 0;
    CFRelease(v1);
    if (!keyExistsAndHasValidFormat)
      _MergedGlobals_21 = 0;
  }
}

@end

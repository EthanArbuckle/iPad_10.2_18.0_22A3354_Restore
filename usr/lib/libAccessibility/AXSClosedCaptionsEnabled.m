@implementation AXSClosedCaptionsEnabled

void ___AXSClosedCaptionsEnabled_block_invoke()
{
  int AppBooleanValue;
  int v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  if (_AXSVideosPreferenceDomain_onceToken != -1)
    dispatch_once(&_AXSVideosPreferenceDomain_onceToken, &__block_literal_global_1073);
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("MovieClosedCaptioningEnabledSetting"), (CFStringRef)_AXSVideosPreferenceDomain_Domain, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v1 = AppBooleanValue;
    if (_AXSVideosPreferenceDomain_onceToken != -1)
      dispatch_once(&_AXSVideosPreferenceDomain_onceToken, &__block_literal_global_1073);
    CFPreferencesSetAppValue(CFSTR("MovieClosedCaptioningEnabledSetting"), 0, (CFStringRef)_AXSVideosPreferenceDomain_Domain);
    _AXSClosedCaptionsSetEnabled(v1);
  }
}

@end

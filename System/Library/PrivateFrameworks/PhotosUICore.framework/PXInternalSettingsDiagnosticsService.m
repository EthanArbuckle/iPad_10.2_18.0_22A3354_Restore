@implementation PXInternalSettingsDiagnosticsService

- (id)title
{
  return CFSTR("Internal Settings");
}

- (BOOL)canPerformAction
{
  void *v2;
  char v3;

  +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableInternalSettingsService");

  return v3;
}

- (void)performAction
{
  Class v2;

  v2 = NSClassFromString(CFSTR("PURootSettings"));
  -[objc_class performSelector:](v2, "performSelector:", NSSelectorFromString(CFSTR("presentSettingsController")));
}

@end

@implementation SUIShareActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return CFSTR("com.apple.UIKit.activity.Share");
}

- (int64_t)_defaultSortGroup
{
  return 2;
}

- (id)_systemImageName
{
  return CFSTR("square.and.arrow.up");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  _ShareSheetBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Share[Activity]"), CFSTR("Share"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (BOOL)ss_shouldExecuteInShareSheet
{
  return 1;
}

- (BOOL)ss_shouldDismissHostsPresentationBeforePerforming
{
  return 0;
}

+ (unint64_t)_xpcAttributes
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 3;
  else
    return 0;
}

@end

@implementation WFConfiguredSystemNothingAction

- (WFConfiguredSystemNothingAction)init
{
  void *v3;
  WFConfiguredSystemNothingAction *v4;
  objc_super v6;

  WFLocalizedString(CFSTR("No Action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)WFConfiguredSystemNothingAction;
  v4 = -[WFConfiguredStaccatoAction initWithIdentifier:associatedBundleIdentifier:name:previewIcon:shortcutsMetadata:](&v6, sel_initWithIdentifier_associatedBundleIdentifier_name_previewIcon_shortcutsMetadata_, CFSTR("WFConfiguredStaccatoNothingAction"), CFSTR("com.apple.springboard"), v3, 0, 0);

  return v4;
}

@end

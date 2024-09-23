@implementation PUITrackerOnboardingCell

- (PUITrackerOnboardingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  void *v7;
  PUITrackerOnboardingCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  PUI_LocalizedStringForAppReport(CFSTR("TRACKER_ACTIVITY_ONBOARDING_TITLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PUITrackerOnboardingCell;
  v8 = -[PUIOnboardingCell initWithStyle:reuseIdentifier:title:](&v15, sel_initWithStyle_reuseIdentifier_title_, a3, v6, v7);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 60.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("shield.lefthalf.filled"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIOnboardingCell setSymbolImage:tintColor:](v8, "setSymbolImage:tintColor:", v10, v11);

    -[PUITrackerOnboardingCell setSeparatorInset:](v8, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
    PUI_LocalizedStringForAppReport(CFSTR("ONBOARDING_PARAGRAPH_1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PUI_LocalizedStringForAppReport(CFSTR("ONBOARDING_PARAGRAPH_1_FOOTER_LINK"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUIOnboardingCell setDetailText:linkText:](v8, "setDetailText:linkText:", v12, v13);

  }
  return v8;
}

@end

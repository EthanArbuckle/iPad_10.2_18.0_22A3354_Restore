@implementation HKRPOnboardingViewControllerFactory

+ (id)onboardingViewControllerWithStyle:(int64_t)a3 settings:(id)a4 onboardingManager:(id)a5 onboardingDelegate:(id)a6
{
  HKRPOnboardingPairViewController *v6;
  id v10;
  id v11;
  id v12;
  HKRPOnboardingPairViewController *v13;
  HKRPOnboardingSettingsViewController *v14;
  uint64_t v15;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  switch(a3)
  {
    case 2:
      v14 = [HKRPOnboardingSettingsViewController alloc];
      v15 = 2;
LABEL_7:
      v13 = -[HKRPOnboardingSettingsViewController initWithStyle:settings:onboardingManager:onboardingDelegate:](v14, "initWithStyle:settings:onboardingManager:onboardingDelegate:", v15, v10, v11, v12);
      goto LABEL_8;
    case 1:
      v14 = [HKRPOnboardingSettingsViewController alloc];
      v15 = 1;
      goto LABEL_7;
    case 0:
      v13 = -[HKRPOnboardingPairViewController initWithSettings:onboardingManager:]([HKRPOnboardingPairViewController alloc], "initWithSettings:onboardingManager:", v10, v11);
LABEL_8:
      v6 = v13;
      break;
  }

  return v6;
}

@end

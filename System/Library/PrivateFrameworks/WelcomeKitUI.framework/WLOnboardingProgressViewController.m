@implementation WLOnboardingProgressViewController

- (void)viewDidLoad
{
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLOnboardingProgressViewController;
  -[OBSetupAssistantProgressController viewDidLoad](&v5, sel_viewDidLoad);
  -[WLOnboardingProgressViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setTitleHyphenationFactor:", v4);

}

@end

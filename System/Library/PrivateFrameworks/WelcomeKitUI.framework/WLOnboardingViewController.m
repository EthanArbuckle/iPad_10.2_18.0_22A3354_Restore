@implementation WLOnboardingViewController

- (void)viewDidLoad
{
  void *v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLOnboardingViewController;
  -[OBBaseWelcomeController viewDidLoad](&v5, sel_viewDidLoad);
  -[WLOnboardingViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = 0;
  objc_msgSend(v3, "setTitleHyphenationFactor:", v4);

}

@end

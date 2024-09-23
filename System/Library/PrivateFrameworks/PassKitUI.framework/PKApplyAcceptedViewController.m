@implementation PKApplyAcceptedViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKApplyAcceptedViewController;
  -[PKApplyExplanationViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[PKExplanationViewController setShowDoneButton:](self, "setShowDoneButton:", 1);
  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "applicationType") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    PKFeatureApplicationHeaderImageWithImage(objc_msgSend(v3, "featureIdentifier"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKExplanationViewController explanationView](self, "explanationView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v4);
    objc_msgSend(v5, "setTopMargin:", 30.0);

  }
}

- (void)handleNextStep
{
  void *v3;
  objc_super v4;

  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endApplyFlow");

  v4.receiver = self;
  v4.super_class = (Class)PKApplyAcceptedViewController;
  -[PKApplyExplanationViewController handleNextStep](&v4, sel_handleNextStep);
}

@end

@implementation PKApplyGenericErrorViewController

- (void)handleNextStep
{
  void *v3;
  objc_super v4;

  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endApplyFlow");

  v4.receiver = self;
  v4.super_class = (Class)PKApplyGenericErrorViewController;
  -[PKApplyExplanationViewController handleNextStep](&v4, sel_handleNextStep);
}

@end

@implementation PKApplyStateExplanationViewController

- (void)handleNextStep
{
  void *v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  -[PKApplyExplanationViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "applicationStateReason");

  if (v5 - 5 < 0xC || v5 <= 3)
    objc_msgSend(v3, "endApplyFlow");
  v7.receiver = self;
  v7.super_class = (Class)PKApplyStateExplanationViewController;
  -[PKApplyExplanationViewController handleNextStep](&v7, sel_handleNextStep);

}

@end

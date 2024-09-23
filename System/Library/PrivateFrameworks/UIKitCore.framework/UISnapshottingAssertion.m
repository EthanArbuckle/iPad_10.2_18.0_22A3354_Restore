@implementation UISnapshottingAssertion

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[UISnapshottingAssertionManager sharedInstance](UISnapshottingAssertionManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relinquishAssertion:", self);

  v4.receiver = self;
  v4.super_class = (Class)UISnapshottingAssertion;
  -[UISnapshottingAssertion dealloc](&v4, sel_dealloc);
}

@end

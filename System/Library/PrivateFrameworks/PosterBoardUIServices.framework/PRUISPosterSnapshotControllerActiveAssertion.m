@implementation PRUISPosterSnapshotControllerActiveAssertion

- (void)dealloc
{
  objc_super v3;

  -[BSSimpleAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRUISPosterSnapshotControllerActiveAssertion;
  -[BSSimpleAssertion dealloc](&v3, sel_dealloc);
}

@end

@implementation _PBFSafeAssertion

- (void)dealloc
{
  objc_super v3;

  -[BSSimpleAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_PBFSafeAssertion;
  -[BSSimpleAssertion dealloc](&v3, sel_dealloc);
}

@end

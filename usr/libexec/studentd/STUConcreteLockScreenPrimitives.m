@implementation STUConcreteLockScreenPrimitives

- (void)lockStateStatusProviderWithCompletion:(id)a3
{
  void (**v3)(id, STUConcreteLockStateStatusProvider *);
  STUConcreteLockStateStatusProvider *v4;

  v3 = (void (**)(id, STUConcreteLockStateStatusProvider *))a3;
  v4 = objc_opt_new(STUConcreteLockStateStatusProvider);
  v3[2](v3, v4);

}

@end

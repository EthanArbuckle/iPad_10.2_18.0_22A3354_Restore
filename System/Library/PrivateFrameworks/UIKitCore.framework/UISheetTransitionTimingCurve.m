@implementation UISheetTransitionTimingCurve

void ___UISheetTransitionTimingCurve_block_invoke()
{
  UISpringTimingParameters *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [UISpringTimingParameters alloc];
  _UISheetTransitionSpringParametersHighSpeed(0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[UISpringTimingParameters initWithParameters:initialVelocity:](v0, "initWithParameters:initialVelocity:", v3, 0.0, 0.0);
  v2 = (void *)_MergedGlobals_999;
  _MergedGlobals_999 = v1;

}

@end

@implementation UIInterpolatedScaledFloat

+ (id)epsilonCompatibleWithVector:(id)a3
{
  if (qword_1ECD82388 != -1)
    dispatch_once(&qword_1ECD82388, &__block_literal_global_640);
  return (id)_MergedGlobals_1315;
}

void __57__UIInterpolatedScaledFloat_epsilonCompatibleWithVector___block_invoke()
{
  double v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  +[UIInterpolatedFloat valueWithFloat:](UIInterpolatedScaledFloat, "valueWithFloat:", 1.0 / v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_MergedGlobals_1315;
  _MergedGlobals_1315 = v1;

}

@end

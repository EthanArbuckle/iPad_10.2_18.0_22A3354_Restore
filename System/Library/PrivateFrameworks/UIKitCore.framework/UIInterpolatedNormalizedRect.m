@implementation UIInterpolatedNormalizedRect

+ (id)epsilonCompatibleWithVector:(id)a3
{
  if (qword_1ECD82338 != -1)
    dispatch_once(&qword_1ECD82338, &__block_literal_global_637);
  return (id)_MergedGlobals_1312;
}

void __60__UIInterpolatedNormalizedRect_epsilonCompatibleWithVector___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[UIInterpolatedRect valueWithCGRect:](UIInterpolatedNormalizedRect, "valueWithCGRect:", 0.001, 0.001, 0.001, 0.001);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1312;
  _MergedGlobals_1312 = v0;

}

@end

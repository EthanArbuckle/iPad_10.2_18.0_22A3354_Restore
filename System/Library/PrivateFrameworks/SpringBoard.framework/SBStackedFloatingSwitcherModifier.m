@implementation SBStackedFloatingSwitcherModifier

- (double)scaleForIndex:(unint64_t)a3
{
  double result;

  BSUIConstrainValueToIntervalWithRubberBand();
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double result;

  v5 = a4;
  -[SBStackedFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  result = dbl_1D0E8A210[v7 == 1];
  if (!v7)
    return 0.0;
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double result;

  result = 0.0;
  if (!a4)
    return 1.0;
  return result;
}

@end

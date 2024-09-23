@implementation NavDrivingSignLayoutCompactWidth

+ (id)sharedDrivingCompactWidthSignLayout
{
  if (qword_1014D4208 != -1)
    dispatch_once(&qword_1014D4208, &stru_1011E71D0);
  return (id)qword_1014D4200;
}

- (double)textTopMarginForSign:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  if (-[NavDrivingSignLayout _shouldShowLaneGuidanceForSign:](self, "_shouldShowLaneGuidanceForSign:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryDrivingSign"));
    -[NavDrivingSignLayout laneGuidanceViewInternalEdgeInsetsForSign:](self, "laneGuidanceViewInternalEdgeInsetsForSign:", v5);
    v7 = v6 + 100.0;

  }
  else
  {
    v7 = 42.0;
  }

  return v7;
}

- (double)textBottomMarginForSign:(id)a3
{
  unsigned int v3;
  double result;

  v3 = -[NavDrivingSignLayout _shouldShowLaneGuidanceForSign:](self, "_shouldShowLaneGuidanceForSign:", a3);
  result = 22.0;
  if (v3)
    return 20.0;
  return result;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  unsigned int v3;
  double result;

  v3 = -[NavDrivingSignLayout _shouldShowLaneGuidanceForSign:](self, "_shouldShowLaneGuidanceForSign:", a3);
  result = 32.0;
  if (v3)
    return 34.0;
  return result;
}

- (double)navSignView:(id)a3 alternateFontLineSpacingForMajorText:(BOOL)a4
{
  double result;
  objc_super v5;

  result = 27.0;
  if (a4)
  {
    v5.receiver = self;
    v5.super_class = (Class)NavDrivingSignLayoutCompactWidth;
    -[NavSignLayoutBase navSignView:alternateFontLineSpacingForMajorText:](&v5, "navSignView:alternateFontLineSpacingForMajorText:", a3, 1, 27.0);
  }
  return result;
}

- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4
{
  const UIFontWeight *v4;

  v4 = &UIFontWeightHeavy;
  if (!a4)
    v4 = &UIFontWeightMedium;
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, 27.0, *v4);
}

- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4
{
  double v4;
  const UIFontWeight *v5;

  v4 = 25.0;
  if (a4)
    v4 = 27.0;
  v5 = &UIFontWeightHeavy;
  if (!a4)
    v5 = &UIFontWeightMedium;
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, v4, *v5));
}

- (int64_t)navSignView:(id)a3 inlineShieldSizeForMajorText:(BOOL)a4
{
  return 5;
}

- (double)maneuverViewTopMarginForSign:(id)a3
{
  return 17.5;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  if (-[NavDrivingSignLayout _shouldShowLaneGuidanceForSign:](self, "_shouldShowLaneGuidanceForSign:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryDrivingSign"));
    -[NavDrivingSignLayout laneGuidanceViewInternalEdgeInsetsForSign:](self, "laneGuidanceViewInternalEdgeInsetsForSign:", v5);
    v7 = v6 + 75.5;

  }
  else
  {
    v7 = 17.5;
  }

  return v7;
}

- (double)laneGuidanceViewVerticalScaleForSign:(id)a3
{
  return 0.850000024;
}

- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4
{
  return 0;
}

@end

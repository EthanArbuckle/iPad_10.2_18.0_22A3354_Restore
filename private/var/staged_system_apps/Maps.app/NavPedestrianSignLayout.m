@implementation NavPedestrianSignLayout

+ (id)sharedPedestrianSignLayout
{
  if (qword_1014D4198 != -1)
    dispatch_once(&qword_1014D4198, &stru_1011E70F0);
  return (id)qword_1014D4190;
}

- (int64_t)navSignView:(id)a3 maxNumberOfLinesWithLongestAlternativeForMajorText:(BOOL)a4
{
  return 1;
}

- (double)textTopMarginForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  -[NavManeverSignLayoutBase textTopMarginForSign:](&v5, "textTopMarginForSign:", a3);
  return v3 * 0.800000012;
}

- (double)textBottomMarginForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  -[NavManeverSignLayoutBase textBottomMarginForSign:](&v5, "textBottomMarginForSign:", a3);
  return v3 * 0.800000012;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  -[NavManeverSignLayoutBase baselineMarginBetweenLabelsForSign:](&v5, "baselineMarginBetweenLabelsForSign:", a3);
  return v3 * 0.800000012;
}

- (double)labelBaselineToInlineShieldTopForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  -[NavSignLayoutBase labelBaselineToInlineShieldTopForSign:](&v5, "labelBaselineToInlineShieldTopForSign:", a3);
  return v3 * 0.800000012;
}

- (id)navSignView:(id)a3 preferredFontForMajorText:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NavPedestrianSignLayout;
  v4 = -[NavManeverSignLayoutBase navSignView:preferredFontForMajorText:](&v11, "navSignView:preferredFontForMajorText:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptor"));
    objc_msgSend(v6, "pointSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, v8 * 0.829999983));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)navSignView:(id)a3 alternateFontForMajorText:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NavPedestrianSignLayout;
  v4 = -[NavManeverSignLayoutBase navSignView:alternateFontForMajorText:](&v11, "navSignView:alternateFontForMajorText:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fontDescriptor"));
    objc_msgSend(v6, "pointSize");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, v8 * 0.829999983));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)navSignView:(id)a3 alternateFontLineSpacingForMajorText:(BOOL)a4
{
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavPedestrianSignLayout;
  -[NavSignLayoutBase navSignView:alternateFontLineSpacingForMajorText:](&v6, "navSignView:alternateFontLineSpacingForMajorText:", a3, a4);
  return v4 * 0.800000012;
}

- (CGSize)maneuverViewSizeForSign:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)NavPedestrianSignLayout;
  -[NavManeverSignLayoutBase maneuverViewSizeForSign:](&v7, "maneuverViewSizeForSign:", a3);
  v4 = v3 * 0.800000012;
  v6 = v5 * 0.800000012;
  result.height = v6;
  result.width = v4;
  return result;
}

- (double)maneuverViewTopMarginForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  -[NavManeverSignLayoutBase maneuverViewTopMarginForSign:](&v5, "maneuverViewTopMarginForSign:", a3);
  return v3 * 0.800000012;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavPedestrianSignLayout;
  -[NavManeverSignLayoutBase shieldViewTopMarginForSign:](&v5, "shieldViewTopMarginForSign:", a3);
  return v3 * 0.800000012;
}

- (BOOL)forceHideShieldViewForSign:(id)a3
{
  return 1;
}

@end

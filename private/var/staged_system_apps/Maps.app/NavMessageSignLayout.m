@implementation NavMessageSignLayout

+ (id)sharedMessageSignLayout
{
  if (qword_1014D4178 != -1)
    dispatch_once(&qword_1014D4178, &stru_1011E70B0);
  return (id)qword_1014D4170;
}

- (double)navSignView:(id)a3 textLeadingMarginForMajorText:(BOOL)a4
{
  double result;
  objc_super v5;

  result = 15.0;
  if (!a4)
  {
    v5.receiver = self;
    v5.super_class = (Class)NavMessageSignLayout;
    -[NavSignLayoutBase navSignView:textLeadingMarginForMajorText:](&v5, "navSignView:textLeadingMarginForMajorText:", a3, 0, 15.0);
  }
  return result;
}

- (double)textTopMarginForSign:(id)a3
{
  unsigned int v3;
  double result;

  v3 = objc_msgSend(a3, "hasOnlySingleLineText");
  result = 41.0;
  if (v3)
    return 50.0;
  return result;
}

- (double)textBottomMarginForSign:(id)a3
{
  unsigned int v3;
  double result;

  v3 = objc_msgSend(a3, "hasOnlySingleLineText");
  result = 23.0;
  if (v3)
    return 30.0;
  return result;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  return 32.0;
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

  v4 = 24.0;
  if (a4)
    v4 = 27.0;
  v5 = &UIFontWeightHeavy;
  if (!a4)
    v5 = &UIFontWeightMedium;
  return (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, v4, *v5));
}

- (double)navSignView:(id)a3 alternateFontLineSpacingForMajorText:(BOOL)a4
{
  double result;

  result = 32.0;
  if (!a4)
    return 27.0;
  return result;
}

- (BOOL)shouldAlignMinorToMajorLabelLeadingForSign:(id)a3
{
  return 0;
}

- (BOOL)navSignView:(id)a3 shouldAlignToLeadingForMajorText:(BOOL)a4
{
  if (a4)
    return 0;
  else
    return objc_msgSend(a3, "hasMinorText");
}

- (BOOL)navSignView:(id)a3 shouldAlignToTrailingForMajorText:(BOOL)a4
{
  if (a4)
    return 0;
  else
    return objc_msgSend(a3, "hasMinorText");
}

- (int64_t)navSignView:(id)a3 textAlignmentForMajorText:(BOOL)a4
{
  if (a4)
    return 4;
  else
    return 1;
}

@end

@implementation NavDrivingSignLayoutMinimized

+ (id)sharedDrivingMinimizedSignLayout
{
  if (qword_1014D41E8 != -1)
    dispatch_once(&qword_1014D41E8, &stru_1011E7190);
  return (id)qword_1014D41E0;
}

- (int64_t)navSignView:(id)a3 maxNumberOfTotalLinesForMajorText:(BOOL)a4
{
  return 0;
}

- (double)textTopMarginForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  -[NavDrivingSignLayout textTopMarginForSign:](&v5, "textTopMarginForSign:", a3);
  return v3 * 0.800000012;
}

- (double)textBottomMarginForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  -[NavDrivingSignLayout textBottomMarginForSign:](&v5, "textBottomMarginForSign:", a3);
  return v3 * 0.800000012;
}

- (double)baselineMarginBetweenLabelsForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  -[NavManeverSignLayoutBase baselineMarginBetweenLabelsForSign:](&v5, "baselineMarginBetweenLabelsForSign:", a3);
  return v3 * 0.800000012;
}

- (double)labelBaselineToInlineShieldTopForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  -[NavSignLayoutBase labelBaselineToInlineShieldTopForSign:](&v5, "labelBaselineToInlineShieldTopForSign:", a3);
  return v3 * 0.800000012;
}

- (double)navSignView:(id)a3 textLeadingMarginForMajorText:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NavDrivingSignLayoutMinimized;
  v5 = a3;
  -[NavSignLayoutBase navSignView:textLeadingMarginForMajorText:](&v15, "navSignView:textLeadingMarginForMajorText:", v5, v4);
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "maneuverSign", v15.receiver, v15.super_class));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "maneuverView"));
  v10 = objc_msgSend(v9, "isHidden");
  v11 = 0.0;
  if ((v10 & 1) == 0)
  {
    objc_msgSend(v9, "intrinsicContentSize", 0.0);
    v11 = v12 * 0.199999988;
  }
  v13 = v7 - v11;

  return v13;
}

- (CGAffineTransform)navSignView:(SEL)a3 transformForSubview:(id)a4
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  __int128 v15;
  CGAffineTransform *result;
  id v17;

  v17 = a4;
  v8 = a5;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "majorLabel"));
  if ((id)v9 == v8)
  {

  }
  else
  {
    v10 = (void *)v9;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "minorLabel"));

    if (v11 != v8)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "maneuverSign"));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "maneuverView"));

      if (v13 == v8)
      {
        if ((id)-[NavManeverSignLayoutBase maneuverViewPositionForSign:](self, "maneuverViewPositionForSign:", v12) == (id)2)
        {
          if (v8)
          {
            objc_msgSend(v8, "_maps_transformScaledToTopAndLeadingAtScale:", 0.800000012);
            goto LABEL_18;
          }
        }
        else if (v8)
        {
          objc_msgSend(v8, "_maps_transformScaledToLeadingAtScale:", 0.800000012);
          goto LABEL_18;
        }
      }
      else
      {
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "shieldView"));

        if (v14 != v8)
        {
          v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
          *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
          *(_OWORD *)&retstr->c = v15;
          *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
LABEL_18:

          goto LABEL_19;
        }
        if (v8)
        {
          objc_msgSend(v8, "_maps_transformScaledToTopAndTrailingAtScale:", 0.899999976);
          goto LABEL_18;
        }
      }
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
      goto LABEL_18;
    }
  }
  if (v8)
  {
    objc_msgSend(v8, "_maps_transformScaledToLeadingAtScale:", 0.829999983);
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
LABEL_19:

  return result;
}

- (double)maneuverViewTopMarginForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  -[NavManeverSignLayoutBase maneuverViewTopMarginForSign:](&v5, "maneuverViewTopMarginForSign:", a3);
  return v3 * 0.800000012;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  -[NavDrivingSignLayout shieldViewTopMarginForSign:](&v5, "shieldViewTopMarginForSign:", a3);
  return v3 * 0.800000012;
}

- (double)laneGuidanceViewTopMarginForSign:(id)a3
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NavDrivingSignLayoutMinimized;
  -[NavDrivingSignLayout laneGuidanceViewTopMarginForSign:](&v5, "laneGuidanceViewTopMarginForSign:", a3);
  return v3 * 0.800000012;
}

- (double)laneGuidanceViewVerticalScaleForSign:(id)a3
{
  return 0.800000012;
}

- (BOOL)shouldTransformLaneViewsForSign:(id)a3
{
  return 1;
}

- (UIEdgeInsets)laneGuidanceViewInternalEdgeInsetsForSign:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  UIEdgeInsets result;

  v9.receiver = self;
  v9.super_class = (Class)NavDrivingSignLayoutMinimized;
  -[NavDrivingSignLayout laneGuidanceViewInternalEdgeInsetsForSign:](&v9, "laneGuidanceViewInternalEdgeInsetsForSign:", a3);
  v6 = v5 * 0.800000012;
  v8 = v7 * 0.800000012;
  result.right = v4;
  result.bottom = v8;
  result.left = v3;
  result.top = v6;
  return result;
}

@end

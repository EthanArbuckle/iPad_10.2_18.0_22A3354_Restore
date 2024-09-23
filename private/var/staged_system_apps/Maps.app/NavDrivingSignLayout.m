@implementation NavDrivingSignLayout

+ (id)sharedDrivingSignLayout
{
  if (qword_1014D41B8 != -1)
    dispatch_once(&qword_1014D41B8, &stru_1011E7130);
  return (id)qword_1014D41B0;
}

- (BOOL)_shouldShowLaneGuidanceForSign:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "primaryDrivingSign"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laneGuidanceInfo"));
  if (v5)
    v6 = !-[NavDrivingSignLayout forceHideLaneGuidanceViewForSign:](self, "forceHideLaneGuidanceViewForSign:", v4);
  else
    LOBYTE(v6) = 0;

  return v6;
}

- (double)textTopMarginForSign:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  if (-[NavDrivingSignLayout _shouldShowLaneGuidanceForSign:](self, "_shouldShowLaneGuidanceForSign:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryDrivingSign"));

    -[NavDrivingSignLayout laneGuidanceViewInternalEdgeInsetsForSign:](self, "laneGuidanceViewInternalEdgeInsetsForSign:", v5);
    v7 = v6 + 108.0;

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NavDrivingSignLayout;
    -[NavManeverSignLayoutBase textTopMarginForSign:](&v10, "textTopMarginForSign:", v4);
    v7 = v8;

  }
  return v7;
}

- (double)textBottomMarginForSign:(id)a3
{
  id v4;
  double v5;
  void *v6;
  id v7;
  double v8;
  objc_super v10;

  v4 = a3;
  v5 = 22.0;
  if (!-[NavDrivingSignLayout _shouldShowLaneGuidanceForSign:](self, "_shouldShowLaneGuidanceForSign:", v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "maneuverSign"));
    v7 = objc_msgSend(v6, "maneuverSignType");

    if (v7)
    {
      v10.receiver = self;
      v10.super_class = (Class)NavDrivingSignLayout;
      -[NavManeverSignLayoutBase textBottomMarginForSign:](&v10, "textBottomMarginForSign:", v4);
      v5 = v8;
    }
    else
    {
      v5 = 27.0;
    }
  }

  return v5;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v4 = a3;
  if (-[NavDrivingSignLayout _shouldShowLaneGuidanceForSign:](self, "_shouldShowLaneGuidanceForSign:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryDrivingSign"));

    -[NavDrivingSignLayout laneGuidanceViewInternalEdgeInsetsForSign:](self, "laneGuidanceViewInternalEdgeInsetsForSign:", v5);
    v7 = v6 + 82.5;

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NavDrivingSignLayout;
    -[NavManeverSignLayoutBase shieldViewTopMarginForSign:](&v10, "shieldViewTopMarginForSign:", v4);
    v7 = v8;

  }
  return v7;
}

- (BOOL)forceHideShieldViewForSign:(id)a3
{
  id v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "usePersistentDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryDrivingSign"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "laneGuidanceInfo"));
  if (objc_msgSend(v7, "isForMidStep")
    && !-[NavDrivingSignLayout forceHideLaneGuidanceViewForSign:](self, "forceHideLaneGuidanceViewForSign:", v6))
  {

    if ((v5 & 1) == 0)
    {
      v8 = 1;
      goto LABEL_5;
    }
  }
  else
  {

  }
  v10.receiver = self;
  v10.super_class = (Class)NavDrivingSignLayout;
  v8 = -[NavManeverSignLayoutBase forceHideShieldViewForSign:](&v10, "forceHideShieldViewForSign:", v4);
LABEL_5:

  return v8;
}

- (BOOL)forceHideLaneGuidanceViewForSign:(id)a3
{
  return objc_msgSend(a3, "highlightedLanesNotInVisibleRange");
}

- (double)laneGuidanceViewTopMarginForSign:(id)a3
{
  return 0.0;
}

- (double)laneGuidanceViewSideMarginForSign:(id)a3
{
  return 0.0;
}

- (double)laneGuidanceViewVerticalScaleForSign:(id)a3
{
  return 1.0;
}

- (BOOL)shouldTransformLaneViewsForSign:(id)a3
{
  return 0;
}

- (UIEdgeInsets)laneGuidanceViewInternalEdgeInsetsForSign:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = 15.0;
  v4 = 10.0;
  v5 = 0.0;
  v6 = 10.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

@end

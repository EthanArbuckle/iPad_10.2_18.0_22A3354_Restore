@implementation _UISheetPresentationMetrics

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISheetPresentationMetrics;
  return -[_UISheetPresentationMetrics init](&v3, sel_init);
}

+ (id)_defaultMetrics
{
  if (qword_1ECD79B48 != -1)
    dispatch_once(&qword_1ECD79B48, &__block_literal_global_438);
  return (id)_MergedGlobals_13_5;
}

- (CGSize)defaultFormSheetSizeForScreenSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  char v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_wantsWideContentMargins");

  if ((v6 & 1) != 0)
  {
    v7 = 394.0;
    v8 = 414.0;
  }
  else
  {
    v9 = fmax(width, height);
    if (v9 >= 1590.0)
    {
      v7 = 680.0;
      v8 = 620.0;
    }
    else if (v9 <= 1024.0)
    {
      v7 = 600.0;
      v8 = 540.0;
    }
    else
    {
      v7 = 640.0;
      v8 = 580.0;
    }
  }
  result.height = v7;
  result.width = v8;
  return result;
}

- (BOOL)exclusivelyUsesZPositionForTransform
{
  return 0;
}

- (BOOL)wantsDimming
{
  return 1;
}

- (double)cornerRadius
{
  return 10.0;
}

- (BOOL)fadeOutIfAnyDescendantWantsFullScreen
{
  return 0;
}

- (BOOL)shouldScaleDownBehindDescendantsForContainer:(id)a3 withBounds:(CGRect)a4
{
  double height;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;

  height = a4.size.height;
  objc_msgSend(a3, "window", a4.origin.x, a4.origin.y, a4.size.width);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = height == v7;

  return v8;
}

- (BOOL)alwaysStacksWithChild
{
  return 0;
}

- (double)maximumSheetDepthLevel
{
  return 2.0;
}

- (double)topOffset
{
  return 10.0;
}

- (double)minimumSidePadding
{
  return 25.0;
}

- (double)topOffsetInCompactHeight
{
  return 8.0;
}

- (int64_t)defaultMode
{
  return dyld_program_sdk_at_least();
}

- (BOOL)supportsEdgeAttachedForTraitCollection:(id)a3
{
  return objc_msgSend(a3, "userInterfaceIdiom") != 6;
}

- (double)transitionDuration
{
  double result;

  +[UITransitionView defaultDurationForTransition:](UITransitionView, "defaultDurationForTransition:", 8);
  return result;
}

- (id)transitionSpringParametersHighSpeed:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = a3;
  if (qword_1ECD79B60 != -1)
    dispatch_once(&qword_1ECD79B60, &__block_literal_global_2_13);
  v4 = 2;
  if (v3)
    v4 = 3;
  return (id)_MergedGlobals_13_5[v4];
}

- (CGSize)formSheetSizeForViewController:(id)a3 windowSize:(CGSize)a4 screenSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v10 = a3;
  objc_msgSend(v10, "preferredContentSize");
  v12 = v11;
  v14 = v13;
  -[_UISheetPresentationMetrics defaultFormSheetSizeForScreenSize:](self, "defaultFormSheetSizeForScreenSize:", width, height);
  v17 = v15;
  v18 = v16;
  if (v12 <= 0.0 || v14 <= 0.0)
  {
    if (v15 <= 0.0
      || v16 <= 0.0
      || (_UISheetPresentationControllerStylesSheetsAsCards(v10) & 1) == 0 && (v17 >= v8 || v18 >= v7))
    {
      v17 = v8;
      v18 = v7;
    }
  }
  else
  {
    v17 = v12;
    v18 = v14;
  }

  v19 = v17;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (double)preferredShadowOpacity
{
  return 0.5;
}

- (double)shadowRadius
{
  return 2.0;
}

@end

@implementation SBDockIconListView

- (BOOL)adaptsOrientationToTraitCollection
{
  return 0;
}

+ (double)defaultHeight
{
  return 92.0;
}

+ (unint64_t)defaultIconViewConfigurationOptions
{
  return 2;
}

+ (CGRect)defaultFrameForOrientation:(int64_t)a3
{
  CGFloat Width;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect result;

  SBHScreenBounds(a3);
  Width = CGRectGetWidth(v9);
  objc_msgSend((id)objc_opt_class(), "defaultHeight");
  v5 = v4;
  v6 = 0.0;
  v7 = 0.0;
  v8 = Width;
  result.size.height = v5;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (SBDockIconListView)initWithModel:(id)a3 layoutProvider:(id)a4 iconLocation:(id)a5 orientation:(int64_t)a6 iconViewProvider:(id)a7
{
  SBDockIconListView *v7;
  SBDockIconListView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBDockIconListView;
  v7 = -[SBIconListView initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:](&v10, sel_initWithModel_layoutProvider_iconLocation_orientation_iconViewProvider_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
    -[SBDockIconListView setAutoresizesSubviews:](v7, "setAutoresizesSubviews:", 0);
  return v8;
}

- (BOOL)allowsAddingIconCount:(unint64_t)a3
{
  void *v4;

  -[SBIconListView displayedModel](self, "displayedModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "allowsAddingIconCount:", a3);

  return a3;
}

- (BOOL)isVertical
{
  return -[SBIconListView iconRowsForCurrentOrientation](self, "iconRowsForCurrentOrientation") > 1;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBDockIconListView;
  if (-[SBDockIconListView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("contents"));

  return v5;
}

@end

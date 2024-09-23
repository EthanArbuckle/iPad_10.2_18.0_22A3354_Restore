@implementation SBHWidgetSearchBarBackgroundView

- (SBHWidgetSearchBarBackgroundView)initWithAddWidgetSheetStyle:(unint64_t)a3
{
  SBHWidgetSearchBarBackgroundView *v4;
  SBHWidgetSearchBarBackgroundView *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHWidgetSearchBarBackgroundView;
  v4 = -[SBHWidgetSearchBarBackgroundView init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = 15.0;
    if (a3 == 1)
      v6 = 9.0;
    -[SBHWidgetSearchBarBackgroundView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", v6);
  }
  return v5;
}

@end

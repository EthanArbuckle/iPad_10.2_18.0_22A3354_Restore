@implementation RouteStepListSectionBackgroundView

+ (id)decorationViewKind
{
  return CFSTR("RouteStepListSectionBackgroundView");
}

- (RouteStepListSectionBackgroundView)initWithFrame:(CGRect)a3
{
  RouteStepListSectionBackgroundView *v3;
  RouteStepListSectionBackgroundView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RouteStepListSectionBackgroundView;
  v3 = -[RouteStepListSectionBackgroundView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RouteStepListSectionBackgroundView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 10.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("RoutePlanningPlatterBackground")));
    -[RouteStepListSectionBackgroundView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

@end

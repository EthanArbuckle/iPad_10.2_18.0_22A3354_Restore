@implementation RoutePlanningOptionsCellBackgroundView

- (RoutePlanningOptionsCellBackgroundView)initWithFrame:(CGRect)a3 color:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  RoutePlanningOptionsCellBackgroundView *v10;
  RoutePlanningOptionsCellBackgroundView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RoutePlanningOptionsCellBackgroundView;
  v10 = -[RoutePlanningOptionsCellBackgroundView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
    -[RoutePlanningOptionsCellBackgroundView setBackgroundColor:](v10, "setBackgroundColor:", v9);

  return v11;
}

@end

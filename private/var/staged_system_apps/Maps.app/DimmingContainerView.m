@implementation DimmingContainerView

- (DimmingContainerView)initWithFrame:(CGRect)a3
{
  DimmingContainerView *v3;
  DimmingContainerView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DimmingContainerView;
  v3 = -[DimmingContainerView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[DimmingContainerView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.400000006));
    -[DimmingContainerView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  }
  return v4;
}

@end

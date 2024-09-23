@implementation RAPSeparatorBar

- (RAPSeparatorBar)init
{
  RAPSeparatorBar *v2;
  RAPSeparatorBar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPSeparatorBar;
  v2 = -[RAPSeparatorBar init](&v5, "init");
  v3 = v2;
  if (v2)
    -[RAPSeparatorBar _updateBackgroundColor](v2, "_updateBackgroundColor");
  return v3;
}

- (void)_updateBackgroundColor
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPSeparatorBar traitCollection](self, "traitCollection"));
  if (objc_msgSend(v5, "userInterfaceStyle") == (id)1)
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor tableSeparatorDarkColor](UIColor, "tableSeparatorDarkColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor tableSeparatorLightColor](UIColor, "tableSeparatorLightColor"));
  v4 = (void *)v3;
  -[RAPSeparatorBar setBackgroundColor:](self, "setBackgroundColor:", v3);

}

+ (double)thickness
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3;

  return v4;
}

@end

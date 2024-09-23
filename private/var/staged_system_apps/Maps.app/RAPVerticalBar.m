@implementation RAPVerticalBar

- (RAPVerticalBar)init
{
  RAPVerticalBar *v2;
  CAGradientLayer *v3;
  CAGradientLayer *gradientLayer;
  void *v5;
  id v6;
  id v7;
  void *v8;
  objc_super v10;
  _QWORD v11[2];

  v10.receiver = self;
  v10.super_class = (Class)RAPVerticalBar;
  v2 = -[RAPVerticalBar init](&v10, "init");
  if (v2)
  {
    v3 = (CAGradientLayer *)objc_alloc_init((Class)CAGradientLayer);
    gradientLayer = v2->_gradientLayer;
    v2->_gradientLayer = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPVerticalBar layer](v2, "layer"));
    objc_msgSend(v5, "addSublayer:", v2->_gradientLayer);

    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    v11[0] = objc_msgSend(v6, "CGColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor tableSeparatorDarkColor](UIColor, "tableSeparatorDarkColor")));
    v11[1] = objc_msgSend(v7, "CGColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    -[CAGradientLayer setColors:](v2->_gradientLayer, "setColors:", v8);

  }
  return v2;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPVerticalBar;
  -[RAPVerticalBar layoutSubviews](&v3, "layoutSubviews");
  -[RAPVerticalBar bounds](self, "bounds");
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end

@implementation _TabGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAGradientLayer);
}

- (_TabGradientView)initWithFrame:(CGRect)a3
{
  _TabGradientView *v3;
  _TabGradientView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TabGradientView;
  v3 = -[_TabGradientView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_TabGradientView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("startPoint")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("endPoint")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_TabGradientView;
    v5 = -[_TabGradientView _shouldAnimatePropertyWithKey:](&v7, "_shouldAnimatePropertyWithKey:", v4);
  }

  return v5;
}

@end

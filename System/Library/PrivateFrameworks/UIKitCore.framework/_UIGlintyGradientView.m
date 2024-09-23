@implementation _UIGlintyGradientView

- (_UIGlintyGradientView)initWithFrame:(CGRect)a3
{
  _UIGlintyGradientView *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _UIGlintyGradientView *v11;
  objc_super v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)_UIGlintyGradientView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.05, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.95, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIGlintyGradientView gradientLayer](v3, "gradientLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_retainAutorelease(v4);
    v14[0] = objc_msgSend(v7, "CGColor");
    v8 = objc_retainAutorelease(v5);
    v14[1] = objc_msgSend(v8, "CGColor");
    v9 = objc_retainAutorelease(v7);
    v14[2] = objc_msgSend(v9, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setColors:", v10);

    objc_msgSend(v6, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v6, "setEndPoint:", 0.5, 1.0);
    v11 = v3;

  }
  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end

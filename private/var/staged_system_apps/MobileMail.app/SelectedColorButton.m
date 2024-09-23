@implementation SelectedColorButton

+ (id)imageWithColor:(id)a3
{
  id v3;
  CGContext *CurrentContext;
  id v5;
  UIImage *ImageFromCurrentImageContext;
  void *v7;
  CGSize v9;
  CGRect v10;

  v3 = a3;
  v9.width = 1.0;
  v9.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = objc_retainAutorelease(v3);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v5, "CGColor"));
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 1.0;
  v10.size.height = 1.0;
  CGContextFillRect(CurrentContext, v10);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v7;
}

+ (id)buttonWithType:(int64_t)a3 radius:(double)a4 color:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  id v22;
  void *v23;
  objc_super v25;
  _QWORD v26[2];

  v8 = a5;
  v25.receiver = a1;
  v25.super_class = (Class)&OBJC_METACLASS___SelectedColorButton;
  v9 = objc_msgSendSuper2(&v25, "buttonWithType:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imageWithColor:", v8));
  objc_msgSend(v10, "setImage:forState:", v11, 0);

  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setContentHorizontalAlignment:", 3);
  objc_msgSend(v10, "setContentVerticalAlignment:", 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
  objc_msgSend(v12, "setMasksToBounds:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
  objc_msgSend(v13, "setCornerRadius:", a4);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "widthAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", a4 + a4));
  v26[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "heightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "widthAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v26[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 2));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  v21 = a4 * 2.0 + -5.0;
  objc_msgSend(v20, "setCornerRadius:", v21 * 0.5);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  objc_msgSend(v20, "setBackgroundColor:", objc_msgSend(v22, "CGColor"));

  objc_msgSend(v20, "setBorderWidth:", 2.0);
  objc_msgSend(v10, "setDonut:", v20);
  objc_msgSend(v20, "setFrame:", 2.5, 2.5, v21, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layer"));
  objc_msgSend(v23, "addSublayer:", v20);

  return v10;
}

- (void)layoutSubviews
{
  id v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SelectedColorButton;
  -[SelectedColorButton layoutSubviews](&v6, "layoutSubviews");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor")));
  v4 = objc_msgSend(v3, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SelectedColorButton donut](self, "donut"));
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SelectedColorButton;
  -[SelectedColorButton setSelected:](&v7, "setSelected:");
  v5 = !v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SelectedColorButton donut](self, "donut"));
  objc_msgSend(v6, "setHidden:", v5);

}

- (CALayer)donut
{
  return self->_donut;
}

- (void)setDonut:(id)a3
{
  objc_storeStrong((id *)&self->_donut, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donut, 0);
}

@end

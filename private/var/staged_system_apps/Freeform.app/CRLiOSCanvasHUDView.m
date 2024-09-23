@implementation CRLiOSCanvasHUDView

+ (double)viewHeightForHUDViewSize:(unint64_t)a3
{
  double result;

  result = 35.0;
  if (a3 != 1)
    result = 0.0;
  if (!a3)
    return 29.0;
  return result;
}

+ (double)fontSizeForHUDViewSize:(unint64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 1)
    result = 18.0;
  if (!a3)
    return 14.0;
  return result;
}

- (CRLiOSCanvasHUDView)initWithFrame:(CGRect)a3
{
  return (CRLiOSCanvasHUDView *)-[CRLiOSCanvasHUDView initForHUDViewSize:](self, "initForHUDViewSize:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CRLiOSCanvasHUDView)initWithCoder:(id)a3
{
  return (CRLiOSCanvasHUDView *)-[CRLiOSCanvasHUDView initForHUDViewSize:](self, "initForHUDViewSize:", 0);
}

- (id)initForHUDViewSize:(unint64_t)a3
{
  double v5;
  CRLiOSCanvasHUDView *v6;
  CRLiOSCanvasHUDView *v7;
  objc_super v9;

  +[CRLiOSCanvasHUDView viewHeightForHUDViewSize:](CRLiOSCanvasHUDView, "viewHeightForHUDViewSize:");
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSCanvasHUDView;
  v6 = -[CRLiOSCanvasHUDView initWithFrame:](&v9, "initWithFrame:", 0.0, 0.0, 150.0, v5);
  v7 = v6;
  if (v6)
  {
    v6->_size = a3;
    -[CRLiOSCanvasHUDView p_setupView](v6, "p_setupView");
  }
  return v7;
}

- (BOOL)p_shouldAllowTouches
{
  return 0;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[CRLiOSCanvasHUDView p_shouldAllowTouches](self, "p_shouldAllowTouches"))
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLiOSCanvasHUDView;
    v8 = -[CRLiOSCanvasHUDView pointInside:withEvent:](&v10, "pointInside:withEvent:", v7, x, y);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateViewToHUDViewSize:(unint64_t)a3
{
  void *v4;
  UILabel *label;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (self->_size != a3)
  {
    self->_size = a3;
    +[CRLiOSCanvasHUDView fontSizeForHUDViewSize:](CRLiOSCanvasHUDView, "fontSizeForHUDViewSize:");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
    -[UILabel setFont:](self->_label, "setFont:", v4);

    label = self->_label;
    -[UILabel bounds](label, "bounds");
    -[UILabel sizeThatFits:](label, "sizeThatFits:", v6, v7);
    v9 = v8 + 18.0;
    +[CRLiOSCanvasHUDView viewHeightForHUDViewSize:](CRLiOSCanvasHUDView, "viewHeightForHUDViewSize:", self->_size);
    -[CRLiOSCanvasHUDView center](self, "center");
    -[CRLiOSCanvasHUDView setFrame:](self, "setFrame:", sub_10005FD98(v10, v11, v9));
  }
}

- (void)p_setupView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  UILabel *v17;
  UILabel *label;
  void *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "scale");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("CanvasHUD")));
  objc_msgSend(v6, "size");
  v8 = 5.0 / v7;
  objc_msgSend(v6, "size");
  v10 = 5.0 / v9;
  v11 = objc_retainAutorelease(v6);
  v12 = objc_msgSend(v11, "CGImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasHUDView layer](self, "layer"));
  objc_msgSend(v13, "setContents:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasHUDView layer](self, "layer"));
  objc_msgSend(v14, "setContentsCenter:", v8, v10, 1.0 - v8 * 2.0, 1.0 - v10 * 2.0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasHUDView layer](self, "layer"));
  objc_msgSend(v15, "setContentsScale:", v5);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasHUDView layer](self, "layer"));
  objc_msgSend(v16, "setZPosition:", 1.0);

  v17 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 150.0, 20.0);
  label = self->_label;
  self->_label = v17;

  -[UILabel setText:](self->_label, "setText:", &stru_1012A72B0);
  +[CRLiOSCanvasHUDView fontSizeForHUDViewSize:](CRLiOSCanvasHUDView, "fontSizeForHUDViewSize:", self->_size);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:"));
  -[UILabel setFont:](self->_label, "setFont:", v19);

  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_label, "setTextColor:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0));
  -[UILabel setBackgroundColor:](self->_label, "setBackgroundColor:", v21);

  CGAffineTransformMakeTranslation(&v24, 0.0, -1.0);
  v22 = self->_label;
  v23 = v24;
  -[UILabel setTransform:](v22, "setTransform:", &v23);
  -[CRLiOSCanvasHUDView bounds](self, "bounds");
  -[UILabel setFrame:](self->_label, "setFrame:");
  -[UILabel setAutoresizingMask:](self->_label, "setAutoresizingMask:", 18);
  -[CRLiOSCanvasHUDView addSubview:](self, "addSubview:", self->_label);

}

- (unint64_t)hudSize
{
  return self->_size;
}

- (UILabel)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end

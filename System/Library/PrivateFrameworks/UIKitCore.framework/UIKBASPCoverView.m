@implementation UIKBASPCoverView

+ (id)ASPCoverView:(BOOL)a3 withFrame:(CGRect)a4 isRightToLeft:(BOOL)a5 withTextWidth:(double)a6
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v12;
  UIKBASPCoverView *v13;
  id v14;

  v7 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = [UIKBASPCoverView alloc];
  if (v12)
    v14 = -[UIKBASPCoverView initCoverViewWithFrame:isRightToLeft:withTextWidth:](v13, "initCoverViewWithFrame:isRightToLeft:withTextWidth:", v7, x, y, width, height, a6);
  else
    v14 = -[UIKBASPCoverView initCoverBackgroundViewWithFrame:isRightToLeft:](v13, "initCoverBackgroundViewWithFrame:isRightToLeft:", v7, x, y, width, height);
  return v14;
}

- (id)initCoverBackgroundViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4
{
  UIKBASPCoverView *v4;
  UIKBASPCoverView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKBASPCoverView;
  v4 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    objc_msgSend((id)objc_opt_class(), "ASPCoverViewColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  }
  return v5;
}

- (id)initCoverViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4 withTextWidth:(double)a5
{
  _BOOL4 v6;
  double height;
  UIKBASPCoverView *v8;
  id *p_isa;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  UILabel *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  double v37;
  void *v38;
  void *v39;
  objc_super v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[3];

  v6 = a4;
  height = a3.size.height;
  v44[2] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)UIKBASPCoverView;
  v8 = -[UIView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width);
  p_isa = (id *)&v8->super.super.super.isa;
  if (v8)
  {
    -[UIView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
    +[UIColor clearColor](UIColor, "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "setBackgroundColor:", v10);

    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = p_isa[52];
    p_isa[52] = (id)v11;

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    if (v14 == 3.0)
      v15 = 4.0;
    else
      v15 = 6.0;

    objc_msgSend(p_isa, "bounds");
    v17 = v16 - v15;
    objc_msgSend(p_isa, "bounds");
    objc_msgSend(p_isa[52], "setFrame:", 0.0, 0.0, v17);
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.980392157, 1.0, 0.741176471, 0.0);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v44[0] = objc_msgSend(v18, "CGColor");
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.980392157, 1.0, 0.741176471, 1.0);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v44[1] = objc_msgSend(v19, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(p_isa[52], "setColors:", v20);
    objc_msgSend(p_isa[52], "frame");
    v22 = 0.45;
    if (v21 * 0.45 <= a5)
    {
      v23 = 0.1;
    }
    else
    {
      v23 = a5 * 0.1 / v21;
      v22 = a5 * 0.65 / v21;
    }
    if (v6)
      v23 = 1.0 - v23;
    v24 = 1.0 - v22;
    if (v6)
      v25 = 1.0 - v22;
    else
      v25 = v22;
    objc_msgSend(p_isa[52], "setStartPoint:", v23, 0.0);
    objc_msgSend(p_isa[52], "setEndPoint:", v25, 0.0);
    objc_msgSend(p_isa, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSublayer:", p_isa[52]);

    _UINSLocalizedStringWithDefaultValue(CFSTR("Strong Password"), CFSTR("Strong Password"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E167A828, "systemFontOfSize:weight:", 14.0, *(double *)off_1E167DC68);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = *(_QWORD *)off_1E1678D90;
    v43 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sizeWithAttributes:", v29);
    v31 = v30;
    objc_msgSend(p_isa[52], "frame");
    if (v31 < v24 * v32)
    {
      v33 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 0.0, 0.0, v24 * v32, height);
      -[UILabel setUserInteractionEnabled:](v33, "setUserInteractionEnabled:", 0);
      -[UILabel setText:](v33, "setText:", v27);
      -[UILabel setFont:](v33, "setFont:", v28);
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v33, "setTextColor:", v34);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(p_isa, "addSubview:", v33);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v36 = 1;
      else
        v36 = 2;
      v37 = -v15;
      if (v6)
        v37 = (double)v6;
      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, v36, 0, p_isa, v36, 1.0, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v38);

      objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v33, 10, 0, p_isa, 10, 1.0, 0.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v39);

      objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v35);
    }

  }
  return p_isa;
}

+ (id)ASPCoverViewColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.980392157, 1.0, 0.741176471, 1.0);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIKBASPCoverView;
  -[UIView layoutSubviews](&v11, sel_layoutSubviews);
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scale");
  if (v4 == 3.0)
    v5 = 4.0;
  else
    v5 = 6.0;

  -[UIView bounds](self, "bounds");
  v7 = v6 - v5;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  -[UIKBASPCoverView gradientLayer](self, "gradientLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v7, v9);

}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end

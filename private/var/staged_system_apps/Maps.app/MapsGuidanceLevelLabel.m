@implementation MapsGuidanceLevelLabel

- (MapsGuidanceLevelLabel)initWithFrame:(CGRect)a3
{
  MapsGuidanceLevelLabel *v3;
  UILabel *v4;
  UILabel *label;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CAShapeLayer *roundedCorner;
  id v11;
  void *v12;
  MapsGuidanceLevelLabel *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MapsGuidanceLevelLabel;
  v3 = -[MapsGuidanceLevelLabel initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    label = v3->_label;
    v3->_label = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    -[UILabel setBackgroundColor:](v3->_label, "setBackgroundColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
    -[UILabel setFont:](v3->_label, "setFont:", v8);

    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 2);
    -[MapsGuidanceLevelLabel addSubview:](v3, "addSubview:", v3->_label);
    v9 = objc_claimAutoreleasedReturnValue(+[CAShapeLayer layer](CAShapeLayer, "layer"));
    roundedCorner = v3->_roundedCorner;
    v3->_roundedCorner = (CAShapeLayer *)v9;

    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[UILabel backgroundColor](v3->_label, "backgroundColor")));
    -[CAShapeLayer setFillColor:](v3->_roundedCorner, "setFillColor:", objc_msgSend(v11, "CGColor"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsGuidanceLevelLabel layer](v3, "layer"));
    objc_msgSend(v12, "addSublayer:", v3->_roundedCorner);

    v13 = v3;
  }

  return v3;
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[UILabel bounds](self->_label, "bounds");
  v4 = v3 * 0.5;
  -[UILabel bounds](self->_label, "bounds");
  -[CAShapeLayer setBounds:](self->_roundedCorner, "setBounds:", 0.0, 0.0, v4);
  -[CAShapeLayer bounds](self->_roundedCorner, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CAShapeLayer bounds](self->_roundedCorner, "bounds");
  v14 = v13;
  -[CAShapeLayer bounds](self->_roundedCorner, "bounds");
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 8, v6, v8, v10, v12, v14, v15)));
  -[CAShapeLayer setPath:](self->_roundedCorner, "setPath:", objc_msgSend(v20, "CGPath"));
  -[UILabel bounds](self->_label, "bounds");
  -[UILabel setBounds:](self->_label, "setBounds:");
  -[CAShapeLayer bounds](self->_roundedCorner, "bounds");
  v17 = v16;
  -[UILabel bounds](self->_label, "bounds");
  v19 = v17 + v18;
  -[UILabel bounds](self->_label, "bounds");
  -[MapsGuidanceLevelLabel setBounds:](self, "setBounds:", 0.0, 0.0, v19);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double MaxX;
  double v6;
  double v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)MapsGuidanceLevelLabel;
  -[MapsGuidanceLevelLabel layoutSubviews](&v8, "layoutSubviews");
  -[UILabel bounds](self->_label, "bounds");
  v4 = v3;
  -[UILabel bounds](self->_label, "bounds");
  -[UILabel setFrame:](self->_label, "setFrame:", 0.0, 0.0, v4);
  -[UILabel frame](self->_label, "frame");
  MaxX = CGRectGetMaxX(v9);
  -[CAShapeLayer bounds](self->_roundedCorner, "bounds");
  v7 = v6;
  -[CAShapeLayer bounds](self->_roundedCorner, "bounds");
  -[CAShapeLayer setFrame:](self->_roundedCorner, "setFrame:", MaxX, 0.0, v7);
}

- (NSString)text
{
  return -[UILabel text](self->_label, "text");
}

- (void)setText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roundedCorner, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

@implementation CRLIndeterminateProgressRingView_i

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAShapeLayer, a2);
}

- (id)p_strokeColorForStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      return self->_color;
    case 1uLL:
      self = (CRLIndeterminateProgressRingView_i *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      break;
    case 0uLL:
      self = (CRLIndeterminateProgressRingView_i *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
      break;
  }
  return self;
}

- (CRLIndeterminateProgressRingView_i)initWithFrame:(CGRect)a3
{
  return -[CRLIndeterminateProgressRingView_i initWithFrame:style:strokeWidth:](self, "initWithFrame:style:strokeWidth:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 3.0);
}

- (CRLIndeterminateProgressRingView_i)initWithCoder:(id)a3
{
  CRLIndeterminateProgressRingView_i *v3;
  CRLIndeterminateProgressRingView_i *v4;
  uint64_t v5;
  UIColor *color;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLIndeterminateProgressRingView_i;
  v3 = -[CRLIndeterminateProgressRingView_i initWithCoder:](&v8, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    v3->_style = 0;
    v3->_strokeWidth = 2.0;
    v3->_gapAngle = 26.0;
    v5 = objc_claimAutoreleasedReturnValue(-[CRLIndeterminateProgressRingView_i p_strokeColorForStyle:](v3, "p_strokeColorForStyle:", v3->_style));
    color = v4->_color;
    v4->_color = (UIColor *)v5;

    -[CRLIndeterminateProgressRingView_i setup](v4, "setup");
  }
  return v4;
}

- (CRLIndeterminateProgressRingView_i)initWithFrame:(CGRect)a3 style:(unint64_t)a4 strokeWidth:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  CRLIndeterminateProgressRingView_i *v13;
  uint64_t v14;
  UIColor *color;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLIndeterminateProgressRingView_i p_strokeColorForStyle:](self, "p_strokeColorForStyle:", self->_style));
  v13 = -[CRLIndeterminateProgressRingView_i initWithFrame:color:strokeWidth:](self, "initWithFrame:color:strokeWidth:", v12, x, y, width, height, a5);

  if (v13)
  {
    v13->_style = a4;
    v13->_strokeWidth = a5;
    v13->_gapAngle = 26.0;
    v14 = objc_claimAutoreleasedReturnValue(-[CRLIndeterminateProgressRingView_i p_strokeColorForStyle:](v13, "p_strokeColorForStyle:", v13->_style));
    color = v13->_color;
    v13->_color = (UIColor *)v14;

    -[CRLIndeterminateProgressRingView_i setup](v13, "setup");
  }
  return v13;
}

- (CRLIndeterminateProgressRingView_i)initWithFrame:(CGRect)a3 color:(id)a4 strokeWidth:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  CRLIndeterminateProgressRingView_i *v13;
  CRLIndeterminateProgressRingView_i *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRLIndeterminateProgressRingView_i;
  v13 = -[CRLIndeterminateProgressRingView_i initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_style = 2;
    v13->_strokeWidth = a5;
    v13->_gapAngle = 26.0;
    objc_storeStrong((id *)&v13->_color, a4);
    -[CRLIndeterminateProgressRingView_i setup](v14, "setup");
  }

  return v14;
}

- (void)setup
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  NSNumber *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLIndeterminateProgressRingView_i layer](self, "layer"));
  -[CRLIndeterminateProgressRingView_i strokeWidth](self, "strokeWidth");
  objc_msgSend(v14, "setLineWidth:");
  objc_msgSend(v14, "setLineCap:", kCALineCapRound);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  objc_msgSend(v14, "setFillColor:", objc_msgSend(v3, "CGColor"));

  objc_msgSend(v14, "setStrokeColor:", -[UIColor CGColor](self->_color, "CGColor"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
  objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  -[CRLIndeterminateProgressRingView_i _updateShapePath](self, "_updateShapePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keyPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKeyPath:", v6));

  objc_msgSend(v5, "setFromValue:", v7);
  objc_msgSend(v7, "floatValue");
  v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(fmod(v8, 6.28318531) + 6.28318531));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v5, "setToValue:", v10);

  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  LODWORD(v11) = 2139095040;
  objc_msgSend(v5, "setRepeatCount:", v11);
  objc_msgSend(v5, "setFillMode:", kCAFillModeBoth);
  objc_msgSend(v5, "setDuration:", 1.0);
  objc_msgSend(v14, "addAnimation:forKey:", v5, CFSTR("CRLiOSIndeterminateProgressRingViewSpinnerAnimationKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection systemTraitsAffectingColorAppearance](UITraitCollection, "systemTraitsAffectingColorAppearance"));
  v13 = -[CRLIndeterminateProgressRingView_i registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v12, self, "updateForAppearance");

}

- (void)layoutSubviews
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLIndeterminateProgressRingView_i;
  -[CRLIndeterminateProgressRingView_i layoutSubviews](&v5, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLIndeterminateProgressRingView_i traitCollection](self, "traitCollection"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000F4F40;
  v4[3] = &unk_10122D110;
  v4[4] = self;
  objc_msgSend(v3, "performAsCurrentTraitCollection:", v4);

  -[CRLIndeterminateProgressRingView_i _updateShapePath](self, "_updateShapePath");
}

- (void)setTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CRLIndeterminateProgressRingView_i setColor:](self, "setColor:", v4);
  v5.receiver = self;
  v5.super_class = (Class)CRLIndeterminateProgressRingView_i;
  -[CRLIndeterminateProgressRingView_i setTintColor:](&v5, "setTintColor:", v4);

}

- (void)setColor:(id)a3
{
  unint64_t v4;
  void *v5;
  unsigned __int8 v6;
  UIColor *v7;
  UIColor *color;
  void *v9;
  void *v10;
  void *v11;

  v4 = (unint64_t)a3;
  v5 = (void *)v4;
  if (v4 | (unint64_t)self->_color)
  {
    v11 = (void *)v4;
    v6 = objc_msgSend((id)v4, "isEqual:");
    v5 = v11;
    if ((v6 & 1) == 0)
    {
      if (v11)
        v7 = v11;
      else
        v7 = (UIColor *)objc_claimAutoreleasedReturnValue(-[CRLIndeterminateProgressRingView_i p_strokeColorForStyle:](self, "p_strokeColorForStyle:", -[CRLIndeterminateProgressRingView_i style](self, "style")));
      color = self->_color;
      self->_color = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLIndeterminateProgressRingView_i layer](self, "layer"));
      objc_msgSend(v9, "setStrokeColor:", -[UIColor CGColor](self->_color, "CGColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLIndeterminateProgressRingView_i layer](self, "layer"));
      objc_msgSend(v10, "setNeedsDisplay");

      v5 = v11;
    }
  }

}

- (void)setGapAngle:(double)a3
{
  self->_gapAngle = a3;
  -[CRLIndeterminateProgressRingView_i setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateShapePath
{
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  id v17;
  id v18;

  v18 = (id)objc_claimAutoreleasedReturnValue(-[CRLIndeterminateProgressRingView_i layer](self, "layer"));
  -[CRLIndeterminateProgressRingView_i bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v7 * 0.5;
  v12 = sub_100061400(v3, v5, v7, v9);
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  -[CRLIndeterminateProgressRingView_i gapAngle](self, "gapAngle");
  objc_msgSend(v15, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v12, v14, v11, 0.0, (v16 / -180.0 + 2.0) * 3.14159265);
  v17 = objc_retainAutorelease(v15);
  objc_msgSend(v18, "setPath:", objc_msgSend(v17, "CGPath"));
  objc_msgSend(v18, "setBounds:", v4, v6, v8, v10);

}

- (void)updateForAppearance
{
  -[CRLIndeterminateProgressRingView_i setColor:](self, "setColor:", 0);
}

- (UIColor)color
{
  return self->_color;
}

- (double)gapAngle
{
  return self->_gapAngle;
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end

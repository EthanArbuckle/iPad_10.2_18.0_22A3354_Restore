@implementation RCEditingProgressIndicator

- (void)setProgress:(float)a3
{
  CGPath *v4;
  id v5;

  self->_progress = a3;
  v4 = -[RCEditingProgressIndicator _progressPath](self, "_progressPath");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCEditingProgressIndicator progressLayer](self, "progressLayer"));
  objc_msgSend(v5, "setPath:", v4);

}

- (void)setProgressColor:(id)a3
{
  id v5;
  id v6;
  id v7;

  objc_storeStrong((id *)&self->_progressColor, a3);
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "CGColor");

  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCEditingProgressIndicator progressLayer](self, "progressLayer"));
  objc_msgSend(v7, "setFillColor:", v6);

}

- (RCEditingProgressIndicator)initWithCoder:(id)a3
{
  RCEditingProgressIndicator *v3;
  RCEditingProgressIndicator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCEditingProgressIndicator;
  v3 = -[RCEditingProgressIndicator initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[RCEditingProgressIndicator _commonInit](v3, "_commonInit");
  return v4;
}

- (RCEditingProgressIndicator)initWithFrame:(CGRect)a3
{
  RCEditingProgressIndicator *v3;
  RCEditingProgressIndicator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCEditingProgressIndicator;
  v3 = -[RCEditingProgressIndicator initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[RCEditingProgressIndicator _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  CAShapeLayer *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCEditingProgressIndicator layer](self, "layer"));
  v3 = objc_opt_new(CAShapeLayer);
  -[CAShapeLayer setAnchorPoint:](v3, "setAnchorPoint:", 0.0, 0.0);
  -[RCEditingProgressIndicator setProgressLayer:](self, "setProgressLayer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[RCEditingProgressIndicator setProgressColor:](self, "setProgressColor:", v4);

  objc_msgSend(v5, "addSublayer:", v3);
  -[RCEditingProgressIndicator _updateLayers](self, "_updateLayers");

}

- (void)layoutSublayersOfLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCEditingProgressIndicator;
  -[RCEditingProgressIndicator layoutSublayersOfLayer:](&v4, "layoutSublayersOfLayer:", a3);
  -[RCEditingProgressIndicator _updateLayers](self, "_updateLayers");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RCEditingProgressIndicator;
  -[RCEditingProgressIndicator layoutSubviews](&v3, "layoutSubviews");
  -[RCEditingProgressIndicator _updateLayers](self, "_updateLayers");
  -[RCEditingProgressIndicator _styleView](self, "_styleView");
}

- (void)_updateLayers
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCEditingProgressIndicator progressLayer](self, "progressLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingProgressIndicator layer](self, "layer"));
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setBounds:");

  objc_msgSend(v4, "setPath:", -[RCEditingProgressIndicator _progressPath](self, "_progressPath"));
}

- (CGPath)_progressPath
{
  UIBezierPath *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double MidX;
  double MidY;
  double v20;
  float v21;
  float v22;
  UIBezierPath *v23;
  CGPath *v24;
  CGRect v26;
  CGRect v27;

  v3 = objc_opt_new(UIBezierPath);
  -[RCEditingProgressIndicator outerRingThickness](self, "outerRingThickness");
  v5 = v4;
  -[RCEditingProgressIndicator _radius](self, "_radius");
  v7 = v6;
  v8 = v5 + v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingProgressIndicator progressLayer](self, "progressLayer"));
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v26.origin.x = v11;
  v26.origin.y = v13;
  v26.size.width = v15;
  v26.size.height = v17;
  MidX = CGRectGetMidX(v26);
  v27.origin.x = v11;
  v27.origin.y = v13;
  v27.size.width = v15;
  v27.size.height = v17;
  MidY = CGRectGetMidY(v27);
  v20 = MidY - v7;
  -[UIBezierPath moveToPoint:](v3, "moveToPoint:", MidX, MidY - v8);
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:](v3, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v8, -1.57079637, 4.71238899);
  -[RCEditingProgressIndicator progress](self, "progress");
  if (v21 <= 0.01)
  {
    -[UIBezierPath addLineToPoint:](v3, "addLineToPoint:", MidX, v20);
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:](v3, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MidX, MidY, v7, -1.57079637, 4.71238899);
    -[UIBezierPath closePath](v3, "closePath");
  }
  else
  {
    -[UIBezierPath moveToPoint:](v3, "moveToPoint:", MidX, v20);
    -[RCEditingProgressIndicator progress](self, "progress");
    -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:](v3, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MidX, MidY, v7, -1.57079637, (float)((float)(v22 * 6.2832) + -1.5708));
    -[UIBezierPath addLineToPoint:](v3, "addLineToPoint:", MidX, MidY);
    -[UIBezierPath addLineToPoint:](v3, "addLineToPoint:", MidX, v20);
  }
  v23 = objc_retainAutorelease(v3);
  v24 = -[UIBezierPath CGPath](v23, "CGPath");

  return v24;
}

- (double)_radius
{
  double v2;

  -[RCEditingProgressIndicator diameter](self, "diameter");
  return RCRoundCoord(v2 * 0.5);
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[RCEditingProgressIndicator diameter](self, "diameter");
  v4 = v3;
  -[RCEditingProgressIndicator diameter](self, "diameter");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)_styleView
{
  id v3;
  void *v4;
  id v5;

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[RCEditingProgressIndicator progressColor](self, "progressColor")));
  v3 = objc_msgSend(v5, "CGColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCEditingProgressIndicator progressLayer](self, "progressLayer"));
  objc_msgSend(v4, "setFillColor:", v3);

}

- (float)progress
{
  return self->_progress;
}

- (double)outerRingThickness
{
  return self->_outerRingThickness;
}

- (void)setOuterRingThickness:(double)a3
{
  self->_outerRingThickness = a3;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (UIColor)progressColor
{
  return self->_progressColor;
}

- (CAShapeLayer)progressLayer
{
  return self->_progressLayer;
}

- (void)setProgressLayer:(id)a3
{
  objc_storeStrong((id *)&self->_progressLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_progressColor, 0);
}

@end

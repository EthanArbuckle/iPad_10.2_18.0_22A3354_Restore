@implementation MTAAnalogStopwatchHandView

- (MTAAnalogStopwatchHandView)initWithFrame:(CGRect)a3
{
  MTAAnalogStopwatchHandView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAAnalogStopwatchHandView;
  v3 = -[MTAAnalogStopwatchHandView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[MTAAnalogStopwatchHandView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)setAngle:(double)a3
{
  if (self->_angle != a3)
  {
    self->_angle = a3;
    -[MTAAnalogStopwatchHandView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setWidth:(double)a3
{
  if (self->_width != a3)
  {
    self->_width = a3;
    -[MTAAnalogStopwatchHandView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[MTAAnalogStopwatchHandView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)setHasTail:(BOOL)a3
{
  if (self->_hasTail != a3)
  {
    self->_hasTail = a3;
    -[MTAAnalogStopwatchHandView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setAnchorStyle:(unint64_t)a3
{
  if (self->_anchorStyle != a3)
  {
    self->_anchorStyle = a3;
    -[MTAAnalogStopwatchHandView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  CGContext *CurrentContext;
  CGFloat MidX;
  CGFloat MidY;
  double v9;
  double v10;
  double v11;
  UIBezierPath *v12;
  unsigned int v13;
  double v14;
  CGFloat v15;
  void *v16;
  UIBezierPath *v17;
  void *v18;
  void *v19;
  double v20;
  double y;
  void *v22;
  void *v23;
  void *v24;
  CGAffineTransform v25;
  CGRect v26;
  CGRect v27;

  -[MTAAnalogStopwatchHandView width](self, "width", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  -[MTAAnalogStopwatchHandView bounds](self, "bounds");
  MidX = CGRectGetMidX(v26);
  -[MTAAnalogStopwatchHandView bounds](self, "bounds");
  MidY = CGRectGetMidY(v27);
  CGContextTranslateCTM(CurrentContext, MidX, MidY);
  -[MTAAnalogStopwatchHandView bounds](self, "bounds");
  v10 = v9;
  v11 = v9 * 0.5;
  v12 = objc_opt_new(UIBezierPath);
  v13 = -[MTAAnalogStopwatchHandView hasTail](self, "hasTail");
  v14 = 0.0;
  if (v13)
    v14 = v11 / 5.0;
  -[UIBezierPath moveToPoint:](v12, "moveToPoint:", 0.0, v14);
  -[UIBezierPath addLineToPoint:](v12, "addLineToPoint:", 0.0, -(v10 * 0.5));
  -[MTAAnalogStopwatchHandView angle](self, "angle");
  CGAffineTransformMakeRotation(&v25, v15);
  -[UIBezierPath applyTransform:](v12, "applyTransform:", &v25);
  -[UIBezierPath setLineWidth:](v12, "setLineWidth:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchHandView color](self, "color"));
  objc_msgSend(v16, "setStroke");

  -[UIBezierPath stroke](v12, "stroke");
  if ((id)-[MTAAnalogStopwatchHandView anchorStyle](self, "anchorStyle") == (id)1)
  {
    v17 = +[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, CGPointZero.x, CGPointZero.y, UIRoundToViewScale(v5 * 1.5), 0.0, 6.28318531);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchHandView color](self, "color"));
LABEL_7:
    v24 = v19;
    objc_msgSend(v19, "setFill");

    objc_msgSend(v18, "fill");
    goto LABEL_8;
  }
  if ((id)-[MTAAnalogStopwatchHandView anchorStyle](self, "anchorStyle") == (id)2)
  {
    v20 = UIRoundToViewScale(v5 + v5);
    y = CGPointZero.y;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, CGPointZero.x, y, v20, 0.0, 6.28318531));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTAAnalogStopwatchHandView color](self, "color"));
    objc_msgSend(v23, "setFill");

    objc_msgSend(v22, "fill");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, CGPointZero.x, y, v5, 0.0, 6.28318531));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
    goto LABEL_7;
  }
LABEL_8:

  CGContextRestoreGState(CurrentContext);
}

- (double)angle
{
  return self->_angle;
}

- (double)width
{
  return self->_width;
}

- (UIColor)color
{
  return self->_color;
}

- (BOOL)hasTail
{
  return self->_hasTail;
}

- (unint64_t)anchorStyle
{
  return self->_anchorStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end

@implementation DayCircleView

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  id v6;
  CGRect v7;

  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DayCircleView color](self, "color"));
  objc_msgSend(v5, "set");

  if (-[DayCircleView usesRoundedRectInsteadOfCircle](self, "usesRoundedRectInsteadOfCircle"))
  {
    -[DayCircleView bounds](self, "bounds");
    v6 = (id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:"));
    objc_msgSend(v6, "fill");

  }
  else
  {
    -[DayCircleView bounds](self, "bounds");
    CGContextFillEllipseInRect(CurrentContext, v7);
  }
}

- (DayCircleView)initWithFrame:(CGRect)a3
{
  DayCircleView *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  UIColor *color;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DayCircleView;
  v3 = -[DayCircleView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[DayCircleView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = CalendarAppCircleNonTodayBGColor();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    color = v3->_color;
    v3->_color = (UIColor *)v6;

  }
  return v3;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
  -[DayCircleView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)usesRoundedRectInsteadOfCircle
{
  return self->_usesRoundedRectInsteadOfCircle;
}

- (void)setUsesRoundedRectInsteadOfCircle:(BOOL)a3
{
  if (self->_usesRoundedRectInsteadOfCircle != a3)
  {
    self->_usesRoundedRectInsteadOfCircle = a3;
    -[DayCircleView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end

@implementation BKFinishedButton

- (BKFinishedButton)initWithFrame:(CGRect)a3
{
  BKFinishedButton *v3;
  BKFinishedButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKFinishedButton;
  v3 = -[BKFinishedButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[BKFinishedButton setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v4;
}

- (BKFinishedButton)initWithCoder:(id)a3
{
  BKFinishedButton *v3;
  BKFinishedButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKFinishedButton;
  v3 = -[BKFinishedButton initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[BKFinishedButton setClipsToBounds:](v3, "setClipsToBounds:", 1);
  return v4;
}

- (void)setFrameWidth:(double)a3
{
  double v4;
  double v5;
  id v6;

  if (self->_frameWidth != a3)
  {
    self->_frameWidth = a3;
    -[BKFinishedButton frameWidth](self, "frameWidth");
    v5 = v4;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKFinishedButton layer](self, "layer"));
    objc_msgSend(v6, "setBorderWidth:", v5);

  }
}

- (void)setFrameColor:(id)a3
{
  CGColor *v5;
  void *v6;
  UIColor *v7;

  v7 = (UIColor *)a3;
  if (self->_frameColor != v7)
  {
    objc_storeStrong((id *)&self->_frameColor, a3);
    v5 = -[UIColor CGColor](objc_retainAutorelease(v7), "CGColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKFinishedButton layer](self, "layer"));
    objc_msgSend(v6, "setBorderColor:", v5);

  }
}

- (double)frameWidth
{
  return self->_frameWidth;
}

- (UIColor)frameColor
{
  return self->_frameColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameColor, 0);
}

@end

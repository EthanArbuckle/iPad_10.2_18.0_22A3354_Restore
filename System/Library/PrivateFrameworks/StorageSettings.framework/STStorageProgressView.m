@implementation STStorageProgressView

- (STStorageProgressView)initWithFrame:(CGRect)a3
{
  STStorageProgressView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStorageProgressView;
  v3 = -[STStorageProgressView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STStorageProgressView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[STStorageProgressView updateColors](v3, "updateColors");
  }
  return v3;
}

- (void)updateColors
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[STStorageProgressView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 == 2)
    objc_msgSend(MEMORY[0x24BDF6950], "systemDarkGrayColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "systemLightMidGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_grayColor, v5);

  if (v4 == 2)
    objc_msgSend(MEMORY[0x24BDF6950], "systemDarkLightMidGrayColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_blueColor, v6);

}

- (void)setPercent:(double)a3
{
  if (self->_percent != a3)
  {
    self->_percent = a3;
    -[STStorageProgressView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  double x;
  double y;
  double width;
  double height;
  CGContext *CurrentContext;
  double percent;
  void *v11;
  int *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGRect v18;
  CGRect v19;

  -[STStorageProgressView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v19 = CGRectInset(v18, 2.0, 2.0);
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  percent = self->_percent;
  if (percent > 0.0 && percent < 1.0)
  {
    v13 = floor(height * 0.5);
    v14 = x + width - v13;
    v15 = y + v13;
    v16 = percent * 6.28318531 + -1.57079633;
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v14, v15, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLineWidth:", 4.0);
    -[UIColor setStroke](self->_blueColor, "setStroke");
    objc_msgSend(v17, "stroke");
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v14, v15, v13, v16, 4.71238898);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setLineWidth:", 4.0);
    v12 = &OBJC_IVAR___STStorageProgressView__grayColor;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", x, y, width, height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLineWidth:", 4.0);
    v12 = &OBJC_IVAR___STStorageProgressView__grayColor;
    if (self->_percent > 0.0)
      v12 = &OBJC_IVAR___STStorageProgressView__blueColor;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v12), "setStroke");
  objc_msgSend(v11, "stroke");

  UIGraphicsPopContext();
}

- (double)percent
{
  return self->_percent;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STStorageProgressView;
  -[STStorageProgressView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[STStorageProgressView updateColors](self, "updateColors");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blueColor, 0);
  objc_storeStrong((id *)&self->_grayColor, 0);
}

@end

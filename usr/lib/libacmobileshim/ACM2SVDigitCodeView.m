@implementation ACM2SVDigitCodeView

- (ACM2SVDigitCodeView)initWithFrame:(CGRect)a3
{
  ACM2SVDigitCodeView *v3;
  ACM2SVDigitCodeView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACM2SVDigitCodeView;
  v3 = -[ACM2SVDigitCodeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ACM2SVDigitCodeView setFillType:](v3, "setFillType:", 0);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[ACM2SVDigitCodeView setFillColor:](self, "setFillColor:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACM2SVDigitCodeView;
  -[ACM2SVDigitCodeView dealloc](&v3, sel_dealloc);
}

- (void)setFillType:(int64_t)a3
{
  if (self->_fillType != a3)
  {
    self->_fillType = a3;
    -[ACM2SVDigitCodeView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACM2SVDigitCodeView;
  -[ACM2SVDigitCodeView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ACM2SVDigitCodeView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  CGFloat v8;
  uint64_t v9;
  void *v10;
  CGFloat v11;
  void *v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v4 = (void *)MEMORY[0x24BDF6870];
  -[ACM2SVDigitCodeView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_msgSend(v4, "bezierPathWithRect:");
  objc_msgSend((id)-[ACM2SVDigitCodeView backgroundColor](self, "backgroundColor"), "setFill");
  objc_msgSend(v5, "fill");
  v6 = -[ACM2SVDigitCodeView fillType](self, "fillType");
  if (v6 == 1)
  {
    v10 = (void *)MEMORY[0x24BDF6870];
    -[ACM2SVDigitCodeView bounds](self, "bounds");
    v11 = (CGRectGetWidth(v15) + -10.0) * 0.5;
    -[ACM2SVDigitCodeView bounds](self, "bounds");
    v9 = objc_msgSend(v10, "bezierPathWithOvalInRect:", v11, (CGRectGetHeight(v16) + -10.0) * 0.5, 10.0, 10.0);
  }
  else
  {
    if (v6)
      return;
    v7 = (void *)MEMORY[0x24BDF6870];
    -[ACM2SVDigitCodeView bounds](self, "bounds");
    v8 = (CGRectGetWidth(v13) + -10.0) * 0.5;
    -[ACM2SVDigitCodeView bounds](self, "bounds");
    v9 = objc_msgSend(v7, "bezierPathWithRect:", v8, (CGRectGetHeight(v14) + -2.0) * 0.5, 10.0, 2.0);
  }
  v12 = (void *)v9;
  if (v9)
  {
    -[UIColor setFill](-[ACM2SVDigitCodeView fillColor](self, "fillColor"), "setFill");
    objc_msgSend(v12, "fill");
  }
}

- (int64_t)fillType
{
  return self->_fillType;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

@end

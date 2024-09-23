@implementation _UIActionSliderKnob

- (_UIActionSliderKnob)initWithFrame:(CGRect)a3
{
  _UIActionSliderKnob *v3;
  uint64_t v4;
  UIColor *knobColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIActionSliderKnob;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[UIColor whiteColor](UIColor, "whiteColor");
    v4 = objc_claimAutoreleasedReturnValue();
    knobColor = v3->_knobColor;
    v3->_knobColor = (UIColor *)v4;

  }
  return v3;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  _QWORD *ContextStack;
  CGContext *v5;
  void *v6;
  int *v7;
  id v8;
  CGRect v9;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v5 = 0;
  else
    v5 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  UIGraphicsPushContext(v5);
  -[_UIActionSliderKnob knobColor](self, "knobColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v6)
    CGContextSetFillColorWithColor(v5, (CGColorRef)objc_msgSend(objc_retainAutorelease(v6), "CGColor"));
  else
    CGContextSetRGBFillColor(v5, 1.0, 1.0, 1.0, 1.0);
  -[UIView bounds](self, "bounds");
  CGContextFillEllipseInRect(v5, v9);
  v7 = (int *)GetContextStack(0);
  PopContextFromStack(v7);

}

- (UIColor)knobColor
{
  return self->_knobColor;
}

- (void)setKnobColor:(id)a3
{
  objc_storeStrong((id *)&self->_knobColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knobColor, 0);
}

@end

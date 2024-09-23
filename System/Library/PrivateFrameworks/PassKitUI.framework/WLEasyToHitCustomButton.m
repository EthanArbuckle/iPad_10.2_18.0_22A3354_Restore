@implementation WLEasyToHitCustomButton

- (WLEasyToHitCustomButton)initWithMargins:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  WLEasyToHitCustomButton *v7;
  WLEasyToHitCustomButton *v8;
  objc_super v10;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v10.receiver = self;
  v10.super_class = (Class)WLEasyToHitCustomButton;
  v7 = -[WLEasyToHitCustomButton initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
    -[WLEasyToHitCustomButton setMargins:](v7, "setMargins:", top, left, bottom, right);
  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[WLEasyToHitCustomButton bounds](self, "bounds", a4);
  -[WLEasyToHitCustomButton margins](self, "margins");
  UIRectInset();
  v8.x = x;
  v8.y = y;
  return CGRectContainsPoint(v9, v8);
}

- (UIEdgeInsets)margins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_margins.top;
  left = self->_margins.left;
  bottom = self->_margins.bottom;
  right = self->_margins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMargins:(UIEdgeInsets)a3
{
  self->_margins = a3;
}

@end

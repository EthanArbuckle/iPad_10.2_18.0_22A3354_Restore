@implementation UIKeyboardFloatingTransitionState

- (UIView)inputView
{
  return self->_inputView;
}

- (void)setInputView:(id)a3
{
  objc_storeStrong((id *)&self->_inputView, a3);
}

- (CGRect)inputViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputViewFrame.origin.x;
  y = self->_inputViewFrame.origin.y;
  width = self->_inputViewFrame.size.width;
  height = self->_inputViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputViewFrame:(CGRect)a3
{
  self->_inputViewFrame = a3;
}

- (CGRect)platterViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_platterViewFrame.origin.x;
  y = self->_platterViewFrame.origin.y;
  width = self->_platterViewFrame.size.width;
  height = self->_platterViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPlatterViewFrame:(CGRect)a3
{
  self->_platterViewFrame = a3;
}

- (UIEdgeInsets)platterInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_platterInsets.top;
  left = self->_platterInsets.left;
  bottom = self->_platterInsets.bottom;
  right = self->_platterInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPlatterInsets:(UIEdgeInsets)a3
{
  self->_platterInsets = a3;
}

- (CGPoint)scale
{
  double x;
  double y;
  CGPoint result;

  x = self->_scale.x;
  y = self->_scale.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScale:(CGPoint)a3
{
  self->_scale = a3;
}

- (CGAffineTransform)initialInputViewTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].ty;
  return self;
}

- (void)setInitialInputViewTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_initialInputViewTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_initialInputViewTransform.c = v4;
  *(_OWORD *)&self->_initialInputViewTransform.a = v3;
}

- (CGAffineTransform)finalInputViewTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].ty;
  return self;
}

- (void)setFinalInputViewTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_finalInputViewTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_finalInputViewTransform.c = v4;
  *(_OWORD *)&self->_finalInputViewTransform.a = v3;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
}

@end

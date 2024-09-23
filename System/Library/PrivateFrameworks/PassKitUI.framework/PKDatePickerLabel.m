@implementation PKDatePickerLabel

- (void)drawTextInRect:(CGRect)a3
{
  double top;
  double left;
  CGFloat v5;
  CGFloat v6;
  objc_super v7;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  v5 = a3.size.width - (left + self->_contentInset.right);
  v6 = a3.size.height - (top + self->_contentInset.bottom);
  v7.receiver = self;
  v7.super_class = (Class)PKDatePickerLabel;
  -[PKDatePickerLabel drawTextInRect:](&v7, sel_drawTextInRect_, a3.origin.x + left, a3.origin.y + top, v5, v6);
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

@end

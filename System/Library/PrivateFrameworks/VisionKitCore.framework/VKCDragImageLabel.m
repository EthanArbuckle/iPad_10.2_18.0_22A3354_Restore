@implementation VKCDragImageLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCDragImageLabel customEdgeInsets](self, "customEdgeInsets");
  v12.receiver = self;
  v12.super_class = (Class)VKCDragImageLabel;
  -[VKCDragImageLabel drawTextInRect:](&v12, sel_drawTextInRect_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  v14.receiver = self;
  v14.super_class = (Class)VKCDragImageLabel;
  -[VKCDragImageLabel intrinsicContentSize](&v14, sel_intrinsicContentSize);
  v4 = v3;
  v6 = v5;
  -[VKCDragImageLabel customEdgeInsets](self, "customEdgeInsets");
  v9 = v4 + v7 + v8;
  v12 = v6 + v10 + v11;
  v13 = v9;
  result.height = v12;
  result.width = v13;
  return result;
}

- (UIEdgeInsets)customEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_customEdgeInsets.top;
  left = self->_customEdgeInsets.left;
  bottom = self->_customEdgeInsets.bottom;
  right = self->_customEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCustomEdgeInsets:(UIEdgeInsets)a3
{
  self->_customEdgeInsets = a3;
}

@end

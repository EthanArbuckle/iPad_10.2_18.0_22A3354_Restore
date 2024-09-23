@implementation _PXEditableNavigationTitleTextField

- (CGRect)textRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_PXEditableNavigationTitleTextField padding](self, "padding");
  v16.receiver = self;
  v16.super_class = (Class)_PXEditableNavigationTitleTextField;
  -[_PXEditableNavigationTitleTextField textRectForBounds:](&v16, sel_textRectForBounds_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_PXEditableNavigationTitleTextField padding](self, "padding");
  v16.receiver = self;
  v16.super_class = (Class)_PXEditableNavigationTitleTextField;
  -[_PXEditableNavigationTitleTextField editingRectForBounds:](&v16, sel_editingRectForBounds_, x + v11, y + v8, width - (v11 + v9), height - (v8 + v10));
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

@end

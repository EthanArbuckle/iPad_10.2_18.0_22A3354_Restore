@implementation TUIUIKitTextView

- (void)setEnabled:(BOOL)a3
{
  -[TUIUIKitTextView setEditable:](self, "setEditable:", a3);
}

- (BOOL)isEnabled
{
  return -[TUIUIKitTextView isEditable](self, "isEditable");
}

- (BOOL)isHighlighted
{
  return 0;
}

- (UIEdgeInsets)editingInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_editingInsets.top;
  left = self->_editingInsets.left;
  bottom = self->_editingInsets.bottom;
  right = self->_editingInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEditingInsets:(UIEdgeInsets)a3
{
  self->_editingInsets = a3;
}

@end

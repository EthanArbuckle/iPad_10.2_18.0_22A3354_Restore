@implementation UITextPlaceholder

- (UITextPlaceholder)init
{
  UITextPlaceholder *v2;
  _UITextPlaceholderAttachment *v3;
  _UITextPlaceholderAttachment *attachment;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextPlaceholder;
  v2 = -[UITextPlaceholder init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_UITextPlaceholderAttachment);
    attachment = v2->_attachment;
    v2->_attachment = v3;

  }
  return v2;
}

- (NSArray)rects
{
  return self->_rects;
}

- (void)setRects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CGRect)caretRectBeforeInsertion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_caretRectBeforeInsertion.origin.x;
  y = self->_caretRectBeforeInsertion.origin.y;
  width = self->_caretRectBeforeInsertion.size.width;
  height = self->_caretRectBeforeInsertion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCaretRectBeforeInsertion:(CGRect)a3
{
  self->_caretRectBeforeInsertion = a3;
}

- (_UITextPlaceholderAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_rects, 0);
}

@end

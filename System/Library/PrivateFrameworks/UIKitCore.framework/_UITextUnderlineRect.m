@implementation _UITextUnderlineRect

+ (id)underlineRectWithRect:(CGRect)a3 offset:(double)a4 transform:(CGAffineTransform *)a5
{
  double height;
  double width;
  double y;
  double x;
  _UITextUnderlineRect *v11;
  __int128 v12;
  _OWORD v14[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = objc_alloc_init(_UITextUnderlineRect);
  -[_UITextUnderlineRect setRect:](v11, "setRect:", x, y, width, height);
  -[UITextSelectionRect setBaselineOffset:](v11, "setBaselineOffset:", a4);
  v12 = *(_OWORD *)&a5->c;
  v14[0] = *(_OWORD *)&a5->a;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a5->tx;
  -[_UITextUnderlineRect setTransform:](v11, "setTransform:", v14);
  -[_UITextUnderlineRect setUnderlineType:](v11, "setUnderlineType:", 1);
  return v11;
}

- (_UITextUnderlineRect)init
{
  _UITextUnderlineRect *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITextUnderlineRect;
  result = -[_UITextUnderlineRect init](&v5, sel_init);
  if (result)
  {
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (CGRect)fullRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  CGRect v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_UITextUnderlineRect rect](self, "rect");
  NSStringFromCGRect(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelectionRect baselineOffset](self, "baselineOffset");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; rect = %@; offset = %0.2f>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].c;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.tx = v3;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (UIColor)underlineColor
{
  return self->_underlineColor;
}

- (void)setUnderlineColor:(id)a3
{
  objc_storeStrong((id *)&self->_underlineColor, a3);
}

- (int64_t)underlineType
{
  return self->_underlineType;
}

- (void)setUnderlineType:(int64_t)a3
{
  self->_underlineType = a3;
}

- (UITextRange)associatedTextRange
{
  return self->_associatedTextRange;
}

- (void)setAssociatedTextRange:(id)a3
{
  objc_storeStrong((id *)&self->_associatedTextRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedTextRange, 0);
  objc_storeStrong((id *)&self->_underlineColor, 0);
}

@end

@implementation _UIMutableTextSelectionRect

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_rect.origin.x, self->_rect.origin.y, self->_rect.size.width, self->_rect.size.height);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__customHandleInfo, 0);
  objc_storeStrong((id *)&self->__path, 0);
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

- (UIBezierPath)_path
{
  return self->__path;
}

- (void)setIsVertical:(BOOL)a3
{
  self->_isVertical = a3;
}

+ (id)selectionRectWithRect:(CGRect)a3 fromView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setRect:fromView:", v8, x, y, width, height);

  objc_msgSend(v9, "setWritingDirection:", 0);
  return v9;
}

- (void)setWritingDirection:(int64_t)a3
{
  self->_writingDirection = a3;
}

- (void)setRect:(CGRect)a3 fromView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_rect;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a4;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (CGRectIsNull(v16)
    || (v17.origin.x = x, v17.origin.y = y, v17.size.width = width, v17.size.height = height, CGRectIsInfinite(v17)))
  {
    p_rect = &self->_rect;
    p_rect->origin.x = x;
  }
  else
  {
    p_rect = &self->_rect;
    objc_msgSend(v15, "_currentScreenScale");
    v11 = UIRectRoundToScale(x, y, width, height, v10);
    y = v12;
    width = v13;
    height = v14;
    p_rect->origin.x = v11;
  }
  p_rect->origin.y = y;
  p_rect->size.width = width;
  p_rect->size.height = height;

}

- (_UIMutableTextSelectionRect)init
{
  _UIMutableTextSelectionRect *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIMutableTextSelectionRect;
  result = -[_UIMutableTextSelectionRect init](&v5, sel_init);
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

- (void)setContainsStart:(BOOL)a3
{
  self->_containsStart = a3;
}

- (void)setContainsEnd:(BOOL)a3
{
  self->_containsEnd = a3;
}

- (int64_t)writingDirection
{
  return self->_writingDirection;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].d;
  return self;
}

- (void)set_path:(id)a3
{
  objc_storeStrong((id *)&self->__path, a3);
}

- (void)set_customHandleInfo:(id)a3
{
  objc_storeStrong((id *)&self->__customHandleInfo, a3);
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

- (BOOL)isVertical
{
  return self->_isVertical;
}

- (BOOL)containsStart
{
  return self->_containsStart;
}

- (BOOL)containsEnd
{
  return self->_containsEnd;
}

- (void)_setDrawsOwnHighlight:(BOOL)a3
{
  self->__drawsOwnHighlight = a3;
}

- (BOOL)_drawsOwnHighlight
{
  return self->__drawsOwnHighlight;
}

- (UITextSelectionRectCustomHandleInfo)_customHandleInfo
{
  return self->__customHandleInfo;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromCGRect(self->_rect);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; rect = %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_ui_isKindOfTextSelectionRect
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _UIMutableTextSelectionRect *v4;
  _UIMutableTextSelectionRect *v5;
  BOOL v6;
  objc_super v8;

  v4 = (_UIMutableTextSelectionRect *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (-[_UIMutableTextSelectionRect _ui_isKindOfTextSelectionRect](v4, "_ui_isKindOfTextSelectionRect"))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIMutableTextSelectionRect;
    v6 = -[UITextSelectionRect isEqual:](&v8, sel_isEqual_, v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end

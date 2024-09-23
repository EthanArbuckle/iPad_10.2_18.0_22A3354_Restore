@implementation PXGAnchorConstraint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spriteReference, 0);
}

- (void)setSpriteReference:(id)a3
{
  objc_storeStrong((id *)&self->_spriteReference, a3);
}

- (void)setSpriteAttribute:(int64_t)a3
{
  self->_spriteAttribute = a3;
}

- (void)setReferencingOptions:(unint64_t)a3
{
  self->_referencingOptions = a3;
}

- (PXGSpriteReference)spriteReference
{
  return self->_spriteReference;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  __int128 v5;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 3, self->_spriteReference);
  v4[4] = (id)self->_referencingOptions;
  v4[5] = (id)self->_spriteAttribute;
  *((_BYTE *)v4 + 8) = self->_visiblePortionOnly;
  v5 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)v4 + 4) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)v4 + 5) = v5;
  v4[6] = (id)self->_inequality;
  *((_DWORD *)v4 + 3) = self->_spriteEdge;
  *((_DWORD *)v4 + 4) = self->_visibleRectEdge;
  v4[7] = *(id *)&self->_offset;
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXGAnchorConstraint inequality](self, "inequality");
  -[PXGAnchorConstraint spriteReference](self, "spriteReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; inequality = %li, spriteReference = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)referencingOptions
{
  return self->_referencingOptions;
}

- (int64_t)spriteAttribute
{
  return self->_spriteAttribute;
}

- (BOOL)visiblePortionOnly
{
  return self->_visiblePortionOnly;
}

- (void)setVisiblePortionOnly:(BOOL)a3
{
  self->_visiblePortionOnly = a3;
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

- (int64_t)inequality
{
  return self->_inequality;
}

- (void)setInequality:(int64_t)a3
{
  self->_inequality = a3;
}

- (unsigned)spriteEdge
{
  return self->_spriteEdge;
}

- (void)setSpriteEdge:(unsigned int)a3
{
  self->_spriteEdge = a3;
}

- (unsigned)visibleRectEdge
{
  return self->_visibleRectEdge;
}

- (void)setVisibleRectEdge:(unsigned int)a3
{
  self->_visibleRectEdge = a3;
}

- (double)offset
{
  return self->_offset;
}

- (void)setOffset:(double)a3
{
  self->_offset = a3;
}

@end

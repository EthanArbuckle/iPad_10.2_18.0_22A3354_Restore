@implementation _UIDocumentCarouselViewLayoutAttributes

- (_UIDocumentCarouselViewLayoutAttributes)init
{
  _UIDocumentCarouselViewLayoutAttributes *result;
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentCarouselViewLayoutAttributes;
  result = -[_UIDocumentCarouselViewLayoutAttributes init](&v5, sel_init);
  if (result)
  {
    result->_alpha = 1.0;
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&result->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&result->_transform.c = v4;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)(v3 + 32);
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  double zIndex;
  double alpha;
  __int128 v10;
  void *v11;
  void *v12;
  CGAffineTransform transform;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_center);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_size);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  zIndex = self->_zIndex;
  alpha = self->_alpha;
  v10 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&transform.c = v10;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->_transform.tx;
  NSStringFromCGAffineTransform(&transform);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p center = %@; size = %@; zIndex = %g; alpha = %g; transform = %@"),
    v5,
    self,
    v6,
    v7,
    *(_QWORD *)&zIndex,
    *(_QWORD *)&alpha,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

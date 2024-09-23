@implementation SKUICollectionViewLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  objc_super v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUICollectionViewLayoutAttributes copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUICollectionViewLayoutAttributes;
  v13 = -[UICollectionViewLayoutAttributes copyWithZone:](&v15, sel_copyWithZone_, a3);
  objc_storeStrong(v13 + 44, self->_backgroundColor);
  v13[45] = (id)self->_position;
  v13[46] = *(id *)&self->_zoomingImageAlpha;
  v13[49] = *(id *)&self->_zoomingImageLambda;
  v13[47] = *(id *)&self->_zoomingImageWidth;
  v13[48] = *(id *)&self->_zoomingImageImposedAlphaOfOtherViews;
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  SKUICollectionViewLayoutAttributes *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIColor *backgroundColor;
  BOOL v14;
  objc_super v16;

  v4 = (SKUICollectionViewLayoutAttributes *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        -[SKUICollectionViewLayoutAttributes isEqual:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((backgroundColor = v4->_backgroundColor, backgroundColor == self->_backgroundColor)
       || -[UIColor isEqual:](backgroundColor, "isEqual:"))
      && v4->_position == self->_position
      && v4->_zoomingImageAlpha == self->_zoomingImageAlpha
      && v4->_zoomingImageLambda == self->_zoomingImageLambda
      && v4->_zoomingImageWidth == self->_zoomingImageWidth
      && v4->_zoomingImageImposedAlphaOfOtherViews == self->_zoomingImageImposedAlphaOfOtherViews)
    {
      v16.receiver = self;
      v16.super_class = (Class)SKUICollectionViewLayoutAttributes;
      v14 = -[UICollectionViewLayoutAttributes isEqual:](&v16, sel_isEqual_, v4);
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (double)zoomingImageAlpha
{
  return self->_zoomingImageAlpha;
}

- (void)setZoomingImageAlpha:(double)a3
{
  self->_zoomingImageAlpha = a3;
}

- (double)zoomingImageWidth
{
  return self->_zoomingImageWidth;
}

- (void)setZoomingImageWidth:(double)a3
{
  self->_zoomingImageWidth = a3;
}

- (double)zoomingImageImposedAlphaOfOtherViews
{
  return self->_zoomingImageImposedAlphaOfOtherViews;
}

- (void)setZoomingImageImposedAlphaOfOtherViews:(double)a3
{
  self->_zoomingImageImposedAlphaOfOtherViews = a3;
}

- (double)_zoomingImageLambda
{
  return self->_zoomingImageLambda;
}

- (void)_setZoomingImageLambda:(double)a3
{
  self->_zoomingImageLambda = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)isEqual:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end

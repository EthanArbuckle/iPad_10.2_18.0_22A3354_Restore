@implementation TPSCollectionViewLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSCollectionViewLayoutAttributes;
  v4 = -[TPSCollectionViewLayoutAttributes copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend(v4, "setParallaxOffset:", self->_parallaxOffset.x, self->_parallaxOffset.y);
  objc_msgSend(v4, "setEdgeParallaxOffset:", self->_edgeParallaxOffset.x, self->_edgeParallaxOffset.y);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  BOOL v10;
  CGPoint *p_edgeParallaxOffset;
  double v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSCollectionViewLayoutAttributes;
  if (!-[TPSCollectionViewLayoutAttributes isEqual:](&v15, "isEqual:", v4))
    goto LABEL_7;
  v6 = objc_opt_class(TPSCollectionViewLayoutAttributes, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
  {
    v10 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v4, "parallaxOffset");
  if (self->_parallaxOffset.x == v8 && self->_parallaxOffset.y == v7)
  {
    p_edgeParallaxOffset = &self->_edgeParallaxOffset;
    objc_msgSend(v4, "edgeParallaxOffset");
    v10 = p_edgeParallaxOffset->y == v13 && p_edgeParallaxOffset->x == v12;
  }
  else
  {
LABEL_7:
    v10 = 0;
  }
LABEL_12:

  return v10;
}

- (CGPoint)parallaxOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_parallaxOffset.x;
  y = self->_parallaxOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setParallaxOffset:(CGPoint)a3
{
  self->_parallaxOffset = a3;
}

- (CGPoint)edgeParallaxOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_edgeParallaxOffset.x;
  y = self->_edgeParallaxOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setEdgeParallaxOffset:(CGPoint)a3
{
  self->_edgeParallaxOffset = a3;
}

@end

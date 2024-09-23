@implementation PUCollectionViewLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUCollectionViewLayoutAttributes;
  v4 = -[UICollectionViewLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setParallaxOffset:", self->_parallaxOffset.x, self->_parallaxOffset.y);
  objc_msgSend(v4, "setEdgeParallaxOffset:", self->_edgeParallaxOffset.x, self->_edgeParallaxOffset.y);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  BOOL v8;
  CGPoint *p_edgeParallaxOffset;
  double v10;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUCollectionViewLayoutAttributes;
  if (!-[UICollectionViewLayoutAttributes isEqual:](&v13, sel_isEqual_, v4))
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 1;
    goto LABEL_12;
  }
  objc_msgSend(v4, "parallaxOffset");
  if (self->_parallaxOffset.x == v6 && self->_parallaxOffset.y == v5)
  {
    p_edgeParallaxOffset = &self->_edgeParallaxOffset;
    objc_msgSend(v4, "edgeParallaxOffset");
    v8 = p_edgeParallaxOffset->y == v11 && p_edgeParallaxOffset->x == v10;
  }
  else
  {
LABEL_7:
    v8 = 0;
  }
LABEL_12:

  return v8;
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

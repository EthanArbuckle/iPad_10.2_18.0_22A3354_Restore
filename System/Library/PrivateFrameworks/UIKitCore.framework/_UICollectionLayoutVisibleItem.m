@implementation _UICollectionLayoutVisibleItem

- (id)initWithLayoutAttributes:(void *)a3 layoutItem:
{
  id *v5;
  id *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_UICollectionLayoutVisibleItem;
  v5 = (id *)objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong(v5 + 2, a2);
    objc_storeStrong(v6 + 3, a3);
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutItem, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dirty);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: isDirty:%@; layoutAttributes:%@; layoutItem:%@>"),
    v5,
    self,
    v6,
    self->_layoutAttributes,
    self->_layoutItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (CATransform3D)transform3D
{
  CATransform3D *result;

  result = (CATransform3D *)self->_layoutAttributes;
  if (result)
    return (CATransform3D *)-[CATransform3D transform3D](result, "transform3D");
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  return result;
}

- (void)setTransform3D:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  self->_dirty = 1;
  v3 = *(_OWORD *)&a3->m33;
  v7[4] = *(_OWORD *)&a3->m31;
  v7[5] = v3;
  v4 = *(_OWORD *)&a3->m43;
  v7[6] = *(_OWORD *)&a3->m41;
  v7[7] = v4;
  v5 = *(_OWORD *)&a3->m13;
  v7[0] = *(_OWORD *)&a3->m11;
  v7[1] = v5;
  v6 = *(_OWORD *)&a3->m23;
  v7[2] = *(_OWORD *)&a3->m21;
  v7[3] = v6;
  -[UICollectionViewLayoutAttributes setTransform3D:](self->_layoutAttributes, "setTransform3D:", v7);
}

- (CGAffineTransform)transform
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->_layoutAttributes;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transform](result, "transform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _OWORD v4[3];

  self->_dirty = 1;
  v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  -[UICollectionViewLayoutAttributes setTransform:](self->_layoutAttributes, "setTransform:", v4);
}

- (double)alpha
{
  double result;

  -[UICollectionViewLayoutAttributes alpha](self->_layoutAttributes, "alpha");
  return result;
}

- (void)setAlpha:(double)a3
{
  self->_dirty = 1;
  -[UICollectionViewLayoutAttributes setAlpha:](self->_layoutAttributes, "setAlpha:", a3);
}

- (int64_t)zIndex
{
  return -[UICollectionViewLayoutAttributes zIndex](self->_layoutAttributes, "zIndex");
}

- (void)setZIndex:(int64_t)a3
{
  self->_dirty = 1;
  -[UICollectionViewLayoutAttributes setZIndex:](self->_layoutAttributes, "setZIndex:", a3);
}

- (NSIndexPath)indexPath
{
  return -[UICollectionViewLayoutAttributes indexPath](self->_layoutAttributes, "indexPath");
}

- (BOOL)isHidden
{
  return -[UICollectionViewLayoutAttributes isHidden](self->_layoutAttributes, "isHidden");
}

- (void)setHidden:(BOOL)a3
{
  self->_dirty = 1;
  -[UICollectionViewLayoutAttributes setHidden:](self->_layoutAttributes, "setHidden:", a3);
}

- (NSString)name
{
  return (NSString *)-[NSCollectionLayoutItem name](self->_layoutItem, "name");
}

- (unint64_t)representedElementCategory
{
  UICollectionViewLayoutAttributes *layoutAttributes;
  __int16 layoutFlags;
  unint64_t v4;

  layoutAttributes = self->_layoutAttributes;
  if (!layoutAttributes)
    return 0;
  layoutFlags = (__int16)layoutAttributes->_layoutFlags;
  v4 = 1;
  if ((layoutFlags & 2) != 0)
    v4 = 2;
  if ((layoutFlags & 1) != 0)
    return 0;
  else
    return v4;
}

- (NSString)representedElementKind
{
  return -[UICollectionViewLayoutAttributes representedElementKind](self->_layoutAttributes, "representedElementKind");
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UICollectionViewLayoutAttributes frame](self->_layoutAttributes, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)center
{
  double v2;
  double v3;
  CGPoint result;

  -[UICollectionViewLayoutAttributes center](self->_layoutAttributes, "center");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_dirty = 1;
  -[UICollectionViewLayoutAttributes setCenter:](self->_layoutAttributes, "setCenter:", a3.x, a3.y);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UICollectionViewLayoutAttributes bounds](self->_layoutAttributes, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end

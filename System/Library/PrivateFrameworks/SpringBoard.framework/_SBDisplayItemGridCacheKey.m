@implementation _SBDisplayItemGridCacheKey

- (_SBDisplayItemGridCacheKey)initWithBounds:(CGRect)a3 orientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v16;
  id v17;
  _SBDisplayItemGridCacheKey *v18;
  _SBDisplayItemGridCacheKey *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = a5;
  v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)_SBDisplayItemGridCacheKey;
  v18 = -[_SBDisplayItemGridCacheKey init](&v27, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_bounds.origin.x = x;
    v18->_bounds.origin.y = y;
    v18->_bounds.size.width = width;
    v18->_bounds.size.height = height;
    v18->_orientation = a4;
    objc_storeStrong((id *)&v18->_layoutRestrictionInfo, a5);
    v19->_screenScale = a6;
    objc_storeStrong((id *)&v19->_chamoisLayoutAttributes, a7);
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)objc_msgSend(v20, "appendCGRect:", v19->_bounds.origin.x, v19->_bounds.origin.y, v19->_bounds.size.width, v19->_bounds.size.height);
    v22 = (id)objc_msgSend(v20, "appendInteger:", v19->_orientation);
    v23 = (id)objc_msgSend(v20, "appendObject:", v19->_layoutRestrictionInfo);
    v24 = (id)objc_msgSend(v20, "appendCGFloat:", v19->_screenScale);
    if (v19->_chamoisLayoutAttributes)
      v25 = (id)objc_msgSend(v20, "appendObject:");
    v19->_cachedHash = objc_msgSend(v20, "hash");

  }
  return v19;
}

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  _SBDisplayItemGridCacheKey *v4;
  _SBDisplayItemGridCacheKey *v5;
  char v6;

  v4 = (_SBDisplayItemGridCacheKey *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (CGRectEqualToRect(self->_bounds, v5->_bounds)
        && self->_orientation == v5->_orientation
        && BSEqualObjects()
        && self->_screenScale == v5->_screenScale)
      {
        v6 = BSEqualObjects();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chamoisLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_layoutRestrictionInfo, 0);
}

@end

@implementation _UIImageViewPretiledImageCacheKey

+ (id)cacheKeyWithOriginalImage:(id)a3 pretiledSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v6;
  _UIImageViewPretiledImageCacheKey *v7;
  _UIImageViewPretiledImageCacheKey *v8;
  _UIImageViewPretiledImageCacheKey *v9;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = objc_alloc_init(_UIImageViewPretiledImageCacheKey);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_originalImage, v6);
    v8->_pretiledSize.width = width;
    v8->_pretiledSize.height = height;
    v9 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  id WeakRetained;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_originalImage);
  v4 = (unint64_t)(self->_pretiledSize.height + self->_pretiledSize.width
                                                     + (double)(unint64_t)WeakRetained);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id WeakRetained;
  id v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    WeakRetained = objc_loadWeakRetained(v5 + 1);
    v7 = objc_loadWeakRetained((id *)&self->_originalImage);
    v8 = WeakRetained == v7
      && *((double *)v5 + 3) == self->_pretiledSize.height
      && *((double *)v5 + 2) == self->_pretiledSize.width;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_originalImage);
  NSStringFromCGSize(self->_pretiledSize);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; originalImage = %@; pretiledSize = %@>"),
    v4,
    self,
    WeakRetained,
    v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originalImage);
}

@end

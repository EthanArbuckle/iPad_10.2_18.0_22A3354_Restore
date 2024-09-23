@implementation _UIShadowViewImageCacheKey

- (_UIShadowViewImageCacheKey)initWithSize:(double)a3 scale:(double)a4 options:(unint64_t)a5
{
  _UIShadowViewImageCacheKey *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIShadowViewImageCacheKey;
  result = -[_UIShadowViewImageCacheKey init](&v9, sel_init);
  if (result)
  {
    result->_scale = a4;
    result->_size = a3;
    result->_options = a5;
  }
  return result;
}

- (unint64_t)hash
{
  return (unint64_t)self->_scale ^ (unint64_t)self->_size ^ self->_options;
}

- (BOOL)isEqual:(id)a3
{
  _UIShadowViewImageCacheKey *v4;
  BOOL v5;

  v4 = (_UIShadowViewImageCacheKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_UIShadowViewImageCacheKey isEqualToCacheKey:](self, "isEqualToCacheKey:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  v5 = v4 && self->_options == *((_QWORD *)v4 + 3) && self->_size == v4[2] && self->_scale == v4[1];

  return v5;
}

@end

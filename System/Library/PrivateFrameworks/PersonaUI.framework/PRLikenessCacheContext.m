@implementation PRLikenessCacheContext

+ (id)contextWithCacheSize:(unint64_t)a3
{
  _QWORD *v4;

  v4 = objc_alloc_init((Class)a1);
  v4[2] = a3;
  return v4;
}

- (PRLikenessCacheContext)init
{
  PRLikenessCacheContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRLikenessCacheContext;
  result = -[PRLikenessCacheContext init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_circular = 0;
    result->_scale = 1.0;
  }
  return result;
}

- (unint64_t)cacheSize
{
  return self->_cacheSize;
}

- (void)setCacheSize:(unint64_t)a3
{
  self->_cacheSize = a3;
}

- (BOOL)circular
{
  return self->_circular;
}

- (void)setCircular:(BOOL)a3
{
  self->_circular = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (BOOL)forceDecode
{
  return self->_forceDecode;
}

- (void)setForceDecode:(BOOL)a3
{
  self->_forceDecode = a3;
}

@end

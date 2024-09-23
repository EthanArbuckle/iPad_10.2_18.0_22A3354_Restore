@implementation PKEditPendingCacheRequest

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = PKEqualObjects();
  else
    v4 = 0;

  return v4;
}

- (unint64_t)hash
{
  -[NSString hash](self->_cacheKey, "hash");
  return PKIntegerHash();
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_storeStrong((id *)&self->_cacheKey, a3);
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);
}

- (BOOL)fullPass
{
  return self->_fullPass;
}

- (void)setFullPass:(BOOL)a3
{
  self->_fullPass = a3;
}

- (BOOL)stacked
{
  return self->_stacked;
}

- (void)setStacked:(BOOL)a3
{
  self->_stacked = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (NSArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_completionHandlers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
}

@end

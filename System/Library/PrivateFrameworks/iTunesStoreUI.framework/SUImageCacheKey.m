@implementation SUImageCacheKey

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUImageCacheKey;
  -[SUImageCacheKey dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SUImageCacheKey *v5;

  v5 = objc_alloc_init(SUImageCacheKey);
  v5->_dataProvider = (SUImageDataProvider *)-[SUImageDataProvider copyWithZone:](self->_dataProvider, "copyWithZone:", a3);
  v5->_url = (NSURL *)-[NSURL copyWithZone:](self->_url, "copyWithZone:", a3);
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[SUImageDataProvider hash](self->_dataProvider, "hash");
  return -[NSURL hash](self->_url, "hash") + v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[SUImageDataProvider isEqual:](self->_dataProvider, "isEqual:", *((_QWORD *)a3 + 1)))
  {
    return -[NSURL isEqual:](self->_url, "isEqual:", *((_QWORD *)a3 + 2));
  }
  else
  {
    return 0;
  }
}

@end

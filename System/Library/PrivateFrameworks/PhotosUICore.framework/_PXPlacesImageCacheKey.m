@implementation _PXPlacesImageCacheKey

- (_PXPlacesImageCacheKey)initWithGeotaggable:(id)a3 andKey:(id)a4
{
  id v7;
  id v8;
  _PXPlacesImageCacheKey *v9;
  _PXPlacesImageCacheKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXPlacesImageCacheKey;
  v9 = -[_PXPlacesImageCacheKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_geotaggable, a3);
    objc_storeStrong((id *)&v10->_key, a4);
  }

  return v10;
}

- (id)geotaggable
{
  return self->_geotaggable;
}

- (id)key
{
  return self->_key;
}

- (BOOL)isEqual:(id)a3
{
  _PXPlacesImageCacheKey *v4;
  _PXPlacesImageCacheKey *v5;
  _PXPlacesImageCacheKey *v6;
  PXPlacesGeotaggable *geotaggable;
  NSString *key;
  void *v9;
  int v10;
  char v11;
  NSString *v12;
  void *v13;

  v4 = (_PXPlacesImageCacheKey *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v6 = v4;
    geotaggable = self->_geotaggable;
    key = self->_key;
    -[_PXPlacesImageCacheKey geotaggable](v6, "geotaggable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXPlacesGeotaggable isEqual:](geotaggable, "isEqual:", v9);
    if (key)
      v11 = 0;
    else
      v11 = v10;
    if (key && v10)
    {
      v12 = self->_key;
      -[_PXPlacesImageCacheKey key](v6, "key");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSString isEqual:](v12, "isEqual:", v13);

    }
  }

  return v11;
}

- (unint64_t)hash
{
  NSString *key;
  unint64_t v4;

  key = self->_key;
  v4 = -[PXPlacesGeotaggable hash](self->_geotaggable, "hash");
  if (key)
    v4 ^= -[NSString hash](self->_key, "hash");
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_geotaggable, 0);
}

@end

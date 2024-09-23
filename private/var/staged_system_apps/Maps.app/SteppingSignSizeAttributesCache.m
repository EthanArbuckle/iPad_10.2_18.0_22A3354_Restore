@implementation SteppingSignSizeAttributesCache

- (SteppingSignSizeAttributesCache)init
{
  SteppingSignSizeAttributesCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *attributesCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SteppingSignSizeAttributesCache;
  v2 = -[SteppingSignSizeAttributesCache init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    attributesCache = v2->_attributesCache;
    v2->_attributesCache = v3;

  }
  return v2;
}

- (id)sizeAttributesForSignAtIndex:(int64_t)a3 fittingSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  NSMutableDictionary *attributesCache;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  CGSize v13;

  height = a4.height;
  width = a4.width;
  attributesCache = self->_attributesCache;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](attributesCache, "objectForKey:", v7));

  v13.width = width;
  v13.height = height;
  v9 = NSStringFromCGSize(v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v10));

  return v11;
}

- (void)setSizeAttributes:(id)a3 forSignAtIndex:(int64_t)a4 fittingSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  NSMutableDictionary *attributesCache;
  id v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSString *v14;
  void *v15;
  id v16;
  CGSize v17;

  height = a5.height;
  width = a5.width;
  attributesCache = self->_attributesCache;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v16 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](attributesCache, "objectForKey:", v11));

  if (!v16)
  {
    v16 = objc_alloc_init((Class)NSMutableDictionary);
    v12 = self->_attributesCache;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v16, v13);

  }
  v17.width = width;
  v17.height = height;
  v14 = NSStringFromCGSize(v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v16, "setObject:forKey:", v10, v15);

}

- (void)invalidateSizeAttributes
{
  -[NSMutableDictionary removeAllObjects](self->_attributesCache, "removeAllObjects");
}

- (void)invalidateSizeAttributesForSignAtIndex:(int64_t)a3
{
  NSMutableDictionary *attributesCache;
  id v4;

  attributesCache = self->_attributesCache;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary removeObjectForKey:](attributesCache, "removeObjectForKey:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributesCache, 0);
}

@end

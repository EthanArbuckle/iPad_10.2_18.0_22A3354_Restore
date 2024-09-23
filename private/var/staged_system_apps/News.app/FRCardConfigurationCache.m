@implementation FRCardConfigurationCache

- (FRCardConfigurationCache)init
{
  FRCardConfigurationCache *v2;
  FCThreadSafeMutableDictionary *v3;
  FCThreadSafeMutableDictionary *fontCache;
  NSMutableDictionary *v5;
  NSMutableDictionary *imageCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FRCardConfigurationCache;
  v2 = -[FRCardConfigurationCache init](&v8, "init");
  if (v2)
  {
    v3 = (FCThreadSafeMutableDictionary *)objc_alloc_init((Class)FCThreadSafeMutableDictionary);
    fontCache = v2->_fontCache;
    v2->_fontCache = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    imageCache = v2->_imageCache;
    v2->_imageCache = v5;

  }
  return v2;
}

- (id)cacheFontItemForFontSize:(double)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a3));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100018644;
  v16 = sub_100018544;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfigurationCache fontCache](self, "fontCache"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100055F34;
  v9[3] = &unk_1000DCFB8;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "readWriteWithAccessor:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)cacheImageItemForCardSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  FRCardConfigurationCacheImageItem *v10;
  void *v11;
  CGSize v13;

  height = a3.height;
  width = a3.width;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v13.width = width;
  v13.height = height;
  v6 = NSStringFromCGSize(v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfigurationCache imageCache](self, "imageCache"));
  v10 = (FRCardConfigurationCacheImageItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

  if (!v10)
  {
    v10 = objc_alloc_init(FRCardConfigurationCacheImageItem);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRCardConfigurationCache imageCache](self, "imageCache"));
    objc_msgSend(v11, "setObject:forKey:", v10, v8);

  }
  return v10;
}

- (FCThreadSafeMutableDictionary)fontCache
{
  return (FCThreadSafeMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFontCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_fontCache, 0);
}

@end

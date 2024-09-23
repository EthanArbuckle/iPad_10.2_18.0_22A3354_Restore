@implementation _TUICachedMediaBackdropImageResource

- (_TUICachedMediaBackdropImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 naturalSize:(CGSize)a6 contentsScale:(double)a7 resource:(id)a8
{
  _TUICachedMediaBackdropImageResource *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TUICachedMediaBackdropImageResource;
  result = -[_TUICachedPipelineImageResource initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:](&v9, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:", a3, a4, a5, a8, a6.width, a6.height, a7);
  if (result)
    result->_operationLock._os_unfair_lock_opaque = 0;
  return result;
}

- (id)debugFunctionalDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedPipelineImageResource imageResource](self, "imageResource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "debugFunctionalDescription"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@).MediaBackdropSnapshot"), v3));

  return v4;
}

- (void)applyToImage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  _QWORD v15[5];
  id v16;
  double v17;

  v6 = a4;
  v7 = a3;
  -[_TUICachedImageResource contentsScale](self, "contentsScale");
  v9 = v8;
  -[_TUICachedImageResource naturalSize](self, "naturalSize");
  v11 = v9 * v10;
  -[_TUICachedImageResource naturalSize](self, "naturalSize");
  v13 = v9 * v12;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_A0ADC;
  v15[3] = &unk_240650;
  v15[4] = self;
  v16 = v6;
  v17 = v9;
  v14 = v6;
  +[TUIMediaBackdropSnapshotRenderer renderWithContent:size:contentScale:completionHandler:](TUIMediaBackdropSnapshotRenderer, "renderWithContent:size:contentScale:completionHandler:", v7, v15, v11, v13, v9);

}

- (id)sizedKey
{
  id v3;
  void *v4;
  _TUICachedImageFilterInfo *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _TUICachedImageFilterInfo *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_TUICachedMediaBackdropImageResource;
  v3 = -[_TUICachedPipelineImageResource sizedKey](&v14, "sizedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = [_TUICachedImageFilterInfo alloc];
  -[_TUICachedImageResource naturalSize](self, "naturalSize");
  v7 = v6;
  v9 = v8;
  -[_TUICachedImageResource contentsScale](self, "contentsScale");
  v11 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:](v5, "initWithFilter:naturalSize:contentsScale:", 0, v7, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheKeyWithFilterInfo:", v11));

  return v12;
}

- (id)unsizedKey
{
  id v3;
  void *v4;
  _TUICachedImageFilterInfo *v5;
  double v6;
  _TUICachedImageFilterInfo *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_TUICachedMediaBackdropImageResource;
  v3 = -[_TUICachedPipelineImageResource unsizedKey](&v10, "unsizedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = [_TUICachedImageFilterInfo alloc];
  -[_TUICachedImageResource contentsScale](self, "contentsScale");
  v7 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:](v5, "initWithFilter:naturalSize:contentsScale:", 0, CGSizeZero.width, CGSizeZero.height, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheKeyWithFilterInfo:", v7));

  return v8;
}

+ (id)sizedKeyForNaturalSize:(CGSize)a3 contentsScale:(double)a4 imageResource:(id)a5
{
  double height;
  double width;
  void *v8;
  _TUICachedImageFilterInfo *v9;
  void *v10;

  height = a3.height;
  width = a3.width;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "sizedKey"));
  v9 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", 0, width, height, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cacheKeyWithFilterInfo:", v9));

  return v10;
}

+ (id)unsizedKeyForContentsScale:(double)a3 imageResource:(id)a4
{
  void *v5;
  _TUICachedImageFilterInfo *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "unsizedKey"));
  v6 = -[_TUICachedImageFilterInfo initWithFilter:naturalSize:contentsScale:]([_TUICachedImageFilterInfo alloc], "initWithFilter:naturalSize:contentsScale:", 0, CGSizeZero.width, CGSizeZero.height, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cacheKeyWithFilterInfo:", v6));

  return v7;
}

@end

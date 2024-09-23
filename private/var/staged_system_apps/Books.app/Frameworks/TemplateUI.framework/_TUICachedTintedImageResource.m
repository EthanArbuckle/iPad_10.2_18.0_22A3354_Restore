@implementation _TUICachedTintedImageResource

- (id)debugFunctionalDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedPipelineImageResource imageResource](self, "imageResource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "debugFunctionalDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@).tintColor(%@)"), v4, self->_color));

  return v5;
}

- (_TUICachedTintedImageResource)initWithCache:(id)a3 unsizedCacheSet:(id)a4 queue:(id)a5 resource:(id)a6 color:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _TUICachedTintedImageResource *v22;
  uint64_t v23;
  UIColor *color;
  objc_super v26;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v13, "naturalSize");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v13, "contentsScale");
  v26.receiver = self;
  v26.super_class = (Class)_TUICachedTintedImageResource;
  v22 = -[_TUICachedPipelineImageResource initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:](&v26, "initWithCache:unsizedCacheSet:queue:naturalSize:contentsScale:resource:", v16, v15, v14, v13, v18, v20, v21);

  if (v22)
  {
    v23 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(v12), "CGColor")));
    color = v22->_color;
    v22->_color = (UIColor *)v23;

  }
  return v22;
}

+ (id)sizedKeyForColor:(id)a3 imageResource:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "sizedKey"));
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "CGColor");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cacheKeyWithColor:", v9));

  return v10;
}

+ (id)unsizedKeyForColor:(id)a3 imageResource:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "unsizedKey"));
  v7 = objc_retainAutorelease(v5);
  v8 = objc_msgSend(v7, "CGColor");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cacheKeyWithColor:", v9));

  return v10;
}

- (id)sizedKey
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TUICachedTintedImageResource;
  v3 = -[_TUICachedPipelineImageResource sizedKey](&v7, "sizedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheKeyWithColor:", self->_color));

  return v5;
}

- (id)unsizedKey
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TUICachedTintedImageResource;
  v3 = -[_TUICachedPipelineImageResource unsizedKey](&v7, "unsizedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cacheKeyWithColor:", self->_color));

  return v5;
}

- (void)applyToImage:(id)a3 completion:(id)a4
{
  void (**v6)(id, id);
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, id))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "image"));
  v8 = objc_msgSend(v7, "newImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tui_imageMaskWithColor:", self->_color));

  if (v9)
    v10 = objc_msgSend(objc_alloc((Class)BCUPurgeableImage), "initWithImage:", v9);
  else
    v10 = 0;
  objc_msgSend(v11, "insets");
  v6[2](v6, v10);

}

- (id)newImageResourceWithSize:(CGSize)a3
{
  double height;
  double width;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  WeakRetained = objc_loadWeakRetained((id *)&self->super.super._cache);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TUICachedPipelineImageResource imageResource](self, "imageResource"));
  v8 = objc_msgSend(v7, "newImageResourceWithSize:", width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "imageResource:tintedWithColor:", v8, self->_color));

  return v9;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_tintedImage, 0);
}

@end
